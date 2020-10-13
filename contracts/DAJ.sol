pragma solidity ^0.6.2;

import "@opengsn/gsn/contracts/BaseRelayRecipient.sol";
import "@opengsn/gsn/contracts/interfaces/IKnowForwarderAddress.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DAJ is
    Ownable,
    BaseRelayRecipient,
    IKnowForwarderAddress,
    AccessControl
{
    // Version
    string public override versionRecipient = "0.1.0";

    // Roles
    bytes32 public constant PUB_ROLE = keccak256("PUB_ROLE");
    bytes32 public constant EDITOR_ROLE = keccak256("EDITOR_ROLE");

    // Articles
    mapping(address => bytes32[]) public articles;

    // Events
    event ArticleSubmitted(
        bytes32 indexed _from,
        bytes32 indexed _id,
        uint256 _value
    );

    // Can anyone submit an article?
    bool public openToPublic;

    constructor(address adm, bool _openToPublic) public {
        // Initiate access control
        _setupRole(DEFAULT_ADMIN_ROLE, adm);
        _setupRole(PUB_ROLE, adm);
        // Set trusted forwarder
        trustedForwarder = 0xa7f424352c754375aC3341eFC8a7fe70342d870B;
        openToPublic = _openToPublic;
    }

    function setOpenToPublic(bool _newValue) public {
        require(
            hasRole(PUB_ROLE, _msgSender()) ||
                hasRole(DEFAULT_ADMIN_ROLE, _msgSender()),
            "Caller must be admin or publisher"
        );
        openToPublic = _newValue;
    }

    // GSN forwarder
    function getTrustedForwarder() public override view returns (address) {
        return trustedForwarder;
    }

    // Allow admin to change trusted forwarder
    function setTrustedForwarder(address newForwarder) public {
        require(
            hasRole(DEFAULT_ADMIN_ROLE, _msgSender()),
            "Caller must be admin"
        );
        trustedForwarder = newForwarder;
    }

    /**
     * Return the sender of this call.
     * If the call came through our trusted forwarder, return the original sender.
     * Otherwise, return `msg.sender`.
     */
    function _msgSender()
        internal
        virtual
        override(BaseRelayRecipient, Context)
        view
        returns (address payable)
    {
        if (msg.data.length >= 24 && isTrustedForwarder(msg.sender)) {
            // At this point we know that the sender is a trusted forwarder,
            // so we trust that the last bytes of msg.data are the verified sender address.
            // extract sender address from the end of msg.data
            return
                address(
                    uint160(
                        MinLibBytes.readAddress(msg.data, msg.data.length - 20)
                    )
                );
        }
        return msg.sender;
    }

    function submitArticle() {}
}

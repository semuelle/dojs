pragma solidity 0.7.0;

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

    constructor(address adm) public {
        // Initiate access control
        _setupRole(DEFAULT_ADMIN_ROLE, adm);
        _setupRole(PUB_ROLE, adm);
        // Set trusted forwarder
        trustedForwarder = 0xa7f424352c754375aC3341eFC8a7fe70342d870B;
    }

    function getTrustedForwarder() public override view returns (address) {
        return trustedForwarder;
    }

    function setTrustedForwarder(address newForwarder) public {
        require(hasRole(ADMIN_ROLE, _msg.sender()), "Caller must be admin");
        trustedForwarder = newForwarder;
    }
}

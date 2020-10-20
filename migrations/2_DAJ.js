const DAJ = artifacts.require("DAJ");

module.exports = function(deployer, network, accounts) {
  deployer.deploy(DAJ, accounts[0], false);
};

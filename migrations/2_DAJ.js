const DAJ = artifacts.require("DAJ");

module.exports = function(deployer, network, accounts) {
  console.log(accounts[0]);
  deployer.deploy(DAJ, accounts[0]);
};

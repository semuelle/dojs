const HDWalletProvider = require("@truffle/hdwallet-provider");
const fs = require("fs");

const secretMnemonicFile = "./.mnemonic";
let secretMnemonic;
if (fs.existsSync(secretMnemonicFile)) {
  secretMnemonic = fs
    .readFileSync(secretMnemonicFile, { encoding: "utf8" })
    .toString()
    .trim();
} else {
  console.error("Invalid mnemonic file provided");
}

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 9545,
      network_id: "*",
    },
    bloxberg: {
      provider: function() {
        return new HDWalletProvider(
          secretMnemonic,
          "https://core.bloxberg.org"
        );
      },
      network_id: 8995,
    },
  },

  compilers: {
    solc: {
      version: "^0.6.2",
      // docker: true,
      settings: {
        optimizer: {
          enabled: false,
          runs: 200,
        },
        evmVersion: "istanbul",
      },
    },
  },
};

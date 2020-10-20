import Web3 from "web3";
import dajArtifact from "../../build/contracts/DAJ.json";

// Some hardcoded vars
const settings = {
  DAJ_ADDRESS: "0x0Cc65D063284583cB543616EeC852F59F5ac7bBe",
  RELAYHUB_ADDRESS: "0x8159a4E1BCF35B0A45Eb9C337FbCdD2E38001860",
};

const App = {
  web3: null,
  account: null,
  daj: null,

  start: async function() {
    const { web3 } = this;

    try {
      // get contract instance
      this.daj = new web3.eth.Contract(dajArtifact.abi, settings.DAJ_ADDRESS);
      console.log(this.daj);

      // get accounts
      const accounts = await web3.eth.getAccounts();
      this.account = accounts[0];

      this.getOpenToPublic();
    } catch (error) {
      console.error("Could not connect to contract or chain.");
    }
  },

  getOpenToPublic: async function() {
    // console.log(this.daj.methods);
    const { openToPublic } = this.daj.methods;
    const openToPublicResult = await openToPublic().call();

    const openToPublicElement = document.getElementsByClassName("open")[0];
    if (openToPublicResult) {
      openToPublicElement.innerHTML = "";
    } else {
      openToPublicElement.innerHTML = "not";
    }
  },

  submitArticle: async function() {
    const title = parseInt(document.getElementById("title").value);
    const author = document.getElementById("author").value;

    this.setStatus("Initiating transaction... (please wait)");

    const { submitArticle } = this.daj.methods;
    await submitArticle(title, author).send({ from: this.account });

    this.setStatus("Transaction complete!");
  },

  setStatus: function(message) {
    const status = document.getElementById("status");
    status.innerHTML = message;
  },
};

window.App = App;

window.addEventListener("load", function() {
  if (window.ethereum) {
    // use MetaMask's provider
    App.web3 = new Web3(window.ethereum);
    window.ethereum.enable(); // get permission to access accounts
  } else {
    console.error(
      "No web3 detected. Falling back to http://127.0.0.1:8545. You should remove this fallback when you deploy live"
    );
  }

  App.start();
});

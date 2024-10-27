require('dotenv').config()
const Web3 = require('web3');
const web3 = new Web3(new Web3.providers.HttpProvider(process.env.RPC_URL));

const fs = require('fs');
const contractABI = JSON.parse(fs.readFileSync('./build/contracts/MyERC20.json')).abi;

const contractAddress = process.env.ERC20;
const contract = new web3.eth.Contract(contractABI, contractAddress);

async function balanceOf(_account) {
    const balance = await contract.methods.balanceOf(_account).call();
    console.log(`Balance of ${_account} is ${balance}`)
    console.log(`Balance of ${_account} is ${web3.utils.fromWei(balance,'ether')}`)
}

balanceOf(process.env.PUBLIC_KEY)
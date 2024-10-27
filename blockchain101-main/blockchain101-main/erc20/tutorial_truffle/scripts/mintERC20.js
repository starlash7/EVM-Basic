const fs = require('fs');
const contractABI = JSON.parse(fs.readFileSync('./build/contracts/MyERC20.json')).abi;
require('dotenv').config()
var Web3 = require('web3');

//truffle migrate를 해서 나온 contract address
const contractAddress = process.env.ERC20;
const web3 = new Web3(new Web3.providers.HttpProvider(process.env.RPC_URL));
const contract = new web3.eth.Contract(contractABI, contractAddress);

async function mintERC20(_to, _value) {
  const singedTx = await web3.eth.accounts.signTransaction({
    from: process.env.PUBLIC_KEY,
    to: contractAddress,
    gasLimit: 2000000,
    data: contract.methods.mint(_to, _value.toString()).encodeABI() 
  }, process.env.PRIVATE_KEY)
  
  console.log("singedTx >>", singedTx.rawTransaction)
  await web3.eth.sendSignedTransaction(singedTx.rawTransaction.toString('hex'))
  .on('receipt', console.log);
  
}

mintERC20(process.env.PUBLIC_KEY, 10)
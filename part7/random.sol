//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Random {
    event PaidAddress(address indexed sender, uint256 payment);
    event WinnerAddress(address indexed winner);

    modifier onlyOwner(){ 
        require(msg.sender == owner, "Ownable: call");
        _;
    }

    mapping(uint256 => mapping (address => bool)) public paidAddressList;

    address public owner;
    uint private winnerNumber = 0;
    string private key1;
    uint private key2;

    uint public round = 1;
    uint public playNumber = 0;

    constructor(string memory _key1, uint _key2) {
        owner = msg.sender;
        key1 = _key1;
        key2 = _key2;
        winnerNumber = randomNumber();
    } 
    receive() external payable {
        require(msg.value == 10**16, "Must be 0.01 ether.");
        require(paidAddressList[round][msg.sender] == false, "Must be the first time.");
        paidAddressList[round][msg.sender] = true;
        ++playNumber;

        if(playNumber == winnerNumber){
            (bool success,) = msg.sender.call{value:address(this).balance}("");
            require(success,"Failed");
            playNumber = 0;
            ++round;

            winnerNumber = randomNumber();
            emit WinnerAddress(msg.sender, msg.value);
        } else {
            emit paidAddress(msg.sender, msg.value)
        }
        }

}
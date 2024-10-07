//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Ex6_9 {
    uint public a = 10;
    function myBlock(uint b) public returns(uint) {
        a = b;
        return a;
    }
}
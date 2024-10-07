//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract fs1 {
    function getValue(uint a) public pure returns(uint) {
        return a;
    }
    function getReference(string memory a) public pure returns(string memory) {
        return a;
    }
}
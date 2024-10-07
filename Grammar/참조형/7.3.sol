//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Ex7_2 {
    function myBlock(string calldata str) external pure returns(string memory) {
        return str;
    }
}
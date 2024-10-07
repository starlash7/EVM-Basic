//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Ex6_4 {
    uint public a = 2;

    function myBlock() public returns(uint) {
        a = 200;
        return a;
    }
}
//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Ex8_2{
    function block1(uint a) public pure returns(uint) {
        if(a>=3) {
            a = 9;
        } else {
            a = 10;
        }
        return a;
    }
}
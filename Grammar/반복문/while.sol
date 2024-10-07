//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract while1 {
    function fun1() public pure returns(uint) {
        uint result = 0;
        uint i = 3;
        while(i>0) {
            result = result + i;
            --i;
        }
        return result;
    }
}
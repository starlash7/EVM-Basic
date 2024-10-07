//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract for1{
    function fun1() public pure returns(uint) {
        uint result = 0;
        for(uint i = 0; i < 3; ++i) {
            result = result + i;
        }
        return result;
    }
}
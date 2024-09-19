//시프트 연산자

//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Ex2_8 {

    bytes1 a = 0x10;

    function left() public view returns (bytes1) {
        return a<<1;
    }
    
    function right() public view returns (bytes1) {
        return a>>1;
    }

}
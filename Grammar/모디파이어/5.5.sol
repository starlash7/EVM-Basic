//View와 Pure

//함수의 참조타입 사용시 매개변수 반호나 값 변수 메모리 지정

//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract ViewAndPure {
    uint public x = 1;

    function addToX(uint y) public view returns(uint) {
        return x + y;
    }
    
    function add(uint i, uint j) public pure returns(uint) {
        return i + j;
    }
}
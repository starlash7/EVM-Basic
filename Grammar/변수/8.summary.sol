//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Block {
    //상태 변수: 블록체인에 저장, 기록됨. 외부선언 가능
    string public a = "Hello Solidity";
    uint public b = 1;

    function getBlock() public {
        //지역변수: 블록체인에 기록 안됨. 내부선언 가능
        uint c = 2;

        //전역변수
        uint d = block.timestamp;
        address e = msg.sender;
    }
}
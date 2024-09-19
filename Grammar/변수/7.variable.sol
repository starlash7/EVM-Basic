//솔리디티 전체 변수 정리 
//상태변수 지역 변수 글로벌 변수 

//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Variable {
    string public text = "Hi pixy7";
    uint public num = 123;

    function doSomething() public {
        //지역 변수는 블록체인에 저장되지 않는다
        uint i = 456;

        uint timestamp = block.timestamp; //현재 시간 기록
        address sender = msg.sender; // 보내는 이의 주소값
    }
}
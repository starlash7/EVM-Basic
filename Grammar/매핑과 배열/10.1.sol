//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

//매핑
//스토리지 데이터 영역에서만 사용가능한 특수참조형
//상태변수 또는 스토리지 참조형으로만 선언 가능

mapping(address => int) public fast;
containkey()함수 > 누락된 키값을 얻으려하면 기본값이 반환됨

// fast매핑 존재하지 않는 주소의 잔액을 얻으려하면 당연히 0이 반환됨
int missingAddressBalance = coinBalance[0x61C15291028d082...]; // missingAddressBalance = 0;


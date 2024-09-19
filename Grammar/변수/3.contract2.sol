//컨트랙트 실습

//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract TEST {
    string public constant name = "TEST token";
    string public constant symbol = "TEST";
    uint public constant decimals = 18;
    uint public constant INITIAL_SUPPLY = 1000 * 10 ** decimals;
    string constant test = "You can not see this";
}

// 변수 선언시 public를 하지 않으면 외부에서 해당 변수를 찾을 수 없음.

// constant (상수) : 변하지 않는 변수 선언.

// public : 누구나 확인 할 수 있는 변수 선언.

// string : 문자열

// uint : unsigned integer (부호(+,-) 없는 정수- 양수 범위를 2배로 늘리게 됨, 즉 이진수와 같은 십진수가 됨)
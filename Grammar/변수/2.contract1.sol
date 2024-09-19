//컨트랙트 실습

//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract HelloFast{
    string private stateVariable = "Hello Fast";

    function GetHelloFast() public view returns(string memory) {
        return stateVariable;
    }
}
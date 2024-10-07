//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Q1 {
    mapping(address => uint) public balances;
    function add(address _key, uint _amount) public {
        balances[_key] = _amount;
    }

    function delete1(address _key) public {
        delete(balances[_key]);
    }
}
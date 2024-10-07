//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Loop{
    uint[] public num;

    function doWhileLoop() public {
        uint x = 0;
        do{
            num.push(x * 3);
            x++;
        }
        while(x !=5);
    }
}
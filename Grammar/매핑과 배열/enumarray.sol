//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

//enum과 array의 차이
// enum은 나열형, 연관된 상수를 묶어 값을 지정하는 자료형
// 같은 이름을 가지게 되는 상수끼리 충돌 방지

enum Fruits{apple, banana, peach}
enum Fruits{apple, banana=5, peach}

enum Gold {gold,silver,bronze}
enum Rank {gold=1,silver,bronze}
Rank foo = Rank.gold;
Rank doo = Rank.silver;
Rank soo = Rank.bronze;

contract Array {
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];

    function get(uint i)public view returns(uint) {
        return arr[i];
    }
}


contract Shift {
    uint[] public arr;
    function test() external {
        arr = [1, 2, 3, 4, 5];
    }
}
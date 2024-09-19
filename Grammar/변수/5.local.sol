//상태 변수

//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract MyStorage {
    function getResult() public pure returns(uint) {
        uint local_var1 = 1;
        uint local_var2 = 2;
        uint result = local_var1 + local_var2;

        return result;
    }
}

//Pure 상태를 수정하거나 상태 변수를 읽지(액세스)하지 않을때 사용해야 합니다.
//일반적으로 입력 매개변수를 기반으로 작업을 수행
//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Random {
    event PaidAddress(address indexed sender, uint256 payment); //보낸이 주소= 참여자 주소, 참여비
    event WinnerAddress(address indexed winner); //이긴사람의 주소

    modifier onlyOwner(){  //배포자만 실행 가능 함수
        require(msg.sender == owner, "Ownable: caller is not the owner"); // 특정 모디파이어를 걸어서 주인(배포자)권한 배포 소유가능
        _; //조건적 경고
    }

    mapping(uint256 => mapping (address => bool)) public paidAddressList; //주소 중복 인지
    //트루이면 이미 참여중, 거짓이면 아직 미참여 -> 참여 가능하다 = 중복 참여 방지 매핑값
    //첫번째 매핑값은 게임 회차 -> 우승자 등장시 게임 회차 바뀜 -> 첫번째 매핑값이 초기화 -> 둘째 매핑값이 초기화
    //이전에 게임을 참가했던 주소는 다시 거짓이 되어 게임참여 가능하다.

    address public owner; // 랜덤 게임을 배포한 주소
    uint private winnerNumber = 0; //우승자, 회차마다 무작위 난수값을 가짐
    string private key1; //난수발생 요소
    uint private key2; //난수발생 요소

    uint public round = 1; //라운드 초기화시에 PaidAddressList초기화 -> 재참여
    uint public playNumber = 0; //참여자 몇번째

    constructor(string memory _key1, uint _key2) {
        owner = msg.sender; //랜덤 스마트 컨트랙트의 주소 = 배포자의 주소 (=랜덤은행)
        key1 = _key1;
        key2 = _key2;
        winnerNumber = randomNumber(); // 무작위 값임 (1-10)
    } 

    receive() external payable {
        require(msg.value == 10**16, "Must be 0.01 ether.");
        require(paidAddressList[round][msg.sender] == false, "Must be the first time."); //중복 참여 여부 판단
        paidAddressList[round][msg.sender] = true; //게임 참여자
        ++playNumber; //현재 주소 몇번째 참가자인지 보고, 참여했으면 1을 증가시킴

        if(playNumber == winnerNumber){ //현재 실행 숫자와 우승 숫자가 같은지 판별하는 if조건문
            (bool success,) = msg.sender.call {value:address(this).balance}(""); //랜덤 스마트컨트랙트에 누적된 잔액 msg.sender주소에 전달
            require(success, "Failed");
            playNumber = 0; //초기화
            ++round;// 라운드1증가 시켜서 다음 회차로 리라운딩

            winnerNumber = randomNumber();
            emit WinnerAddress(msg.sender); //우승자
        } else {
            emit PaidAddress(msg.sender, msg.value); //게임 참여자
        }
    }
    function randomNumber() private view returns(uint) {
        uint num = uint(keccak256(abi.encodePacked(key1))) + key2 + (block.timestamp) + (block.number);
        return (num - ((num/10)*10)) + 1;
    }

      function setSecretKey(string memory _key1, uint _key2) public onlyOwner() {
       key1 = _key1; //변경 초기화
       key2 = _key2; //변경 초기화
    }
      function getSecretKey() public view onlyOwner() returns(string memory, uint){
        return (key1, key2);
    }
      function getWinnerNumber() public view onlyOwner() returns(uint256) {
       return winnerNumber; // 게임 우승자 반환
    }
      function getRound() public view returns(uint256) {
       return round; //게임의 회차
    }
      function getbalance() public view returns(uint256) {
       return address(this).balance; // 현재 게임의 누적액을 반환
    }
}
//이넘 실습

//SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract test {
    enum ActionChoices {goLeft, goRight, goStraight, sitStill}
    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.goStraight;

    function setGoStraight() public {
        choice = ActionChoices.goStraight;
    }

    function getChoice() public view returns(ActionChoices) {
        return choice;
    }

    function getDefaultChoice() public pure returns(uint) {
        return uint(defaultChoice);
    }
}
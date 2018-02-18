pragma solidity ^0.4.17;

contract EventCreation {
    event ShowAddress(address);

    function fireEvent() public {
        ShowAddress(msg.sender);
    }
}
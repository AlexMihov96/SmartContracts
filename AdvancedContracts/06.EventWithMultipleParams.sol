pragma solidity ^0.4.17;

contract EventWithMultipleParams {
    event ShowInfo(address,string);

    function info(address _address, string message) public {
        ShowInfo(_address, message);
    }
}
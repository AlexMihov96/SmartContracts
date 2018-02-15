pragma solidity ^0.4.18;

contract Incrementor {
    uint32 private number;

    function get() view public returns(uint32){
        return number;
    }

    function increment(uint32 newValue) public {
        number += newValue;
    }
}

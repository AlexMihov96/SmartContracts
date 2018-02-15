pragma solidity ^0.4.18;

contract Storage {
    uint private storedData;

    function set(uint newValue) public {
        storedData = newValue;
    }

    function get() view public returns (uint) {
        return storedData;
    }
}
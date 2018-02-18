pragma solidity ^0.4.17;

contract EventWithIndexedParams {
    event IndexedEvent(string indexed name, string indexed email);

    function info(string name, string email) public {
        IndexedEvent(name, email);
    }
}
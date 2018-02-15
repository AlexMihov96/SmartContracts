pragma solidity ^0.4.18;

contract ArrayOfFacts {
    string[] private facts;
    address private contractOwner = msg.sender;

    function addFact(string newFact) public {
        require(contractOwner == msg.sender);
        facts.push(newFact);
    }

    function getLength() public view returns (uint) {
        return facts.length;
    }

    function getFactAtIndex(uint32 index) public view returns (string) {
        return facts[index];
    }
}
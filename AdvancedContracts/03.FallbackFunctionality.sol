pragma solidity ^0.4.17;

contract Fallback {
    address private owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function Fallback() public {
        owner = msg.sender;
    }

    function deposit() public payable {
    }

    function getBalance() public onlyOwner view returns (uint) {
        return this.balance;
    }

    function transferEtherToAddress(address _address, uint value) public onlyOwner {
        require(_address != address(0));
        assert(value <= this.balance);
        
        _address.transfer(value);
    }
}

contract Recipient {
     address private owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function Recipient() public {
        owner = msg.sender;
    }

    function getBalance() public onlyOwner view returns (uint) {
        return this.balance;
    }

    function () public payable {
    }
}
pragma solidity ^0.4.17;

//get ethers from 1 contract and transfer it to the another via suicide function
contract ReceivingFunds {
    address private owner;

    function ReceivingFunds() public {
        owner = msg.sender;
    }    

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function deposit() public payable {
    }

    function getBalance() onlyOwner public view returns (uint) {
        return this.balance;
    }

    function suicide(address _address) public onlyOwner {
        require(_address != 0x0);

        selfdestruct(_address);
    }
}

contract NoPayable {
     address private owner;

    function NoPayable() public {
        owner = msg.sender;
    }    

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function getBalance() onlyOwner public view returns (uint) {
        return this.balance;
    }
}
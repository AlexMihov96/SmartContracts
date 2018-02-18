pragma solidity ^0.4.17;

contract PayableContract {
   address private contractOwner;

    function PayableContract() public {
        contractOwner = msg.sender;
    }

    function getBalance() public view returns (uint) {
        require(contractOwner == msg.sender);
        
        return this.balance;
    }

    function donate() public payable {
    }
}
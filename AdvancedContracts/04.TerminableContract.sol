pragma solidity ^0.4.17;

contract Owned {
    address internal owner;

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    function Owned() public {
        owner = msg.sender;
    }
}

contract Contract is Owned {
    function deposit() public payable {
    }

    function getBalance() public view onlyOwner returns(uint) {
        return this.balance;
    }
}

contract TerminableContract is Contract {
    function destroy() public onlyOwner {
        require(owner != address(0)); 
        selfdestruct(owner);
    }
}
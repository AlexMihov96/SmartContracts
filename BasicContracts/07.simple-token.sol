pragma solidity ^0.4.18;

contract Token {
    mapping(address => uint) public balanceOf;

    function Token(uint initialSupply) public {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address to, uint value) public {
        require(to != 0x0);
        require(balanceOf[msg.sender] >= value);
        require(balanceOf[to] + value >= balanceOf[to]);

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
    }
}
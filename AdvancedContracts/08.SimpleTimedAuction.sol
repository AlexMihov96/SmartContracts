pragma solidity ^0.4.17;

contract Auction {
    address private owner;
    mapping(address => uint) private balanceOf; 
    uint private duration = 1 minutes;
    uint private start;

    function Auction(uint supply) public {
        start = now;
        owner = msg.sender;
        balanceOf[owner] = supply;
    }

    function buy(uint amountTokens) public {
        assert(now <= start + duration);
        require(msg.sender != address(0));
        require(balanceOf[msg.sender] + amountTokens >= balanceOf[msg.sender]);
        require(balanceOf[owner] >= amountTokens);
        require(msg.sender != owner);

        balanceOf[owner] -= amountTokens;
        balanceOf[msg.sender] += amountTokens;
    }
}
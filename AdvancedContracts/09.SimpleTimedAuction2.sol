pragma solidity ^0.4.17;
//DO NOT USE THIS CONTRACT DONT USE BLOCK.NUMBER
contract AuctionTwo {
    address private owner;
    mapping(address => uint) private balanceOf; 
    uint private blockNumber;

    function AuctionTwo(uint supply) public {
        blockNumber = block.number - 1;
        owner = msg.sender;
        balanceOf[owner] = supply;
    }

    //Block number does not work as expected, it depends on the difficulty
    function buy(uint amountTokens) public {
        assert(blockNumber < block.number);
        require(msg.sender != address(0));
        require(balanceOf[msg.sender] + amountTokens >= balanceOf[msg.sender]);
        require(balanceOf[owner] >= amountTokens);
        require(msg.sender != owner);

        balanceOf[owner] -= amountTokens;
        balanceOf[msg.sender] += amountTokens;
    }
}
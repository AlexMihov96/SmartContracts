pragma solidity ^0.4.17;

contract CompanyShares {
    address private owner;
    uint private price;
    uint private dividend;
    mapping(address => uint) private sharesPerAddress;
    mapping(address => bool) private addressesAllowedToWithdrawFunds;
    address[] private shareHolders;

    function CompanyShares(uint initialSupply, uint _price, uint _dividend) public {
        owner = msg.sender;
        sharesPerAddress[owner] = initialSupply;
        price = _price * 1 ether;
        dividend = _dividend * 1 ether;
    }

    function getPricePerShare() public view returns (uint) {
        return price / 1 ether;
    }

    function calcTransactionWorth(uint amount) public view returns (uint) {
        return (amount * price) / 1 ether;
    }

    function buyShares(uint amount) public payable {
        require(sharesPerAddress[owner] >= amount);
        require(sharesPerAddress[msg.sender] + amount >= sharesPerAddress[msg.sender]);
        require(msg.value == amount * price);

        sharesPerAddress[owner] -= amount;
        sharesPerAddress[msg.sender] += amount;
        shareHolders.push(msg.sender);
    }

    function getShareholders() public view returns (address[]) {
        require(msg.sender == owner);

        return shareHolders;
    }

    function allowWithdraw(address addr) public {
        require(msg.sender == owner);

        addressesAllowedToWithdrawFunds[addr] = true;
    }

    function depositEarings() public payable {
        require(msg.sender == owner);
    }

    function getBalance() public view returns (uint) {
        require(msg.sender == owner);
        
        return this.balance / 1 ether;
    }

    function getNumberOfShares(address _address) public view returns (uint) {
        require(msg.sender == _address || msg.sender == owner);

        return sharesPerAddress[_address];
    }

    function withdraw() public {
        require(sharesPerAddress[msg.sender] > 0);
        require(this.balance >= sharesPerAddress[msg.sender] * dividend);
        require(addressesAllowedToWithdrawFunds[msg.sender] == true);

        msg.sender.transfer(sharesPerAddress[msg.sender] * dividend);
        addressesAllowedToWithdrawFunds[msg.sender] == false;
    }
}
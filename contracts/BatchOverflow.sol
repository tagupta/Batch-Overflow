pragma solidity ^0.4.10;

contract BatchOverflow{
    
    mapping(address => uint)balances;
    
    function deposit(uint amount)public returns(uint totalBalance){
        balances[msg.sender] += amount;
        totalBalance = balances[msg.sender];
    }
    
    function withdraw(uint amount) public returns(uint remainingBalance){
        require(balances[msg.sender] >= amount,"Withdrawal limit exceeded");
        balances[msg.sender] -= amount;
        remainingBalance = balances[msg.sender];
    }
    
    function transfer(address recipient, uint amount) public{
        require(balances[msg.sender] >= amount,"Transfer limit exceeded");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
    
    function getBalance() public view returns(uint){
        return balances[msg.sender];
    }
    //recipents:["0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2","0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c"] , value:0x8000000000000000000000000000000000000000000000000000000000000000
    function batchTransfer(address[] recipients,uint value)public{
        uint count = recipients.length;
        uint cost = count * value; //Batch Overflow 
        require(count > 0 && count <= 20,"Invalid number of recipients");
        require(value > 0 && balances[msg.sender] >= cost,"Insufficient Balance");
        balances[msg.sender] -= cost;
        for(uint i = 0 ; i < count ; i++){
            balances[recipients[i]] += value;
        }
    }
    
}


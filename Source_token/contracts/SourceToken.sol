// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SourceToken {
    uint private _totalSupply;
    uint8 private _decimals = 18;
    string private _name;
    string private _symbol;


    // check the balance of the particular account
    mapping(address => uint256) public balanceof;

    // Max amount of tokens which can be transfer by one address to another address 
    mapping(address => mapping(address => uint256)) private allowance;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function name() public view returns(string memory) {
        return _name;
    }

    function symbol() public view returns(string memory) {
        return _symbol;
    }

    function decimals() public view returns(uint8) {
        return _decimals;
    }

    function totalSupply() public view returns(uint) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns(uint) {
        return balanceof[_owner];
    }



    function transfer(address from, address to, uint256 amount) public{
        balanceof[from] -= amount;
        balanceof[to] += amount;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public returns (bool success) {
       require(amount <= allowance[from][msg.sender]);
       allowance[from][msg.sender] -= amount;
       transfer(from, to, amount);
       return true;
    }
   
    function 

}
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

/**
 *  Exercise: Write a smart contract that does the following:
 *      1. Maintains a balance sheet of addresses -> to amounts.
 *      2. Gives the deployer of the contract a balance of 10_000 at the time of contract creation.
 *      3. Allows an address to transfer its balance to another address.
**/

contract BalanceSheet {
    mapping (address=>uint256) sheet;

    constructor() {
        sheet[msg.sender] = 10_000;
    }

    function balanceOf(address addr) public view returns (uint256) { // view means it does not modify state?
        return sheet[addr];
    }

    function transfer(address receiver, uint256 amount) public {
        require(sheet[msg.sender] >= amount);
        sheet[msg.sender] -= amount;
        sheet[receiver] += amount;
    }
}
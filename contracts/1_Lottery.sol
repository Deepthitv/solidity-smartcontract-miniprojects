// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Lottery {
     // declaring the state variables
     address payable[] public players; //dynamic array of type address payable
     address public manager;

    // declaring the constructor
    constructor(){
         // initializing the owner to the address that deploys the contract
         manager = msg.sender;

         // adding the manager to the lottery
         // players.push(payable(manager));
    }

    // declaring the receive() function that is necessary to receive ETH
    receive() external payable{
         // the manager can not participate in the lottery
         //require(msg.sender != manager);

         // each player sends exactly 0.1 ETH
         require(msg.value == 0.1 ether);
         // appending the player to the players array
         players.push(payable(msg.sender));
    }

    // returning the contract's balance in wei
    function getBalance() public view returns(uint){
         // only the manager is allowed to call it
         // so comment if you want to allow anyone
         require(msg.sender == manager);
         return address(this).balance;
    }

    // helper function that returns a big random integer
    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players.length)));
    }


    // selecting the winner
    function pickWinner() public {

        // anyone can pick the winner if there are at least 3 players in the lottery
        // if below line is commented
        require(msg.sender == manager);
        require(players.length >= 3);

        uint r = random();
        address payable winner;

        // computing a random index of the array
        uint index = r % players.length;
        winner = players[index]; // this is the winner
        // transferring the entire contract's balance to the winner
        winner.transfer(getBalance());


       //Change the contract so that the manager receives a fee of 10% of the lottery funds

        // manager fee is 10%
        // uint managerFee = (getBalance() * 10 ) / 100;
        // winner prize is 90%
        // uint winnerPrize = (getBalance() * 90 ) / 100;
        // transferring 90% of contract's balance to the winner
        //winner.transfer(winnerPrize);
        // transferring 10% of contract's balance to the manager
        //payable(manager).transfer(managerFee);

        // resetting the lottery for the next round
        players = new address payable[](0);
    }

}

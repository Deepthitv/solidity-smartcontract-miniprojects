REMIX DEFAULT WORKSPACE

Remix default workspace is present when:
i. Remix loads for the very first time 
ii. A new workspace is created with 'Default' template
iii. There are no files existing in the File Explorer

This workspace contains 3 directories:

1. 'contracts': Holds three contracts with increasing levels of complexity.
2. 'scripts': Contains four typescript files to deploy a contract. It is explained below.
3. 'tests': Contains one Solidity test file for 'Ballot' contract & one JS test file for 'Storage' contract.

SCRIPTS

The 'scripts' folder has four typescript files which help to deploy the 'Storage' contract using 'web3.js' and 'ethers.js' libraries.

For the deployment of any other contract, just update the contract's name from 'Storage' to the desired contract and provide constructor arguments accordingly 
in the file `deploy_with_ethers.ts` or  `deploy_with_web3.ts`

In the 'tests' folder there is a script containing Mocha-Chai unit tests for 'Storage' contract.

To run a script, right click on file name in the file explorer and click 'Run'. Remember, Solidity file must already be compiled.
Output from script will appear in remix terminal.

Please note, require/import is supported in a limited manner for Remix supported modules.
For now, modules supported by Remix are ethers, web3, swarmgw, chai, multihashes, remix and hardhat only for hardhat.ethers object/plugin.
For unsupported modules, an error like this will be thrown: '<module_name> module require is not supported by Remix IDE' will be shown.

Artifacts and Build Info folders with relevant files are created automatically
By the Remix IDE at time of compile and deploy, hence not included in this project repo.


Lottery algorithm:
1. The lottery starts by accepting ETH transactions. Anyone having an Ethereum wallet can
send a fixed amount of 0.1 ETH to the contract’s address.
2. The players send ETH directly to the contract address and their Ethereum address is
registered. A user can send more transactions having more chances to win.
3. There is a manager, the account that deploys and controls the contract.
4. At some point, if there are at least 3 playesrs, he can pick a random winner from the
players list. Only the manager is allowed to see the contract balance and to randomly
select the winner.
5. The contract will transfer the entire balance to the winner’s address and the lottery is
reset and ready for the next round.


Auction algorithm:
Smart Contract for a Decentralized Auction like an eBay alternative;
1. The Auction has an owner (the person who sells a good or service), a start and an end
date;
2. The owner can cancel the auction if there is an emergency or can finalize the auction
after its end time;
3. People are sending ETH by calling a function called placeBid(). The sender’s address
and the value sent to the auction will be stored in mapping variable called bids;
4. Users are incentivized to bid the maximum they’re willing to pay, but they are not bound
to that full amount, but rather to the previous highest bid plus an increment. The
contract will automatically bid up to a given amount;
5. The highestBindingBid is the selling price and the highestBidder the person who won
the auction;
6. After the auction ends the owner gets the highestBindingBid and everybody else
withdraws their own amount;

CrowdFunding Smart Contract algorithm:
The Admin will start a campaign for CrowdFunding with a specific monetary goal and
deadline.
1. Contributors will contribute to that project by sending ETH.
2. The admin has to create a Spending Request to spend money for the campaign.
3. Once the spending request was created, the Contributors can start voting for that
specific Spending Request.
4. If more than 50% of the total contributors voted for that request, then the admin would
have the permission to spend the amount specified in the spending request.
5. The power is moved from the campaign’s admin to those that donated money.
6. The contributors can request a refund if the monetary goal was not reached within the
deadline.

ICO Smart Contract with Inheritance:

Our ICO will be a Smart Contract that accepts ETH in exchange for our own token named
Cryptos (CRPT);
1. The Cryptos token is a fully compliant ERC20 token and will be generated at the ICO time;
2. Investors will send ETH to the ICO contract’s address and in return, they’ll get an amount of
Cryptos;
3. There will be a deposit address (EOA account) that automatically receives the ETH sent to
the ICO contract;
4. CRPT token price in wei is: 1CRPT = 0.001Eth = 10**15 wei, 1Eth = 1000 CRPT);
5. The minimum investment is 0.01 ETH and the maximum investment is 5 ETH;
6. The ICO Hardcap is 300 ETH;
7. The ICO will have an admin that specifies when the ICO starts and ends;
8. The ICO ends when the Hardcap or the end time is reached (whichever comes first);
9. The CRPT token will be tradable only after a specific time set by the admin;
10. In case of an emergency the admin could stop the ICO and could also change the deposit
address in case it gets compromised;
11. The ICO can be in one of the following states: beforeStart, running, afterEnd, halted;
12. And we’ll also implement the possibility to burn the tokens that were not sold in the ICO;
13. After an investment in the ICO the Invest event will be emitted;
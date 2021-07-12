# Batch-Overflow
An illustration of Batch overflow attack 

## Overview
The batch overflow bug was first observed in Beautychain (BEC) ERC20 contract by **PackShield**. Their automated system alerted the team about a suspicious transaction involving unreasonably large tokens.

Batch overflow is a classic integer overflow issue. The vulnerability was found in ```batchTranafer()```function while computing the cost of tokens. Multiplication opeartion caused the overflow and enabled the users to transfer tokens out of thin air.

Now this vulnerability can be solved using **Safemath** for solidity versions less than or equal to 0.8.0. For versions more than 0.8.0, arithmetic operations can be implemented as it is without worrying about overflow-underflow.

In the contacts folder, there are two files, one that highlights the attack and the other that shows the fixes for the same.

## Steps
To run the code, open Remix - Ethereum IDE in your browser. Create files in the workspace similar to those in contract folder. Then deploy the contract to see the functionality.

## Enjoy
Play with the buttons on left panel.


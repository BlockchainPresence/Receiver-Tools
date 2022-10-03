# Receiver-Tools 

This folder offers several tools that simplify the interaction with the Blockchain Presence oracle. 

## BCP_informed.sol

BCP_informed.sol should be imported into the Solidity code of your smart contract application. It is an *abstract contract* which means it is not a standalone contract but assists you in connecting to the oracle. By importing it into your contract, it allows you to call the following three functions:

- The *GetTransactionCosts* function calculates the value you need to send with the Order function. This value corresponds to the sum of the sender fee and the gas for the delivery transaction.

- The *Order* function is used to place an order as described in the corresponding commitment.

- The *CancelOrder* function allows you to cancel an unfilled order (for any reason). As a result, the sender fee will be reimbursed to the address from which the Order function was called .

## Minimal use case

The minimal use case is an example of a smart contract that interacts with the Blockchain Presence oracle. To learn how to order and receive data, this example might serve as a first point of reference.

## Additional Information

### Blockchain Presence Addresses

- Polygon Mainnet: 0x067504587E1E598F861282C9fFd619E5B0a0d238 
- Mumbai testnet: 0xD200F64cEcc8bBc1292c0187F5ee6cD7bDf1eeac 

### Blockchain Presence Commitments

1  Random Number Generator
2  White Ether
3  SBB departures delay
4  SBB arrivals delay
5  Current weather
6  Bitcoin and Ether prices
7  Exchange rates
8  U.S. stocks historical prices
9  SIX stocks prices
10 U.S. company financial information
11 Repo reference rates: SWISS AVERAGE RATES (SAR)
12 Spot interest rates with different maturities for CHF Swiss Confederation bond issues
13 Metals market prices
14 Cryptocurrencies price
15 Cryptocurrencies metric
16 Recommended gas prices
17 ETH transaction waiting time
18 Account balance
19 Average transaction cost
20 Blockchain height
21 Number of unconfirmed transactions

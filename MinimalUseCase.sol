// Copyright (c) 2019-2022 Blockchain Presence
//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "https://github.com/BlockchainPresence/Receiver-Tools/BCP_informed.sol";

contract MinimalUseCase is BCP_informed {
    //*******************************************Global Variables********************************************************

    address payable owner; // address of the deployer
    uint32 public orderID; // identifies a specific order
    int88 public data; // ordered data
    bool public statusFlag; // states whether delivery is valid
    int64 constant commitmentID = 1; // Random number generator
    string constant location = ""; // must be changed for other commitmentID's than random number
    uint40 constant gasForMailbox = 210000; // must be raised for more complex applications
    uint64 constant gasPriceInGwei = 50; // check Mumbai gas prices
    address payable constant bcpAddress =
        payable(0xD200F64cEcc8bBc1292c0187F5ee6cD7bDf1eeac); // Mumbai testnet contract

    event receiveOrder(uint32 _orderID, int88 _data, bool _statusFlag);

    //*******************************************Constructor*************************************************************

    constructor() payable BCP_informed(bcpAddress) {
        uint256 transactionCosts = BCP.GetTransactionCosts( // calculate costs of an order
            commitmentID,
            gasForMailbox,
            uint256(gasPriceInGwei)
        );
        owner = payable(msg.sender);
        require(msg.value >= transactionCosts, "Value is too low"); // checks if money is enough to make an
        BCP.Order{value: transactionCosts}( // order the data from the BCP oracle
            commitmentID,
            location,
            uint32(block.timestamp),
            gasForMailbox,
            gasPriceInGwei
        );
    }

    //*************************************************Mailbox************************************************************

    function Mailbox(
        uint32 _orderID,
        int88 _data,
        bool _statusFlag
    ) external payable override onlyBCP {
        emit receiveOrder(_orderID, _data, _statusFlag);
        orderID = _orderID; // Show data on Remix
        data = _data;
        statusFlag = _statusFlag;
        owner.transfer(address(this).balance);
    }


    fallback() external payable override {}
}
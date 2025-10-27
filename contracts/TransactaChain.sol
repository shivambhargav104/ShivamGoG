// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title TransactaChain
 * @dev A decentralized transaction tracker to log and verify cross-user payments on-chain.
 */
contract Project {
    address public admin;
    uint256 public transactionCount;

    struct Transaction {
        uint256 id;
        address sender;
        address receiver;
        uint256 amount;
        uint256 timestamp;
        bool confirmed;
    }

    mapping(uint256 => Transaction) public transactions;

    event TransactionCreated(uint256 indexed id, address indexed sender, address indexed receiver, uint256 amount);
    event TransactionConfirmed(uint256 indexed id);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    // ✅ Function 1: Create a transaction
    function createTransaction(address _receiver, uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than zero");

        transactionCount++;
        transactions[transactionCount] = Transaction(
            transactionCount,
            msg.sender,
            _receiver,
            _amount,
            block.timestamp,
            false
        );

        emit TransactionCreated(transactionCount, msg.sender, _receiver, _amo

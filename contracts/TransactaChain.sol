? Function 1: Create a transaction
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
// 
update
// 

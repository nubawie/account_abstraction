// contracts/CustomUserOperation.sol

pragma solidity ^0.8.0;

contract CustomUserOperation {
    event CustomOperationProcessed(address indexed user, bytes data);

    function processUserOperation(address user, bytes memory data) external {
        // Process the custom user operation.
        // This is a placeholder; real logic can be more involved.
        emit CustomOperationProcessed(user, data);
    }
}
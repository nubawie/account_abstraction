// contracts/FeePaymentInERC20.sol

pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract FeePaymentInERC20 {
    address public feeCollector;
    IERC20 public acceptedToken;

    constructor(address _acceptedToken) {
        feeCollector = msg.sender;
        acceptedToken = IERC20(_acceptedToken);
    }

    function payFeeWithToken(uint256 amount) external {
        require(acceptedToken.transferFrom(msg.sender, feeCollector, amount), "Token transfer failed");
    }
}

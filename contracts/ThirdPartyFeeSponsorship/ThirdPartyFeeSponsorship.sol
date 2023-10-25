// contracts/ThirdPartyFeeSponsorship.sol

pragma solidity ^0.8.0;

contract ThirdPartyFeeSponsorship {
    mapping(address => bool) public sponsors;

    event FeeSponsored(address indexed user, address indexed sponsor);

    modifier onlySponsor() {
        require(sponsors[msg.sender], "Not a sponsor");
        _;
    }

    function addSponsor(address sponsor) external onlySponsor {
        sponsors[sponsor] = true;
    }

    function sponsorFeeFor(address user) external onlySponsor {
        // This function doesn't really transfer any funds. 
        // Instead, it acts as a proof-of-concept that the fee for 'user' is being sponsored by the caller.
        emit FeeSponsored(user, msg.sender);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Crowdfunding {
    address public owner;             // Project owner
    uint public goal;                 // Funding goal in wei
    uint public deadline;             // Deadline as a Unix timestamp
    uint public totalFunds;           // Total funds raised
    mapping(address => uint) public contributions;  // Tracks each contributor's amount

    bool public fundsWithdrawn;       // Track if funds have been withdrawn

    event ContributionReceived(address contributor, uint amount);
    event FundsWithdrawn(address owner, uint amount);
    event RefundIssued(address contributor, uint amount);

    // Constructor without parameters
    constructor() {
        owner = msg.sender;
        goal = 1 ether;              // Default funding goal: 1 Ether
        deadline = block.timestamp + (30 days); // Default duration: 30 days
        fundsWithdrawn = false;
    }

    // Contribute to the crowdfunding campaign
    function contribute(uint ContributionReceivedamount) external payable {
        require(block.timestamp < deadline, "Deadline has passed");
        //require(msg.value > 0, "Contribution must be greater than zero");

        require(ContributionReceivedamount > 0, "Contribution must be greater than zero");
        contributions[msg.sender] += ContributionReceivedamount;
        totalFunds += ContributionReceivedamount;

        emit ContributionReceived(msg.sender, ContributionReceivedamount);
    }

    // Withdraw funds if the goal is met
    function withdrawFunds() external {
        require(msg.sender == owner, "Only the owner can withdraw funds");
        require(block.timestamp >= deadline, "Cannot withdraw before deadline");
        require(totalFunds >= goal, "Funding goal not met");
        require(!fundsWithdrawn, "Funds already withdrawn");

        fundsWithdrawn = true;
        payable(owner).transfer(totalFunds);

        emit FundsWithdrawn(owner, totalFunds);
    }

    // Refund contributors if the goal is not met
    function issueRefund() external {
        require(block.timestamp >= deadline, "Cannot refund before deadline");
        require(totalFunds < goal, "Funding goal was met");

        uint contributedAmount = contributions[msg.sender];
        require(contributedAmount > 0, "No contributions to refund");

        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(contributedAmount);

        emit RefundIssued(msg.sender, contributedAmount);
    }

    // Get the contract's balance
    function getContractBalance() external view returns (uint) {
        return address(this).balance;
    }
}

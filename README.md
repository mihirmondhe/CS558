
# Blockchain-Based Crowd-Funding Platform

This project is a simple **Blockchain-Based Crowd-Funding Platform** implemented in Solidity. It allows project owners to raise funds by setting goals and deadlines, enabling contributors to participate in the campaign. If the funding goal is met, the owner can withdraw the funds. If the goal is not met by the deadline, contributors can claim refunds.

## Features
- **Contributions:** Users can contribute funds to campaigns.
- **Funding Goal:** Campaigns have a funding goal (default: 1 Ether).
- **Deadline:** Campaigns have a deadline (default: 30 days from deployment).
- **Withdraw Funds:** Owners can withdraw funds if the goal is met and the deadline has passed.
- **Refunds:** Contributors can claim refunds if the goal is not met by the deadline.
- **Contract Balance Check:** Users can view the contract’s balance.

## Contract Deployment and Interaction

This contract is designed to be deployed and run on [Remix IDE](https://remix.ethereum.org/), an online platform for Ethereum smart contract development.

### Prerequisites
1. Install and set up [MetaMask](https://metamask.io/) or another compatible Ethereum wallet.
2. Access the [Remix IDE](https://remix.ethereum.org/).
3. Have test Ether available in your wallet for deploying and interacting with the contract.

### Steps to Deploy and Test the Contract
1. **Open Remix:**
   - Visit [https://remix.ethereum.org/](https://remix.ethereum.org/).

2. **Create a New File:**
   - In the Remix file explorer, create a new file named `Crowdfunding.sol`.

3. **Paste the Code:**
   - Copy the Solidity code from this repository and paste it into `Crowdfunding.sol`.

4. **Compile the Contract:**
   - Select the **Solidity Compiler** tab in Remix.
   - Set the compiler version to **0.8.2** or higher.
   - Click **Compile Crowdfunding.sol**.

5. **Deploy the Contract:**
   - Navigate to the **Deploy & Run Transactions** tab.
   - Choose an environment (e.g., "Injected Provider" to connect MetaMask).
   - Click **Deploy** to deploy the contract.

6. **Interact with the Contract:**
   - Use the Remix interface to call contract functions:
     - `contribute`: Contribute funds to the campaign.
     - `withdrawFunds`: Withdraw funds if the goal is met (owner only).
     - `issueRefund`: Issue refunds if the goal is not met.
     - `getContractBalance`: Check the contract's balance.

## Key Events
The contract emits the following events:
- `ContributionReceived`: Triggered when a user contributes to the campaign.
- `FundsWithdrawn`: Triggered when the owner withdraws funds after a successful campaign.
- `RefundIssued`: Triggered when refunds are issued to contributors.

## Example Usage

### Contribution
1. Call the `contribute` function with a value greater than `0`.
2. The contract records the contribution and emits the `ContributionReceived` event.

### Withdraw Funds
1. After the campaign deadline, the owner can call the `withdrawFunds` function.
2. If the funding goal is met, the owner receives the total funds, and the `FundsWithdrawn` event is emitted.

### Refund Contributors
1. After the deadline, any contributor can call `issueRefund`.
2. If the funding goal is not met, contributors can claim their refund, triggering the `RefundIssued` event.

## Potential Enhancements
- Add support for dynamic goal and deadline parameters during deployment.
- Include a feature to extend the campaign deadline by the owner.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

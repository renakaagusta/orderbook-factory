# Orderbook Factory

A demonstration project showcasing the Factory Pattern implementation in smart contracts with an integrated indexing solution.

## Overview

This project implements the Factory Pattern where an OrderBookFactory contract creates individual OrderBook instances. Each OrderBook represents a unique trading pair with its own parameters. The project includes both the smart contracts and an indexer to track and query all created OrderBooks.

## Key Components

- **Factory Contract**: Creates and deploys new OrderBook contracts with custom parameters
- **OrderBook Contracts**: Individual trading venues created by the factory
- **Ponder Indexer**: Tracks OrderBook creation events and maintains a database of all OrderBooks
- **Deployment Scripts**: Foundry scripts for deploying and testing the system

## Technical Implementation

- Factory pattern implemented using Solidity for contract creation
- Ponder.js indexer watching factory events on multiple networks
- Environment configuration for both contracts and indexer
- Support for multiple networks including local Anvil, Arbitrum Sepolia, and mainnet

## Development Setup

1. Deploy tokens and factory contract
forge script script/Deploy.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
2. Configure environment variables based on the deployment output
3. Simulate orders
forge script script/SimulateOrders.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
4. Configure environment variables for indexer
5. Run indexer

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- OpenZeppelin for smart contract libraries
- Ponder for indexing infrastructure
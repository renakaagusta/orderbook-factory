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

## Deployment Steps

### 1. Deploy Tokens and Factory Contract
Deploy the initial contracts including mock tokens and factory:

```bash
forge script script/Deploy.s.sol --broadcast \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY
```

After deployment, you'll receive addresses for:
- Quote Asset
- Base Asset
- Orderbook Factory
- Orderbook

### 2. Configure Environment Variables
Update your `.env` file with the deployed contract addresses:

```
QUOTE_TOKEN_ADDRESS=<deployed_quote_token_address>
BASE_TOKEN_ADDRESS=<deployed_base_token_address>
ORDERBOOK_FACTORY_ADDRESS=<deployed_factory_address>
ORDERBOOK_ADDRESS=<deployed_orderbook_address>
```

### 3. Simulate Orders
Run the order simulation script to create test trading activity:

```bash
forge script script/SimulateOrders.s.sol --broadcast \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY
```

### 4. Configure Indexer Environment
Create a new `.env.indexer` file:

```
ORDERBOOK_FACTORY_ADDRESS=<deployed_factory_address>
STARTED_BLOCK=<block_number>
```

### 5. Run Indexer
Start the indexer service:

```bash
pnpm dev
```
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- OpenZeppelin for smart contract libraries
- Ponder for indexing infrastructure

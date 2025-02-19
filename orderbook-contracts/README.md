Nexus Bond Protocol

1. Deploy tokens
forge script script/DeployTokens.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY --ffi
2. Deploy vaults
forge script script/DeployVault.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY --ffi
3. Deploy managers
forge script script/DeployManagers.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
4. Deploy price oracle
forge script script/DeployPriceOracle.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
5. Set initial prices
forge script script/SetInitialPrices.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
6. Deploy bond factory
forge script script/DeployBondFactory.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
7. Deploy bond pools
forge script script/DeployBondPools.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
8. Mint tokens
forge script script/MintTokens.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
9. Simulate deposit pools
forge script script/SimulateDepositPools.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
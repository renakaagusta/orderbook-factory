// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/src/Script.sol";
import "../src/OrderBookFactory.sol";
import "../src/OrderBook.sol";

contract DeployScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deploy quote token (for testing purposes)
        Token quoteToken = new Token("USDC", "USDC");
        console.log("QUOTE_TOKEN_ADDRESS=%s", address(quoteToken));

        // Deploy factory
        OrderBookFactory factory = new OrderBookFactory();
        console.log("ORDERBOOK_FACTORY_ADDRESS=%s", address(factory));

        // Create initial orderbook parameters
        OrderBookFactory.CreateOrderBookParams memory params = OrderBookFactory.CreateOrderBookParams({
            tokenName: "Example Token",
            tokenSymbol: "EXMP",
            quoteAsset: address(quoteToken),
            initialPrice: 100e18,    // $100
            bottomPrice: 90e18,      // $90
            bottomAmount: 100e18,    // 100 tokens
            anchorPrice: 100e18,     // $100
            anchorAmount: 200e18,    // 200 tokens
            discoveryPrice: 110e18,  // $110
            discoveryAmount: 100e18  // 100 tokens
        });

        // Create initial orderbook
        (address orderBook, address token) = factory.createOrderBook(params);
        console.log("ORDERBOOK_ADDRESS=%s", orderBook);
        console.log("BASE_TOKEN_ADDRESS=%s", token);

        vm.stopBroadcast();
    }
} 
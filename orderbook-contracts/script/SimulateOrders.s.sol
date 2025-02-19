// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/src/Script.sol";
import "../src/OrderBook.sol";

contract SimulateOrdersScript is Script {
    function run() external {
        // Load environment variables
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address orderBookAddress = vm.envAddress("ORDERBOOK_ADDRESS");
        
        vm.startBroadcast(deployerPrivateKey);

        // Get OrderBook instance
        OrderBook orderBook = OrderBook(orderBookAddress);
        
        // Simulate multiple orders
        for(uint i = 0; i < 5; i++) {
            orderBook.placeOrder();
            console.log("Order placed by %s at timestamp %s", msg.sender, block.timestamp);
        }

        vm.stopBroadcast();
    }
} 
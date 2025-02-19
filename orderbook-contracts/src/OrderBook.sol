// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Token} from "./mocks/Token.sol";

contract OrderBook {
    address public quoteAsset;
    address public baseAsset;

    event PlaceOrder(address indexed user, uint256 amount);
    
    constructor(address _quoteAsset, address _baseAsset) {
        quoteAsset = _quoteAsset;
        baseAsset = _baseAsset;
    }

    // Just used to test the indexer
    function placeOrder() external {
        emit PlaceOrder(msg.sender, block.timestamp);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/src/Test.sol";
import "../src/OrderBook.sol";
import "../src/mocks/Token.sol";

contract OrderBookTest is Test {
    OrderBook public orderBook;
    Token public quoteToken;
    Token public baseToken;
    
    address public user1 = address(0x1);
    address public user2 = address(0x2);
    uint256 public constant INITIAL_BALANCE = 1000e18;

    function setUp() public {
        // Deploy mock tokens
        quoteToken = new Token("Quote Token", "QUOTE");
        baseToken = new Token("Base Token", "BASE");
        
        // Deploy orderbook
        orderBook = new OrderBook(
            address(quoteToken),
            address(baseToken)
        );

        // Setup initial balances
        quoteToken.mint(user1, INITIAL_BALANCE);
        quoteToken.mint(user2, INITIAL_BALANCE);
        baseToken.mint(user1, INITIAL_BALANCE);
        baseToken.mint(user2, INITIAL_BALANCE);
    }

    function testInitialState() public {
        assertEq(orderBook.quoteAsset(), address(quoteToken));
        assertEq(orderBook.baseAsset(), address(baseToken));
    }
} 
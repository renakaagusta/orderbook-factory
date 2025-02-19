// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/src/Test.sol";
import "../src/OrderBookFactory.sol";
import "../src/OrderBook.sol";
import "../src/mocks/Token.sol";

contract OrderBookFactoryTest is Test {
    OrderBookFactory public factory;
    Token public quoteToken;
    
    address public user1 = address(0x1);
    address public user2 = address(0x2);

    event OrderBookCreated(
        address indexed orderBook,
        address indexed token,
        OrderBookFactory.CreateOrderBookParams params
    );

    function setUp() public {
        // Deploy quote token
        quoteToken = new Token("Quote Token", "QUOTE");
        
        // Deploy factory
        factory = new OrderBookFactory();
    }

    function testCreateOrderBook() public {
        OrderBookFactory.CreateOrderBookParams memory params = OrderBookFactory.CreateOrderBookParams({
            tokenName: "Test Base Token",
            tokenSymbol: "TBT",
            quoteAsset: address(quoteToken),
            initialPrice: 100e18,
            bottomPrice: 90e18,
            bottomAmount: 10e18,
            anchorPrice: 100e18,
            anchorAmount: 20e18,
            discoveryPrice: 110e18,
            discoveryAmount: 10e18
        });

        vm.expectEmit(false, false, true, false);
        emit OrderBookCreated(
            address(0), // We don't know the address yet
            address(0), // Token address not known yet
            params
        );

        (address orderBookAddress, address tokenAddress) = factory.createOrderBook(params);
        
        assertTrue(factory.isFactoryOrderBook(orderBookAddress));
        assertEq(factory.getOrderBookCount(), 1);

        OrderBook orderBook = OrderBook(orderBookAddress);
        assertEq(orderBook.quoteAsset(), address(quoteToken));
    }

    function testMultipleOrderBookCreation() public {
        OrderBookFactory.CreateOrderBookParams memory params1 = OrderBookFactory.CreateOrderBookParams({
            tokenName: "Test Base Token 1",
            tokenSymbol: "TBT1",
            quoteAsset: address(quoteToken),
            initialPrice: 100e18,
            bottomPrice: 90e18,
            bottomAmount: 10e18,
            anchorPrice: 100e18,
            anchorAmount: 20e18,
            discoveryPrice: 110e18,
            discoveryAmount: 10e18
        });

        OrderBookFactory.CreateOrderBookParams memory params2 = OrderBookFactory.CreateOrderBookParams({
            tokenName: "Test Base Token 2",
            tokenSymbol: "TBT2",
            quoteAsset: address(quoteToken),
            initialPrice: 200e18,
            bottomPrice: 180e18,
            bottomAmount: 10e18,
            anchorPrice: 200e18,
            anchorAmount: 20e18,
            discoveryPrice: 220e18,
            discoveryAmount: 10e18
        });

        factory.createOrderBook(params1);
        factory.createOrderBook(params2);

        assertEq(factory.getOrderBookCount(), 2);
        
        address[] memory orderBooks = factory.getAllOrderBooks();
        assertEq(orderBooks.length, 2);
        assertTrue(factory.isFactoryOrderBook(orderBooks[0]));
        assertTrue(factory.isFactoryOrderBook(orderBooks[1]));
    }

    function testOrderBookInitialization() public {
        OrderBookFactory.CreateOrderBookParams memory params = OrderBookFactory.CreateOrderBookParams({
            tokenName: "Test Base Token",
            tokenSymbol: "TBT",
            quoteAsset: address(quoteToken),
            initialPrice: 100e18,
            bottomPrice: 90e18,
            bottomAmount: 10e18,
            anchorPrice: 100e18,
            anchorAmount: 20e18,
            discoveryPrice: 110e18,
            discoveryAmount: 10e18
        });

        (address orderBookAddress, address tokenAddress) = factory.createOrderBook(params);
        OrderBook orderBook = OrderBook(orderBookAddress);

        // Check token initialization
        Token baseToken = Token(orderBook.baseAsset());
        assertEq(baseToken.name(), params.tokenName);
        assertEq(baseToken.symbol(), params.tokenSymbol);

        // Check initial token distribution
        uint256 expectedSupply = (params.bottomAmount + params.anchorAmount + params.discoveryAmount) * 10**18;
        assertEq(baseToken.balanceOf(address(this)), expectedSupply);
    }
} 
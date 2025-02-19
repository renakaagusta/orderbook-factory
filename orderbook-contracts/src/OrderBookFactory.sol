// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./OrderBook.sol";

contract OrderBookFactory {
    event OrderBookCreated(
        address indexed orderBook,
        address indexed token,
        address indexed quoteAsset,
        string tokenName,
        string tokenSymbol,     
        uint256 initialPrice,
        uint256 bottomPrice,
        uint256 bottomAmount,
        uint256 anchorPrice,
        uint256 anchorAmount,
        uint256 discoveryPrice,
        uint256 discoveryAmount
    );

    mapping(address => bool) public isOrderBookCreatedByFactory;
    address[] public allOrderBooks;

    struct CreateOrderBookParams {
        string tokenName;
        string tokenSymbol;
        address quoteAsset;
        uint256 initialPrice;
        uint256 bottomPrice;
        uint256 bottomAmount;
        uint256 anchorPrice;
        uint256 anchorAmount;
        uint256 discoveryPrice;
        uint256 discoveryAmount;
    }

    function createOrderBook(
        CreateOrderBookParams memory params
    ) external returns (address, address) {
        Token token = new Token(params.tokenName, params.tokenSymbol);
        token.mint(
            msg.sender,
            (params.bottomAmount + params.anchorAmount + params.discoveryAmount) *
                10 ** token.decimals()
        );

        OrderBook orderBook = new OrderBook(
            params.quoteAsset,
            address(token)
        );

        // Place limit orders
        // orderBook.placeLimitOrder(bottomPrice, bottomAmount, true);
        // orderBook.placeLimitOrder(anchorPrice, anchorAmount, true);
        // orderBook.placeLimitOrder(discoveryPrice, discoveryAmount, true);

        address orderBookAddress = address(orderBook);
        isOrderBookCreatedByFactory[orderBookAddress] = true;
        allOrderBooks.push(orderBookAddress);

        emit OrderBookCreated(
            orderBookAddress, 
            address(token),
            params.quoteAsset,
            params.tokenName,
            params.tokenSymbol,
            params.initialPrice,
            params.bottomPrice,
            params.bottomAmount,
            params.anchorPrice,
            params.anchorAmount,
            params.discoveryPrice,
            params.discoveryAmount
        );
        
        return (orderBookAddress, address(token));
    }

    function getAllOrderBooks() external view returns (address[] memory) {
        return allOrderBooks;
    }

    function getOrderBookCount() external view returns (uint256) {
        return allOrderBooks.length;
    }

    function isFactoryOrderBook(
        address _orderBook
    ) external view returns (bool) {
        return isOrderBookCreatedByFactory[_orderBook];
    }
}

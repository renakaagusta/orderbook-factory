export const OrderBookFactoryABI = [
  {
      "type": "function",
      "name": "allOrderBooks",
      "inputs": [
          {
              "name": "",
              "type": "uint256",
              "internalType": "uint256"
          }
      ],
      "outputs": [
          {
              "name": "",
              "type": "address",
              "internalType": "address"
          }
      ],
      "stateMutability": "view"
  },
  {
      "type": "function",
      "name": "createOrderBook",
      "inputs": [
          {
              "name": "params",
              "type": "tuple",
              "internalType": "struct OrderBookFactory.CreateOrderBookParams",
              "components": [
                  {
                      "name": "tokenName",
                      "type": "string",
                      "internalType": "string"
                  },
                  {
                      "name": "tokenSymbol",
                      "type": "string",
                      "internalType": "string"
                  },
                  {
                      "name": "quoteAsset",
                      "type": "address",
                      "internalType": "address"
                  },
                  {
                      "name": "initialPrice",
                      "type": "uint256",
                      "internalType": "uint256"
                  },
                  {
                      "name": "bottomPrice",
                      "type": "uint256",
                      "internalType": "uint256"
                  },
                  {
                      "name": "bottomAmount",
                      "type": "uint256",
                      "internalType": "uint256"
                  },
                  {
                      "name": "anchorPrice",
                      "type": "uint256",
                      "internalType": "uint256"
                  },
                  {
                      "name": "anchorAmount",
                      "type": "uint256",
                      "internalType": "uint256"
                  },
                  {
                      "name": "discoveryPrice",
                      "type": "uint256",
                      "internalType": "uint256"
                  },
                  {
                      "name": "discoveryAmount",
                      "type": "uint256",
                      "internalType": "uint256"
                  }
              ]
          }
      ],
      "outputs": [
          {
              "name": "",
              "type": "address",
              "internalType": "address"
          },
          {
              "name": "",
              "type": "address",
              "internalType": "address"
          }
      ],
      "stateMutability": "nonpayable"
  },
  {
      "type": "function",
      "name": "getAllOrderBooks",
      "inputs": [],
      "outputs": [
          {
              "name": "",
              "type": "address[]",
              "internalType": "address[]"
          }
      ],
      "stateMutability": "view"
  },
  {
      "type": "function",
      "name": "getOrderBookCount",
      "inputs": [],
      "outputs": [
          {
              "name": "",
              "type": "uint256",
              "internalType": "uint256"
          }
      ],
      "stateMutability": "view"
  },
  {
      "type": "function",
      "name": "isFactoryOrderBook",
      "inputs": [
          {
              "name": "_orderBook",
              "type": "address",
              "internalType": "address"
          }
      ],
      "outputs": [
          {
              "name": "",
              "type": "bool",
              "internalType": "bool"
          }
      ],
      "stateMutability": "view"
  },
  {
      "type": "function",
      "name": "isOrderBookCreatedByFactory",
      "inputs": [
          {
              "name": "",
              "type": "address",
              "internalType": "address"
          }
      ],
      "outputs": [
          {
              "name": "",
              "type": "bool",
              "internalType": "bool"
          }
      ],
      "stateMutability": "view"
  },
  {
      "type": "event",
      "name": "OrderBookCreated",
      "inputs": [
          {
              "name": "orderBook",
              "type": "address",
              "indexed": true,
              "internalType": "address"
          },
          {
              "name": "token",
              "type": "address",
              "indexed": true,
              "internalType": "address"
          },
          {
              "name": "quoteAsset",
              "type": "address",
              "indexed": true,
              "internalType": "address"
          },
          {
              "name": "tokenName",
              "type": "string",
              "indexed": false,
              "internalType": "string"
          },
          {
              "name": "tokenSymbol",
              "type": "string",
              "indexed": false,
              "internalType": "string"
          },
          {
              "name": "initialPrice",
              "type": "uint256",
              "indexed": false,
              "internalType": "uint256"
          },
          {
              "name": "bottomPrice",
              "type": "uint256",
              "indexed": false,
              "internalType": "uint256"
          },
          {
              "name": "bottomAmount",
              "type": "uint256",
              "indexed": false,
              "internalType": "uint256"
          },
          {
              "name": "anchorPrice",
              "type": "uint256",
              "indexed": false,
              "internalType": "uint256"
          },
          {
              "name": "anchorAmount",
              "type": "uint256",
              "indexed": false,
              "internalType": "uint256"
          },
          {
              "name": "discoveryPrice",
              "type": "uint256",
              "indexed": false,
              "internalType": "uint256"
          },
          {
              "name": "discoveryAmount",
              "type": "uint256",
              "indexed": false,
              "internalType": "uint256"
          }
      ],
      "anonymous": false
  }
] as const;
export const OrderBookABI = [{ "type": "constructor", "inputs": [{ "name": "_quoteAsset", "type": "address", "internalType": "address" }, { "name": "_baseAsset", "type": "address", "internalType": "address" }], "stateMutability": "nonpayable" }, { "type": "function", "name": "baseAsset", "inputs": [], "outputs": [{ "name": "", "type": "address", "internalType": "address" }], "stateMutability": "view" }, { "type": "function", "name": "placeOrder", "inputs": [], "outputs": [], "stateMutability": "nonpayable" }, { "type": "function", "name": "quoteAsset", "inputs": [], "outputs": [{ "name": "", "type": "address", "internalType": "address" }], "stateMutability": "view" }, { "type": "event", "name": "PlaceOrder", "inputs": [{ "name": "user", "type": "address", "indexed": true, "internalType": "address" }, { "name": "amount", "type": "uint256", "indexed": false, "internalType": "uint256" }], "anonymous": false }] as const
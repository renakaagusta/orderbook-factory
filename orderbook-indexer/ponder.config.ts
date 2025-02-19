import dotenv from "dotenv";
import { createConfig, factory } from "ponder";
import { http, parseAbiItem } from "viem";
import { OrderBookFactoryABI } from "./abis/OrderBookFactoryABI";
import { OrderBookABI } from "./abis/OrderBookABI";

dotenv.config();

export default createConfig({
  networks: {
    mainnet: {
      chainId: 1,
      transport: http(process.env.PONDER_RPC_URL_1),
    },
    anvil: {
      chainId: 31337,
      transport: http(process.env.PONDER_RPC_URL_2),
    },
    arbitrumSepolia: {
      chainId: 421614,
      transport: http(process.env.PONDER_RPC_URL_3),
    },
    conduit: {
      chainId: 911867,
      transport: http(process.env.PONDER_RPC_URL_4),
    },
  },
  contracts: {
    OrderBookFactory: {
      network: "anvil",
      abi: OrderBookFactoryABI,
      address: process.env.ORDERBOOK_FACTORY_ADDRESS as `0x${string}`,
      startBlock: process.env.STARTED_BLOCK as unknown as number,
    },
    OrderBook: {
      abi: OrderBookABI,
      network: "anvil",
      address: factory({
        address: process.env.ORDERBOOK_FACTORY_ADDRESS as `0x${string}`,
        event: parseAbiItem("event OrderBookCreated(address indexed orderBook, address indexed token, address indexed quoteAsset, string tokenName, string tokenSymbol, uint256 initialPrice, uint256 bottomPrice, uint256 bottomAmount, uint256 anchorPrice, uint256 anchorAmount, uint256 discoveryPrice, uint256 discoveryAmount)"),
        parameter: "orderBook",
      }),
      startBlock: process.env.STARTED_BLOCK as unknown as number,
    },
  },
});

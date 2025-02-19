import { onchainTable } from "ponder";

export const orderBook = onchainTable("order_book", (t) => ({
  id: t.text().primaryKey(),
  address: t.text(),
  tokenName: t.text(),
  tokenSymbol: t.text(),
  quoteAsset: t.text(),
  initialPrice: t.numeric(),
  bottomPrice: t.numeric(),
  bottomAmount: t.numeric(),
  anchorPrice: t.numeric(),
  anchorAmount: t.numeric(),
  discoveryPrice: t.numeric(),
  discoveryAmount: t.numeric(),
  timestamp: t.integer(),
  blockNumber: t.integer(),
  transactionHash: t.text(),
}));

export const placeOrder = onchainTable("place_order", (t) => ({
  id: t.text().primaryKey(),
  orderBookAddress: t.text(),
  user: t.text(),
  amount: t.numeric(),
  timestamp: t.integer(),
  blockNumber: t.integer(),
  transactionHash: t.text(),
}));
import { ponder } from "ponder:registry";
import { placeOrder, orderBook } from "../ponder.schema";

ponder.on("OrderBookFactory:OrderBookCreated", async ({ event, context }) => {
  await context.db.insert(orderBook).values({
    id: event.args.orderBook.toString(),
    address: event.args.orderBook.toString(),
    tokenName: event.args.tokenName,
    tokenSymbol: event.args.tokenSymbol,
    quoteAsset: event.args.quoteAsset.toString(),
    initialPrice: event.args.initialPrice.toString(),
    bottomPrice: event.args.bottomPrice.toString(),
    bottomAmount: event.args.bottomAmount.toString(),
    anchorPrice: event.args.anchorPrice.toString(),
    anchorAmount: event.args.anchorAmount.toString(),
    discoveryPrice: event.args.discoveryPrice.toString(),
    discoveryAmount: event.args.discoveryAmount.toString(),
    timestamp: Number(event.block.timestamp),
    blockNumber: Number(event.block.number),
    transactionHash: event.transaction.hash,
  });
});

ponder.on("OrderBook:PlaceOrder", async ({ event, context }) => {
  await context.db.insert(placeOrder).values({
    id: event.transaction.hash,
    // @ts-ignore
    orderBookAddress: context.contracts.OrderBook.address,
    amount: event.args.amount.toString(),
    user: event.args.user.toString(),
    timestamp: Number(event.block.timestamp),
    blockNumber: Number(event.block.number),
    transactionHash: event.transaction.hash,
  });
});
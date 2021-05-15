# Domain of Interest: Cryptocurrencies/Blockchain

## Why are you interested in this field/domain?

- For one, there's a lot of buzz around the space and it'd be interesting to learn more about it. Additionally, the decentralization potential inherent in cryptocurrency not just for finance but also for governance are interesting
- There are also other factors like electricity usage and possible geopolitical issues that can arise from cryptocurrencies that would be interesting to explore with data to see if the cost is worth the benefits

## What other examples of data driven projects have you found related to this domain?

- [Bitnodes](https://bitnodes.io/): Visualizing the geological locations of BitCoin Nodes
- [Bitcoin Mining Power Consumption Visualization](https://www.visualcapitalist.com/visualizing-the-power-consumption-of-bitcoin-mining/): Article with a few graphics illustrating electricity usage of Bitcoin compared to other organizations (corporations, states, countries)
- [Coin 360](https://coin360.com/): Displays a size-based visualization for daily volume transacted for some cryptocurrencies as well as for their market cap.
- [Bitcoin trading volume + market share Visualization](https://data.bitcoinity.org/markets/volume/30d?c=e&t=b): BTC trading volume and market share visualization

## What data-driven questions do you hope to answer about this domain?

- How has the usage between the two biggest cryptocurrencies (Bitcoin and Ethereum) compared to each other? Is one growing faster than the other [Metrics: Market-cap](https://coin360.com)? Or are they growing equally?
- Which cryptocurrency is the most important in day to day use? [Metric to look at: Daily transacted volume in dollars](https://coin360.com/?dependsOn=volume)
- What areas of the world are most involved in the cryptocurrency mining process? How much electricity have they used overtime and how has that impacted certain geological areas?
- How does price and price growth impact other parts of a cryptocurrency like mining and geological node locations?

# Datasets

## Cryptocurrency Price History

- [Link](https://coinmarketcap.com/historical/)

### How was the data collected or generated?

- Every minute, the various cryptocurrency exchanges are queried for their most recent market data. All data is run through several data cleaning and verification algorithms to ensure data integrity.
- Coinmarketcap collects their data from several APIs. They also provide live tracking of crypto prices.

### How many observations (rows) are in your data?

- 200 observations for each snapshot.

### How many features (columns) are in the data?

- 10 features for each snapshot.

### What questions (from above) can be answered using the data in this dataset?

- This dataset will help in answering the question pertaining to the comparison of Bitcoin and Ethereum usage and growth. Also the question reflecting day to day use.

### Misc

- A [simple R tutorial](https://www.cryptodatadownload.com/blog/how-to-download-coinbase-price-data-R.html) on getting data using their API

## Cryptocurrency Historical Prices:

- [Link](https://www.kaggle.com/sudalairajkumar/cryptocurrencypricehistory)

### How was the data collected or generated?

- This data is taken from [CoinMarketCap](https://coinmarketcap.com/), and it contains the historical prices for different crypto currencies (including daily highs and lows) in dollars. Since it was collected from coinmarketcap, the way that they generated the data is similar to what is described for the dataset above. The exchanges determine prices based on the trading volume of the asset and it’s supply and demand.

### How many observations (rows) are in your data?

- There are 146 observations in the dataset with additional data sets provided.

### How many features (columns) are in the data?

- There are 10 features in the dataset.

### What questions (from above) can be answered using the data in this dataset?

- This dataset could be used to answer “Which cryptocurrency is the most important in day to day use?”

## Cryptocurrency Data Pull

- [Link](https://www.kaggle.com/sudalairajkumar/cryptocurrency-data-pull)

### How was the data collected or generated?

- Data is from [CoinMarketCap](https://coinmarketcap.com/), [Blockchain Info](https://www.blockchain.com/explorer), and[EtherScan](https://etherscan.io/charts)
- Contains historical price and market cap information by market capitalization

### How many observations (rows) are in your data?

- There are multiple datasets
- One of them, bitcoin_dataset.csv contains 2920 observations

### How many features (columns) are in the data?

- The same dataset has 24 columns, some being market_price, total_bitcoins, market_cap, blocks_size, and trade_volume.

### What questions (from above) can be answered using the data in this dataset?

- How has the usage between Bitcoin and Ethereum compared to each other?
- Which cryptocurrency is the most important in day to day use?

## Bitcoin Blockchain Historical Data

- [Link](https://www.kaggle.com/bigquery/bitcoin-blockchain)

### Where did you download the data (e.g., a web URL)?

- Not actually downloaded yet but can be retrieved through the Google Big Data API

### How was the data collected or generated?

- The data is compiled by Google and they presumably retrieved the data off of the Bitcoin Blockchain using a node (since blockchain data is copied to every node in the network and contains transaction data all the way back to the launch of Bitcoin)

### How many observations (rows) are in your data?

- There are over 366 million rows for the transaction dataset

### How many features (columns) are in the data?

- There are many sub datasets within this larger data set but it averages around 17 features

### What questions (from above) can be answered using the data in this dataset?

- We can help answer the price impacts of Bitcoin and we can measure usage on the Bitcoin blockchain

## Ethereum Historical Data | Kaggle

- [Link](https://www.kaggle.com/kingburrito666/ethereum-historical-data)

### How was the data collected or generated?

- The data is compiled by a Kaggle user named Liam Larsen and he/she presumably retrieved the data off of the Ethereum Blockchain using a node (since blockchain data is copied to every node in the network and contains transaction data all the way back to the launch of Ethereum)

### How many observations (rows) are in your data?

- There are 1164 rows for each sub data set

### How many features (columns) are in the data?

- There are many sub datasets within this larger data set but it averages around 3-4 features

### What questions (from above) can be answered using the data in this dataset?

- We can help answer the price impacts of Ethereum and we can measure usage on the Ethereum blockchain. Ethereum is a bit different from Bitcoin and other blockchains in that it can run decentralized applications, and some of the commands running in those functions require a certain amount of money to run. While we could just look at raw ETH transferred, this dataset also helps us determine how much was used in running decentralized applications.

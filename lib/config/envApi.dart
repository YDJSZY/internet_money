Map envConfig = {
  "appSupportLan": ["zh", "en"], // app支持的语言
  "TEST": {
    "env": "test",
    "apiPrefix": "https://apitest.fscoin.club/",
    "searchTxApi": "http://103.75.1.99:7022/api/v1/",
    "defaultSelectChain": "ETH",
    "btcBrowserAddress": "http://47.75.223.192:3001/insight-api/",
    "supportChain": [
      {
        "key": "USDT",
        "symbol": "USDT",
        "ip": "47.75.223.192",
        "port": "3001",
        "precision": 1e8,
        "testnet": true
      },
      {
        "key": "BTC",
        "symbol": "BTC",
        "ip": "47.75.223.192",
        "port": "3001",
        "precision": 1e8,
        "testnet": true
      },
      {
        "key": "ETH",
        "symbol": "ETH",
        "ip": "103.75.1.99",
        "port": "8000",
        "precision": 1e18,
        "testnet": true
      }
    ],
    "blockChainSite": {
      "ETH": "https://rinkeby.etherscan.io/",
      "USDT": "https://rinkeby.etherscan.io/",
      "BTC": "https://live.blockcypher.com/btc-testnet/"
    }
  },
  "PROD": {
    "env": "prod",
    "apiPrefix": "https://api.fscoin.club/",
    "searchTxApi": "http://cd.fscoin.club:7022/api/v1/",
    "defaultSelectChain": "ETH",
    "btcBrowserAddress": "https://insight.bitpay.com/api/",
    "supportChain": [
      {
        "key": "USDT",
        "symbol": "USDT",
        "ip": "https://btc.fscoin.club",
        "port": "443",
        "precision": 1e18,
        "testnet": false
      },
      {
        "key": "BTC",
        "symbol": "BTC",
        "ip": "https://btc.fscoin.club",
        "port": "443",
        "precision": 1e8,
        "testnet": false
      },
      {
        "key": "ETH",
        "symbol": "ETH",
        "ip": "https://eth.fscoin.club",
        "port": "443",
        "precision": 1e18,
        "testnet": false
      }
    ],
    "blockChainSite": {
      "ETH": "https://etherscan.io/",
      "USDT": "https://www.omniexplorer.info/",
      "BTC": "https://live.blockcypher.com/btc/"
    }
  }
};
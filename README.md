# CoinCapSwiftAPI
A Swift CoinCap API

## Usage:
``` swift
Coincap().assets { (cryptocurrencies) in
    print(cryptocurrencies.map { $0.name })
    // Prints ["Bitcoin", "Ethereum", "Tether", "XRP" ... ]
}
```

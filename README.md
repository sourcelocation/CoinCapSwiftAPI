# CoinCapSwiftAPI
A CoinCap API written fully on modern language Swift.

## Usage:
``` swift
Coincap().assets { (cryptocurrencies) in
    print(cryptocurrencies.map { $0.name })
    // Prints ["Bitcoin", "Ethereum", "Tether", "XRP" ... ]
}
```

# CoinCapSwiftAPI
A CoinCap API written fully on a modern language Swift.

## Usage
#### Get assets sorted by rank:
``` swift
Coincap().assets { (cryptocurrencies) in
    print(cryptocurrencies.map { $0.name })
    // Prints ["Bitcoin", "Ethereum", "Tether", "XRP" ... ]
}
```
#### Search assets:
``` swift
Coincap().assets(search: "Bitcoin") { (cryptocurrencies) in
    print(cryptocurrencies.map { $0.name })
    // Prints ["Bitcoin", "Bitcoin Cash", "Bitcoin SV" ... ]
}
```

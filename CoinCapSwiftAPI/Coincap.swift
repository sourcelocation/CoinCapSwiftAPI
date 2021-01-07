//
//  Coincap.swift
//  CoinCapSwiftAPI
//
//  Created by Матвей Анисович on 06.01.2021.
//

import Foundation

class Coincap {
    func assets(search: String? = nil, ids: String? = nil, limit: Int = 100, offset: Int = 0, completion: @escaping ([Crypto]) -> Void) {
        
        let url = URL(string: "http://api.coincap.io/v2/assets?\(search != nil ? "search=\(search!)&" : "")\(ids != nil ? "ids=\(ids!)&" : "")limit=\(limit)&offset=\(offset)")!

        let task = URLSession.shared.dataTask(with: url) {(data1, response, error) in
            guard let data1 = data1 else {print(error ?? "Coincap: No error but data is empty!"); return }
            let jsonString = String(data: data1, encoding: .utf8)!
            guard let dictionary = self.convertToDictionary(jsonString) else { print("CoinCapSwiftAPI: Error parsing json!"); return }
            let data = dictionary["data"] as! [[String:Any]]
            
            var cryptocurrencies: [Crypto] = []
            for cryptoData in data {
                let crypto = Crypto(id: cryptoData["id"] as? String, rank: Int(cryptoData["rank"] as! String)!, symbol: cryptoData["symbol"] as? String, name: cryptoData["name"] as? String, supply: Double(cryptoData["supply"] as! String)!, maxSupply: Double((cryptoData["maxSupply"] as? String) ?? "Null") ?? nil, marketCapUsd: Double(cryptoData["marketCapUsd"] as! String)!, volumeUsd24Hr: Double(cryptoData["volumeUsd24Hr"] as! String)!, priceUsd: Double(cryptoData["priceUsd"] as! String)!, changePercent24Hr: Double(cryptoData["changePercent24Hr"] as! String)!, vwap24Hr: Double((cryptoData["vwap24Hr"] as? String) ?? "Null") ?? nil)
                cryptocurrencies.append(crypto)
            }
            completion(cryptocurrencies)
            
        }

        task.resume()
    }
    
    fileprivate func convertToDictionary(_ text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

class Crypto {
    var id: String?
    var rank: Int?
    var symbol: String?
    var name: String?
    var supply: Double?
    var maxSupply: Double?
    var marketCapUsd: Double?
    var volumeUsd24Hr: Double?
    var priceUsd: Double?
    var changePercent24Hr: Double?
    var vwap24Hr: Double?
    
    init(id: String?, rank: Int?, symbol: String?, name: String?, supply: Double?, maxSupply: Double?, marketCapUsd: Double?, volumeUsd24Hr: Double?, priceUsd: Double?, changePercent24Hr: Double?, vwap24Hr: Double?) {
        self.id = id
        self.rank = rank
        self.symbol = symbol
        self.name = name
        self.supply = supply
        self.maxSupply = maxSupply
        self.marketCapUsd = marketCapUsd
        self.volumeUsd24Hr = volumeUsd24Hr
        self.priceUsd = priceUsd
        self.changePercent24Hr = changePercent24Hr
        self.vwap24Hr = vwap24Hr
    }
}

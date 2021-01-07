//
//  main.swift
//  CoinCapSwiftAPI
//
//  Created by Матвей Анисович on 06.01.2021.
//

import Foundation

Coincap().assets { (cryptocurrencies) in
    print("Done.")
}

RunLoop.main.run()

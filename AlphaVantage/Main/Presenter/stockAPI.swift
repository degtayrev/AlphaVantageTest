//
//  stockAPI.swift
//  AlphaVantage
//
//  Created by Muhammad Raihan on 16/12/20.
//

import Foundation

class StockAPI{
    static let shared = StockAPI()
    
    func fetchStockList(symbol: String, interval:String, completion:@escaping (_ response1:[String: TimeSeries1Min], _ keyCount:[String])->()){
        var keyCount: [String] = []
        
        let stocksURL = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(symbol)&interval=1min&apikey=OVVBZVPACIGV3MTU")
            URLSession.shared.dataTask(with: stocksURL!) { (data, response, error) in
              if let error = error {
                print(error)
                return
              }
              do {
                switch interval {
                case "1min":
                    let response = try JSONDecoder().decode(Response1.self, from: data!)
                    
                    for key in response.timeSeries1Min.keys.sorted(by: <){
                        keyCount.append(key)
                        
                    }
                    completion(response.timeSeries1Min, keyCount)
                
                
                
//                    for keys in response.timeSeries1Min.keys{
//                        print (response.timeSeries1Min["\(keys)"]?.the1Open)
//                    }
                    
                case "5min":
                    let response = try JSONDecoder().decode(Response2.self, from: data!)
                    print(response.timeSeries5Min["\(response.metaData.the3LastRefreshed)"])
                    response.timeSeries5Min.forEach({ (keyValue) in
                      print(keyValue)
                        print("hehe")
                    })
                    
                case "15min":
                    let response = try JSONDecoder().decode(Response3.self, from: data!)
                    print(response.timeSeries15Min["\(response.metaData.the3LastRefreshed)"])
                    response.timeSeries15Min.forEach({ (keyValue) in
                      print(keyValue)
                        print("hehe")
                    })
                    
                case "30min":
                    let response = try JSONDecoder().decode(Response4.self, from: data!)
                    print(response.timeSeries30Min["\(response.metaData.the3LastRefreshed)"])
                    response.timeSeries30Min.forEach({ (keyValue) in
                      print(keyValue)
                        print("hehe")
                    })
                    
                case "60min":
                    let response = try JSONDecoder().decode(Response5.self, from: data!)
                    print(response.timeSeries60Min["\(response.metaData.the3LastRefreshed)"])
                    response.timeSeries60Min.forEach({ (keyValue) in
                      print(keyValue)
                        print("hehe")
                    })
                    
                default :
                    print("")
                }
              } catch {
                print(error)
              }
            }.resume()
        
    }
}

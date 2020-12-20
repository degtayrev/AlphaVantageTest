//
//  ComparePresenter.swift
//  AlphaVantage
//
//  Created by Muhammad Raihan on 19/12/20.
//

import Foundation

class ComparePresenter{
    var open:String = ""
    var low:String = ""
    var dateLast:String = ""
    
    func fetchStockCompare(symbol: String, completion: @escaping (_ open: String,_ low: String,_ date: String)->()) {
        let session = URLSession.shared
        let quoteURL = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=\(symbol)&apikey=OVVBZVPACIGV3MTU")!
        let dataTask = session.dataTask(with: quoteURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("Error:\n\(error)")
            }
            else {
                if let data = data {
                    if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                        let metadata = jsonObj.value(forKey: "Meta Data") as? NSDictionary
                        if metadata != nil{
                            let lastRefresh = metadata!.value(forKey: "3. Last Refreshed")
                            if let time = jsonObj.value(forKey: "Time Series (Daily)") as? NSDictionary {
                                DispatchQueue.main.async {
                                    if let date = time[lastRefresh!] as? NSDictionary {
                                        self.open = date.value(forKey: "1. open") as! String
                                        self.low = date.value(forKey: "3. low") as! String
                                        self.dateLast = lastRefresh as! String
                                        completion(self.open, self.low, self.dateLast)


                                    }
                                }
                            } else {
                                print("Error: unable to find quote")
                                DispatchQueue.main.async {
                                }
                            }
                        }else{
                            print("Error: Symbol not Found")
                            
                            DispatchQueue.main.async {
                                completion("0","0","0")
                            }
                        }
                    } else {
                        print("Error: unable to convert json data")
                        DispatchQueue.main.async {
                        }
                    }
                } else {
                    print("Error: did not receive data")
                    DispatchQueue.main.async {
                    }
                }
            }
        }
        dataTask.resume()

    }
}

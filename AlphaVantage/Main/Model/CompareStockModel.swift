//
//  CompareStockModel.swift
//  AlphaVantage
//
//  Created by Muhammad Raihan on 19/12/20.
//

import Foundation

struct ModelCompareData{
    let symbol: String
    let date: String
    let open: String
    let low: String
}


func getStockQuote() {
    let session = URLSession.shared
    let quoteURL = URL(string: "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=AAPL&apikey=OVVBZVPACIGV3MTU")!
    let dataTask = session.dataTask(with: quoteURL) {
        (data: Data?, response: URLResponse?, error: Error?) in
        if let error = error {
            print("Error:\n\(error)")
        }
        else {
            if let data = data {
                let dataString = String(data: data, encoding: String.Encoding.utf8)
                print("All the quote data:\n\(dataString!)")
                if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                    if let quoteDictionary = jsonObj.value(forKey: "Global Quote") as? NSDictionary {
                        DispatchQueue.main.async {
                            if let symbol = quoteDictionary.value(forKey: "01. symbol") {
                                print(symbol)
                            }
                            if let open = quoteDictionary.value(forKey: "02. open") {
                                print(open)
                            }
                            if let high = quoteDictionary.value(forKey: "03. high") {
                                print(high)
                            }
                            if let low = quoteDictionary.value(forKey: "04. low") {
                                //self.stockLowLabel.text = low as? String
                            }
                            if let price = quoteDictionary.value(forKey: "05. price") {
                                // self.stockPriceLabel.text = price as? String
                            }
                            if let volume = quoteDictionary.value(forKey: "06. volume") {
                                // self.stockVolumeLabel.text = volume as? String
                            }
                            if let latest = quoteDictionary.value(forKey: "07. latest trading day") {
                                // self.stockLastTradingDayLabel.text = latest as? String
                            }
                            if let previous = quoteDictionary.value(forKey: "08. previous close") {
                                // self.stockPreviousCloseLabel.text = previous as? String
                            }
                            if let change = quoteDictionary.value(forKey: "09. change") {
                                //self.stockChangeLabel.text = change as? String
                            }
                            if let changePercent = quoteDictionary.value(forKey: "10. change percent") {
                                //self.stockChangePercentLabel.text = changePercent as? String
                            }
                        }
                    } else {
                        print("Error: unable to find quote")
                        DispatchQueue.main.async {
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

func getStockDaily() {
    let session = URLSession.shared
    let quoteURL = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=AAPL&apikey=OVVBZVPACIGV3MTU")!
    let dataTask = session.dataTask(with: quoteURL) {
        (data: Data?, response: URLResponse?, error: Error?) in
        if let error = error {
            print("Error:\n\(error)")
        }
        else {
            if let data = data {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                    let metadata = jsonObj.value(forKey: "Meta Data") as? NSDictionary
                    let lastRefresh = metadata!.value(forKey: "3. Last Refreshed")
                    print(lastRefresh!)
                    
                    if let time = jsonObj.value(forKey: "Time Series (Daily)") as? NSDictionary {
                        DispatchQueue.main.async {
                            if let date = time[lastRefresh!] as? NSDictionary {
                                print("TESTING")
                                print(date.value(forKey: "1. open")!)
                            }
                        }
                    } else {
                        print("Error: unable to find quote")
                        DispatchQueue.main.async {
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

func fetchStockDataCalendar() {

    let url = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=\("AAPL")&apikey=AAPL&apikey=OVVBZVPACIGV3MTU")

    let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if error != nil {
            print ("ERROR")
        } else {
            if let content = data {
                do {
                    let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    print("yuhuu")
                    print(myJson)
                    if let time = myJson["Time Series (Daily)"] as? NSDictionary  {
                        for (key, value) in time {
                            if let value = value as? Dictionary<String, String> {
                                if let close = value["4. close"] {
                                    //print("\(key) CloseStock-> \(close)")
                                }
                            }
                        }
                    }

                }  catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
    task.resume()
}

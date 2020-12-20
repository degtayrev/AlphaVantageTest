//
//  StockVC.swift
//  AlphaVantage
//
//  Created by Muhammad Raihan on 19/12/20.
//

import Foundation
import UIKit

class StockVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var response: [String: TimeSeries1Min] = [:]
    var keyCount: [String] = []
    var selectedSymbol: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        StockAPI.shared.fetchStockList(symbol: "AAPL", interval: "1min"){(response1, keycount)in
//            print(response1.metaData.the2Symbol)
//            print(response1.timeSeries1Min["\(keycount[0])"]?.the1Open)
//        }
        
        searchBar.delegate = self
        
        //Table View Initiator
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "StockViewCell", bundle: self.nibBundle), forCellReuseIdentifier: "stockViewCell")
        tableView.rowHeight = 79
        //tableView.separatorColor = UIColor.clear
    }
    
    
    func loadData(symbol:String){
        StockAPI.shared.fetchStockList(symbol: symbol, interval: "1min"){(response1, keycount)in
            self.response = response1
            self.keyCount = keycount
        }
        self.tableView.reloadData()
    }
    
    
    
    
}

extension StockVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyCount.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "stockViewCell") as? StockViewCell else {return UITableViewCell()}
        if keyCount.count != 0{
            cell.configureCell(response: response, key: keyCount[indexPath.row], symbol: selectedSymbol)

        }
        return cell
    }
}

extension StockVC: UISearchBarDelegate{
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar){
        selectedSymbol = searchBar.text!
        loadData(symbol: searchBar.text!)
    }
}



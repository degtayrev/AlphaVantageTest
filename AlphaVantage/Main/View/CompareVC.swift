//
//  CompareVC.swift
//  AlphaVantage
//
//  Created by Muhammad Raihan on 16/12/20.
//

import UIKit


class CompareVC: UIViewController, getCompareData{
    func passDataBack(data: [String]) {
        symbol = data
        self.updateData()
    }
    

    @IBOutlet weak var tableView: UITableView!
    var symbol: [String] = []
    var selectedOpen: [String] = []
    var selectedLow: [String] = []
    var selectedDate: [String] = []
    var selectedSymbol: [String] = []
    
    var presenter: ComparePresenter?
    var SelectedSymbol = [ModelCompareData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = ComparePresenter()
//        presenter?.fetchStockCompare(symbol: "AAPL"){(open,low,date)in
//            print(open)
//            print(low)
//            print(date)
//        }
        
        
        
        //Table View Initiator
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CompareViewCell", bundle: self.nibBundle), forCellReuseIdentifier: "compareViewCell")
        tableView.rowHeight = 113
        //tableView.separatorColor = UIColor.clear
        
        let compareButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(compareButtonTap))
        self.navigationItem.rightBarButtonItem = compareButton
        
        updateData()
    }

    @objc func compareButtonTap(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let setCompareVC = storyboard.instantiateViewController(identifier: "SetCompare") as! SetCompareVC
        setCompareVC.delegate = self
        self.present(setCompareVC, animated: true, completion: nil)
    }
    
    func updateData(){
        selectedDate.removeAll()
        selectedOpen.removeAll()
        selectedLow.removeAll()
        selectedSymbol.removeAll()
        
        
        for i in symbol{
            presenter?.fetchStockCompare(symbol: i){(open,low,date)in
                if open != "0"{
                    print("TEST")
                    self.selectedLow.append(low)
                    self.selectedOpen.append(open)
                    self.selectedDate.append(date)
                    self.selectedSymbol.append(i)
                }
                print(self.selectedSymbol)

                
                
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tableView.reloadData()
        }
        
    }
    

}

extension CompareVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedSymbol.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "compareViewCell") as? CompareViewCell else {return UITableViewCell()}
        if selectedSymbol.count != 0{
            cell.configureCell(symbol: selectedSymbol[indexPath.row], date: selectedDate[indexPath.row], open: selectedOpen[indexPath.row], low: selectedLow[indexPath.row])
        }
        return cell
    }
}

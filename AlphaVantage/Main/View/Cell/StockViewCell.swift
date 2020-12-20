//
//  StockViewCell.swift
//  AlphaVantage
//
//  Created by Muhammad Raihan on 20/12/20.
//

import UIKit

class StockViewCell: UITableViewCell {

    @IBOutlet weak var openLbl: UILabel!
    @IBOutlet weak var symbolLbl: UILabel!
    @IBOutlet weak var highLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var lowLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(response: [String: TimeSeries1Min], key:String, symbol:String){
        symbolLbl.text = symbol
        openLbl.text = response["\(key)"]?.the1Open
        lowLbl.text = response["\(key)"]?.the3Low
        highLbl.text = response["\(key)"]?.the2High
        dateLbl.text = key
    }
    
}

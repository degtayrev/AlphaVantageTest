//
//  CompareViewCell.swift
//  AlphaVantage
//
//  Created by Muhammad Raihan on 16/12/20.
//

import UIKit

class CompareViewCell: UITableViewCell {

    @IBOutlet weak var symbolLbl: UILabel!
    @IBOutlet weak var openLbl: UILabel!
    @IBOutlet weak var lowLbl: UILabel!
    @IBOutlet weak var dateLAbel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        openLbl.widthAnchor.constraint(equalToConstant: 170).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(symbol:String,date:String,open:String,low:String){
        dateLAbel.text = date
        symbolLbl.text = symbol
        openLbl.text = ("Open : \(open)")
        lowLbl.text = ("Low : \(low)")
        
    }
    
}

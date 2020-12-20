//
//  SetCompareVC.swift
//  AlphaVantage
//
//  Created by Muhammad Raihan on 20/12/20.
//

import Foundation
import UIKit

protocol getCompareData {
    func passDataBack(data: [String])
}

class SetCompareVC: UIViewController{
    @IBOutlet weak var stocklbl1: UITextField!
    @IBOutlet weak var stockLbl2: UITextField!
    @IBOutlet weak var stockLbl3: UITextField!

    
    var symbols: [String] = []
    var delegate:getCompareData?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneTapped(_ sender: Any) {
        symbols.append(stocklbl1.text!)
        symbols.append(stockLbl2.text!)
        symbols.append(stockLbl3.text!)
        
        
        
        
        delegate?.passDataBack(data: symbols)
        self.dismiss(animated: true, completion: nil)
    }
}

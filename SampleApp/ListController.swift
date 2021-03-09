//
//  ListController.swift
//  SampleApp
//
//  Created by Gauthier Schmitt on 09/03/2021.
//

import Foundation
import UIKit
import SwiftyJSON
import SwiftGifOrigin

let defaults = UserDefaults.standard

class ListController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        var i = 0;
        
        while((defaults.string(forKey:String(i))) != nil)
        {
            i = i+1
            if let stringOne = defaults.string(forKey: String(i)) {
                    print(stringOne) // Some String Value
            }
        }
    }
    @IBOutlet var tvData: UITableView!
    
}

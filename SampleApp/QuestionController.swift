//
//  QuestionController.swift
//  SampleApp
//
//  Created by Gauthier Schmitt on 05/03/2021.
//

import Foundation

import UIKit
import SwiftyJSON
import Alamofire

var urlStringM: String = "https://www.boredapi.com/api/activity?price=0.0"

class QuestionController: UITableViewController {
    
    @IBOutlet weak var payant: UISegmentedControl!
    
    @IBAction func payantAction(_ sender: Any) {
        switch payant.selectedSegmentIndex{
            case 0: urlStringM = "https://www.boredapi.com/api/activity?price=0.0"
                print(urlStringM);
            case 1: urlStringM = "https://www.boredapi.com/api/activity?minprice=0.1"
                print(urlStringM);
        default: break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is randomActivitiesViewController {
            let vc = segue.destination as? randomActivitiesViewController
            vc?.sendData = urlStringM
        }
    }
}

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
var sendUrl: String = urlStringM
var Participants: Float = 1
let step: Float = 1

class QuestionController: UITableViewController {
    
    @IBOutlet weak var pbParticpantsOutlet: UISlider!
    @IBOutlet weak var payant: UISegmentedControl!
    @IBOutlet weak var lblPart: UILabel!
    
    
    @IBAction func payantAction(_ sender: Any) {
        switch payant.selectedSegmentIndex{
            case 0: urlStringM = "https://www.boredapi.com/api/activity?price=0.0"
                print(urlStringM);
            case 1: urlStringM = "https://www.boredapi.com/api/activity?minprice=0.1"
                print(urlStringM);
        default: break;
        }
    }
    
    @IBAction func pbParticipaationAction(_ sender: Any) {
        
        var roundedValue = round(pbParticpantsOutlet.value / step) * step
        Participants = roundedValue
        lblPart.text = (NSString(format: "%.2f", Participants) as String)
    }
    
    override func viewDidLoad() {
        self.title = "What are you looking for ?"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        sendUrl = urlStringM + "&participants=" + (NSString(format: "%.2f", Participants) as String)
        print(sendUrl)
        if segue.destination is randomActivitiesViewController {
            let vc = segue.destination as? randomActivitiesViewController
            vc?.sendData = sendUrl
        }
    }

}

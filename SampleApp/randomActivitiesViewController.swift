//
//  randomActivitiesViewController.swift
//  SampleApp
//
//  Created by Thomas Paulus on 05/03/2021.
//

import Foundation

import UIKit
import SwiftyJSON
import Alamofire


class randomActivitiesViewController: UIViewController {
    
   
    @IBOutlet weak var activityNom: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       struct Bored: Codable {
           var activity: String
           var type: String
           var participants: Int
           var price: Double
           var link: String?
           var key: String
           var accessibility: Double
        
       }
        
        let urlString = "https://www.boredapi.com/api/activity"
        if let url = URL(string: urlString)
        {
            URLSession.shared.dataTask(with: url) { data, res, err in
                if let data = data {
                    
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(Bored.self, from: data) {
                        print(json)
                        print(json.activity)
                        
                        DispatchQueue.main.async {
                                   self.activityNom.text = json.type
                               }
                        }
                    }
                }.resume()
                
        }
       
        
        
    }
          
        
    }


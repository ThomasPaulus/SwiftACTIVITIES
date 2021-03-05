import Foundation

import UIKit
import SwiftyJSON

class randomActivitiesViewController: UIViewController {

    var sendData:String = ""
    

    @IBOutlet weak var activityNom: UILabel!
    @IBOutlet weak var activityType: UILabel!
    @IBOutlet weak var activityPrice: UILabel!
    @IBOutlet weak var activityLink: UILabel!
    @IBOutlet weak var activityAccessibility: UILabel!
    
    
    @IBOutlet weak var pbPrice: UIProgressView!
    @IBOutlet weak var pbAccessibility: UIProgressView!
    
    
    
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

        let urlString = sendData
        if let url = URL(string: urlString)
        {
            URLSession.shared.dataTask(with: url) { data, res, err in
                if let data = data {

                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(Bored.self, from: data) {
                        print(json)
                        print(json.activity)
                        DispatchQueue.main.async {
                            self.activityNom.text = json.activity
                            self.activityType.text = "Type : " + json.type
                            self.activityPrice.text = String(format: "%.1f", json.price)
                            self.pbPrice.progress = (Float)(json.price)
                            self.activityLink.text = json.link ?? " "
                            self.activityAccessibility.text = String(format: "%.1f", json.accessibility)
                            self.pbAccessibility.progress = (Float)(json.accessibility)
                              }
                        }
                    }
                }.resume()

        }



    }


    }

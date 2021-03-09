import Foundation
import UIKit
import SwiftyJSON
import SwiftGifOrigin

class randomActivitiesViewController: UIViewController {

    var sendData:String = ""
    let defaults = UserDefaults.standard

    @IBOutlet weak var activityNom: UILabel!
    @IBOutlet weak var activityType: UILabel!
    @IBOutlet weak var activityPrice: UILabel!
    @IBOutlet weak var activityLink: UILabel!
    @IBOutlet weak var activityAccessibility: UILabel!
    
    @IBOutlet weak var pbPrice: UIProgressView!
    @IBOutlet weak var pbAccessibility: UIProgressView!
    @IBOutlet weak var imgGif: UIImageView!
    @IBOutlet weak var imgErr: UIImageView!
    
    //let imageView = UIImageView()
    //imgGif.loadGif(name: "load")
    
    override func loadView() {
        super.loadView()
        imgGif.loadGif(asset: "load")
    }

    
    override func viewDidLoad() {
       
        self.title = "Try this !"
        
        
        
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
        if self.sendData != "https://www.boredapi.com/api/activity?price=0.0&participants=3.00"
        {
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
                            sleep(2)
                            self.imgGif.isHidden = true
                              }
                        }
                    }
                }.resume()
            }
        }
        else
        {
            self.imgGif.isHidden = true
            self.imgErr.isHidden = false
        }



    }

    @IBAction func btnRetry(_ sender: Any) {
        self.imgGif.isHidden = false
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
        if self.sendData != "https://www.boredapi.com/api/activity?price=0.0&participants=3.00"
        {
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
                            sleep(2)
                            self.imgGif.isHidden = true
                              }
                        }
                    }
                }.resume()
            }
        }
        else
        {
            self.imgGif.isHidden = true
            self.imgErr.isHidden = false
        }
    }
    @IBAction func btnSave(_ sender: Any) {
        var i = 0;
        
        while((defaults.string(forKey:String(i))) != nil)
        {
            i = i+1
        }
        defaults.set(activityNom.text, forKey: String(i))
        print("saved at :" + String(i))
    }
    
    }

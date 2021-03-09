import UIKit
 class ListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
     // Data model: These strings will be the data for the table view cells
     var animals = [String]()
     let defaults = UserDefaults.standard
     // cell reuse id (cells that scroll out of view can be reused)
     let cellReuseIdentifier = "cell"
     
     // don't forget to hook this up from the storyboard
     
    @IBOutlet var tableView: UITableView!
    
     override func viewDidLoad() {
         super.viewDidLoad()
        self.title = "List"
        var i = 0;
        
        while((defaults.string(forKey:String(i))) != nil)
        {
            i = i+1
            if let stringOne = defaults.string(forKey: String(i)) {
                    print(stringOne) // Some String Value
                 animals += [stringOne]
            }
        }
         
         // Register the table view cell class and its reuse id
         self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
         
         // (optional) include this line if you want to remove the extra empty cell divider lines
         // self.tableView.tableFooterView = UIView()

         // This view controller itself will provide the delegate methods and row data for the table view.
         tableView.delegate = self
         tableView.dataSource = self
     }
     
     // number of rows in table view
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.animals.count
     }
     
     // create a cell for each table view row
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! UITableViewCell
         
         // set the text from the data model
         cell.textLabel?.text = self.animals[indexPath.row]
         
         return cell
     }
     
     // method to run when table view cell is tapped
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("You tapped cell number \(indexPath.row).")
     }
    // this method handles row deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            // remove the item from the data model
            animals.remove(at: indexPath.row)

            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
            //---- Delete Data ------
            var i = indexPath.row + 1;
            
            defaults.set(nil, forKey: String(i))
            
            while((defaults.string(forKey:String(i+1))) != nil)
            {
                
                if let stringOne = defaults.string(forKey: String(i+1)) {
                        print(stringOne) // Some String Value
                    defaults.set(stringOne, forKey: String(i))
                    i = i+1
                }
            }
            defaults.set(nil, forKey: String(i))
            
            //-------------------------
            
            
        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
 }
 

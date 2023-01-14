import UIKit

final class ContactsTableViewController: UITableViewController {
    
    var dataArray = [Contacts]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        loadData()

    }
    
    func loadData() {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                let dates = try JSONDecoder().decode([Contacts].self, from: data)
//                print(dates)
                DispatchQueue.main.async {
                    self.dataArray = dates
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    @IBAction func refreshControlAction(_ sender: Any) {

    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DataTableViewCell {
            
            let item = dataArray[indexPath.row]
            
            cell.refrech(item)
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

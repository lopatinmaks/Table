import UIKit

final class ViewController: UIViewController {
//MARK: Variables
    private var myTableView = UITableView()
    private var dataArray = [Contacts]()
    private var cellIdentifire = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forMethods()
    }
//MARK: Methods
    private func createTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifire)
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        view.addSubview(myTableView)
    }
//MARK: JSON
    private func loadData() {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard error == nil else { return }
    
            do {
                let dates = try JSONDecoder().decode([Contacts].self, from: data)
                DispatchQueue.main.async {
                    self.dataArray = dates
                    self.myTableView.reloadData()
                    }
                } catch let error {
                    print(error)
                }
            }.resume()
        }
    
    private func forMethods() {
        createTableView()
        loadData()
    }
}
//MARK: UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
        
        let item = dataArray[indexPath.row]
        
        cell.textLabel?.text = "id -\(item.id ?? 0)"
        cell.textLabel?.text = "postID - \(item.postID ?? 0)"
        cell.textLabel?.text = "email - \(item.email ?? "")"
        cell.textLabel?.text = "body -\(item.body ?? "")"
        cell.textLabel?.text = "name - \(item.name ?? "")"
        
        return cell
    }
//MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

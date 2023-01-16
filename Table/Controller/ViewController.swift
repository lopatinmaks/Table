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
        myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: cellIdentifire)
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        myTableView.estimatedRowHeight = 44
        myTableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(myTableView)
    }
    
    private func forMethods() {
        createTableView()
        loadData()
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
}
//MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as? MyTableViewCell else { return UITableViewCell()}
        
        let item = dataArray[indexPath.row]
        
        cell.refrech(item)
     
        return cell
    }
}
//MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}

import UIKit

final class DataTableViewCell: UITableViewCell {
//MARK: IBOutlet
    @IBOutlet private var postIDLabel: UILabel!
    @IBOutlet private var idLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var bodyLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func refrech(_ contacts: Contacts) {
        postIDLabel.text = "\(contacts.postID ?? 0)"
        idLabel.text = "\(contacts.id ?? 0)"
        nameLabel.text = contacts.name
        bodyLabel.text = contacts.body
        emailLabel.text = contacts.email
    }
}

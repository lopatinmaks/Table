import UIKit

final class MyTableViewCell: UITableViewCell {
//MARK: Variables
    private var postIDLabel = UILabel()
    private var idLabel = UILabel()
    private var nameLabel = UILabel()
    private var bodyLabel = UILabel()
    private var emailLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(postIDLabel)
        addSubview(idLabel)
        addSubview(nameLabel)
        addSubview(bodyLabel)
        addSubview(emailLabel)
        
        forMethods()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: Methods(creates labels)
    private func createPostIDLabel() {
        postIDLabel.numberOfLines = 0
        postIDLabel.adjustsFontSizeToFitWidth = true
        postIDLabel.translatesAutoresizingMaskIntoConstraints = false
        
        postIDLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        postIDLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
    }
    
    private func createIdLabel() {
        idLabel.numberOfLines = 0
        idLabel.adjustsFontSizeToFitWidth = true
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        
        idLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        idLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        idLabel.topAnchor.constraint(equalTo: postIDLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    private func createNameLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    private func createBodyLabel() {
        bodyLabel.numberOfLines = 0
        bodyLabel.adjustsFontSizeToFitWidth = true
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bodyLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        bodyLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        bodyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    private func createEmailLabel() {
        emailLabel.numberOfLines = 0
        emailLabel.adjustsFontSizeToFitWidth = true
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        emailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        emailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        emailLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    public func refrech(_ contacts: Contacts) {
        postIDLabel.text = "\(contacts.postID ?? 0)"
        idLabel.text = "\(contacts.id ?? 0)"
        nameLabel.text = contacts.name
        bodyLabel.text = contacts.body
        emailLabel.text = contacts.email
    }
    
    private func forMethods() {
        createIdLabel()
        createBodyLabel()
        createNameLabel()
        createEmailLabel()
        createPostIDLabel()
    }
}

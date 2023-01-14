import Foundation
// MARK: - Model
struct Contacts: Decodable {
    let postID, id: Int?
    let name, email, body: String?
}

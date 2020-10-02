import Foundation
import SwiftUI

struct Post:Identifiable {
    let  id = UUID()
    let name: String
    let description: String
    let imageUrl: String
    let qty: Int
}

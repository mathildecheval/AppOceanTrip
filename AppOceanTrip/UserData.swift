import Foundation

import SwiftUI

class UserData: ObservableObject {
    @Published var mail: String = ""
    @Published var motdepasse: String = ""
    @Published var prenom: String = ""
}

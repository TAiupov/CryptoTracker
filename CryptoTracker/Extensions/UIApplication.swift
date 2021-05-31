//  CryptoTracker
//
//  Created by Tagir Aiupov on 2021-05-31.
//
import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

//  CryptoTracker
//
//  Created by Tagir Aiupov on 2021-05-31.
//
import Foundation

extension String {
    
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}

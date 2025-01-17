import Foundation

class ViewModel {
    
    let databaseManager: DatabaseManagerProtocol
    var magics: [Card] = []
    
    init(databaseManager: DatabaseManagerProtocol) {
        self.databaseManager = databaseManager
    }
    
    
   
 
}

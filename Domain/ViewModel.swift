import Foundation

class ViewModel {
    
    let databaseManager: DatabaseManagerProtocol
    var magics: [SpanishCard] = []
    
    init(databaseManager: DatabaseManagerProtocol) {
        self.databaseManager = databaseManager
    }
    
    func fetchMagics(completion: @escaping () -> Void) {
        APIMagic.getMagics { cards in
            self.magics = cards
            completion()
        }
    }
    
    
   
 
}

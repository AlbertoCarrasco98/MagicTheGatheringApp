import Foundation

class APIMagic {
    
    static func getMagics(completion: @escaping (([SpanishCard]) -> Void)) {
        let path = "https://api.magicthegathering.io/v1/cards"
        guard let url = URL(string: path) else {
            //            TODO: Handler Error
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let dataMagics = data else {
                //            TODO: Handler Error
                return
            }
            
            do {
                let magics = try JSONDecoder().decode(APIResponse.self, from: dataMagics)
                
                let spanishCard = magics.cards.compactMap { card in
                    card.foreignNames?.first(where: {$0.language == "Spanish"})
                }
                completion(spanishCard)
            } catch {
                print(error, "error al decodificar")
                //            TODO: Handler Error
            }
        }
        task.resume()
    }
}

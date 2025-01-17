// Todas las cartas de la API
struct APIResponse: Codable {
    let cards: [Card]
}

// Cada carta de la API, unicamente obtengo la propiedad 'foreignNames' que es donde estan las cartas
struct Card: Codable {
    let foreignNames: [SpanishCard]?
}

// Cada carta en ESPAÑOL del array de cartas [foreignNames]
struct SpanishCard: Codable {
    let name: String?
    let type: String?
    let imageUrl: String?
    let language: String?
}

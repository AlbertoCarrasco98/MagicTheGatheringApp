import UIKit

class Assembler {
    
    static func assembly() -> UIViewController {
        let database = DatabaseManager()
        let viewModel = ViewModel(databaseManager: database)
        let mainVC = MainViewController(viewModel: viewModel)
        return mainVC
    }
    
    static func assemblerDetailVC(card: SpanishCard, viewModel: ViewModel) -> UIViewController {
        let detailVC = DetailViewController(card: card,
                                            viewModel: viewModel)
        return detailVC
    }
}

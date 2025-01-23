import UIKit

class DetailViewController: UIViewController {
    
    
    let card: SpanishCard
    let viewModel: ViewModel
    
    
    init(card: SpanishCard, viewModel: ViewModel) {
        self.card = card
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        imageMagic.load(url: card.imageUrl!)
    }
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            SpacerView(axis: .vertical, space: 50),
            imageStackView,
            SpacerView(axis: .vertical, space: 450)
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        
        return stackView
    }()
    
    private lazy var imageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            SpacerView(axis: .horizontal,
                       space: 100),
            imageMagic,
            SpacerView(axis: .horizontal,
                       space: 100)
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private lazy var imageMagic: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        
        return image
    }()
        
    private func setupUI() {
        view.backgroundColor = .systemBackground
        addConstraints()
    }
    
    private func addConstraints() {
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            view.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor)
        ])
    }
}

extension UIImageView {
    func load(url: String) {
        guard let validUrl = URL(string: url.replacingOccurrences(of: "http://",
                                                                  with: "https://"))
        else {
//            TODO: Handler error
            return
        }
        print(validUrl)
        
        URLSession.shared.dataTask(with: validUrl) { data, response, error in
            guard let dataImage = data else { return }
            guard let image = UIImage(data: dataImage)
            else {
                //            TODO: Handler error
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}

class SpacerView: UIView {
    
    enum Axis {
        case horizontal
        case vertical
    }
    
    init(axis: Axis, space: CGFloat) {
        super.init(frame: .zero)
        switch axis {
        case .horizontal:
            self.widthAnchor.constraint(equalToConstant: space).isActive = true
        case .vertical:
            self.heightAnchor.constraint(equalToConstant: space).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

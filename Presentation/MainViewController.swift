//
//  ViewController.swift
//  MagicTheGathering
//
//  Created by Juan Antonio Carrasco del Cid on 10/1/25.
//

import UIKit

class MainViewController: UIViewController {
    
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        APIMagic.getMagics { spanishCards in
            print(spanishCards)
        }
    }


}


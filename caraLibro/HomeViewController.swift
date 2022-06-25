//
//  HomeViewController.swift
//  caraLibro
//
//  Created by user194452 on 5/19/22.
//

import UIKit

enum ProviderType: String{
    case basic
}

class HomeViewController: UIViewController{
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    
    private let email: String
    private let provider: ProviderType
    
    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailLabel.text = email
        providerLabel.text = provider.rawValue
    }
}

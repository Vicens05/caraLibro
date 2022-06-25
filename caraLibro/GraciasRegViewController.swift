//
//  GraciasRegViewController.swift
//  caraLibro
//
//  Created by user195154 on 6/24/22.
//

import UIKit

enum ProviderType2: String {
    case basic
}

class GraciasRegViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    
    private let email: String
    private let provider: ProviderType2
    
    init(email: String, provider: ProviderType2) {
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
        
    }
}

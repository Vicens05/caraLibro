//
//  RegistrarViewController.swift
//  caraLibro
//
//  Created by user195154 on 5/21/22.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class RegistrarViewController: UIViewController{
    
    @IBAction private func tapToCloseKeyboard(_ sender: UITapGestureRecognizer) {
            self.view.endEditing(true)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func registrarBtn(_ sender: Any) {
        if let email = emailText.text,
           let password = password.text{
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let result = result, error == nil {
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                }else{
                    let alertController = UIAlertController(title: "Error",
                                                            message: "Se ha producido un error registrando el usuario",
                                                            preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.registerKeyboardNotification()
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.unregisterKeyboardNotification()
        }
        
        private func registerKeyboardNotification(){
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(self.keyboardWillShow(_:)),
                                                   name: UIResponder.keyboardWillShowNotification,
                                                   object: nil)
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(self.keyboardWillHide(_:)),
                                                   name: UIResponder.keyboardWillHideNotification,
                                                   object: nil)
            
        }
        
        private func unregisterKeyboardNotification(){
            NotificationCenter.default.removeObserver(self)
        }
        
        @objc private func keyboardWillHide(_ notification: Notification){
            
        }
        
        @objc private func keyboardWillShow(_ notification: Notification){
            
        }}

//
//  LoginViewController.swift
//  caraLibro
//
//  Created by user194452 on 5/19/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController{
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var botonIngresar: UIButton!
    
    
    @IBAction func botonIngresar(_ sender: Any) {
        if let email = emailText.text,
                   let password = password.text{
                    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                        if let result = result, error == nil {
                            self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                        }else{
                            let alertController = UIAlertController(title: "Error",
                                                                    message: "Se ha producido un error Cuenta o Contrasena incorrecta",
                                                                    preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                            
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
                }
        
    }
    
    @IBAction private func tapToCloseKeyboard(_ sender: UITapGestureRecognizer) {
            self.view.endEditing(true)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
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

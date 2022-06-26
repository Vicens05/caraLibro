//
//  RecoveryViewController.swift
//  caraLibro
//
//  Created by user195154 on 5/20/22.
//


import UIKit
import FirebaseAuth

class RecoveryViewController: UIViewController{
    
    
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBAction func btnIngresar(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: email.text!) { (error) in
            if error == nil {
            let alertController = UIAlertController(title: "Mensaje", message: "Enviado",
                preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                    }else {
                        let alertController = UIAlertController(title: "Error",
                            message: "Se ha producido un error al ingresar el correo", preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(alertController, animated: true, completion: nil)
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
            
        }
}

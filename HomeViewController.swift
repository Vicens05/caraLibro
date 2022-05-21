//
//  HomeViewController.swift
//  caraLibro
//
//  Created by user194452 on 5/19/22.
//

import UIKit

class HomeViewController: UIViewController{
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

//
//  LoginViewController.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 13.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var checkboxAgreeRules: CheckBox!
    
    @IBAction func checkboxAgreeRulesPressed(_ sender: Any) {
        setupLoginButton()
    }
    
    @IBOutlet weak var loginButton: DefaultButton!
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkboxAgreeRules.isChecked = false
        setupLoginButton()
    }
    
    private func setupLoginButton() {
        if checkboxAgreeRules.isChecked {
            loginButton.setTitle("Ввійти", for: .normal)
            loginButton.isEnabled = true
        } else {
            loginButton.setTitle("Зареєструватись", for: .normal)
            loginButton.isEnabled = false
        }
    }

}

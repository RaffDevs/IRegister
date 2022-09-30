//
//  ViewController.swift
//  IRegister
//
//  Created by Rafael Veronez Dias on 29/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.keyboardType = .default
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        registerButton.isEnabled = false
        registerButton.setTitleColor(.white.withAlphaComponent(0.4), for: .disabled)
    
    }


    @IBAction func tappedRegisterUIButton(_ sender: UIButton) {
        showUIAlert()
    }
    
    func validadeTextField() {
        if (
            nameTextField.text != "" &&
            emailTextField.text != "" &&
            passwordTextField.text != ""
        ) {
            registerButton.isEnabled = true
        } else {
            registerButton.isEnabled = false
        }
            
    }
    
    func showUIAlert() {
        let alert = UIAlertController(title: "Sucesso!", message: "Cadastro realizado com sucesso!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil
        ))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Invocado quando o campo começa a ser editado
        // ou quando o teclado aparece.

        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
        print(#function)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // Invocado quando o teclado desaparece

        textField.layer.borderWidth = 0
        validadeTextField()
        print(#function)

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Invocado quando o botão return é pressionado.
        print(#function)
        textField.resignFirstResponder()
        return true
    }
}

//
//  ViewController.swift
//  acres
//
//  Created by Ashton Reed Humphrey on 3/26/23.
//

import UIKit
import Firebase
import FirebaseAuth
//import LinkKit
import OSLog

class LoginViewController: UIViewController {
    let loginHeader = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
    let lightBlue = UIColor(red: 0.0, green: 0.7, blue: 1.2, alpha: 0.6)
    //var handler: Handler?

        
    func loginLabel() {
        loginHeader.translatesAutoresizingMaskIntoConstraints = false
        loginHeader.textAlignment = NSTextAlignment.center
        //loginHeader.backgroundColor = UIColor.red //uncomment this so you can see the whole view
        loginHeader.text = "Login"
        loginHeader.font = UIFont(name: "Impact",size:42)
        loginHeader.textColor = lightBlue
        view.addSubview(loginHeader)
    }
    func emailInput() {
        emailTextField.placeholder = "email"
        emailTextField.textAlignment = NSTextAlignment.left
        emailTextField.font = UIFont(name: "Serif",size:20)
        emailTextField.autocapitalizationType = .none
        //emailAddress.backgroundColor = UIColor.red
        view.addSubview(emailTextField)
    }
    func passwordInput() {
        passwordTextField.placeholder = "password"
        passwordTextField.textAlignment = NSTextAlignment.left
        passwordTextField.font = UIFont(name: "Serif",size:20)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        //password.backgroundColor = UIColor.red
        view.addSubview(passwordTextField)
    }
    func loginInButtonPressed() {
        loginButton.setTitle("Log In", for: UIControl.State.normal)
        loginButton.titleLabel?.font =  UIFont(name: "Serif", size: 20)
        loginButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        loginButton.backgroundColor = lightBlue
        view.addSubview(loginButton)
    }
    override func viewDidLoad() {
        super.viewDidLoad() //makes call to the super class
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        loginLabel()
        emailInput()
        passwordInput()
        loginInButtonPressed()
        addConstraints()
    }
    
    @objc private func buttonAction(_ sender:UIButton!){
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        handleFireBaseSignIn()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func handleFireBaseSignIn() {
        guard let email = emailTextField.text, let password = passwordTextField.text
        else {
            print("Form is not valid")
            return
        }
        //sign-in test@google.com pass: testgoogle
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error)
                self.completionBlock(false)
            }
            if(error == nil) {
                print("\n\nSuccessfully signed in...")
                self.completionBlock(true) //self works as a reference to the current object.
            }
        }
    }
    
    private func completionBlock(_ condition: Bool) {
        if(condition == true ) {
            let rootVC = HomeScreenViewController()
            //createConfiguration()
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
    }
    
    private func addConstraints() {
        loginHeader.translatesAutoresizingMaskIntoConstraints = false
        loginHeader.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginHeader.heightAnchor.constraint(equalToConstant: 45).isActive = true
        loginHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.widthAnchor.constraint(equalToConstant: 350).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: loginHeader.bottomAnchor, constant: 300).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.widthAnchor.constraint(equalToConstant: 350).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5).isActive = true
        //password.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5).isActive = true
        //password.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
    }
}


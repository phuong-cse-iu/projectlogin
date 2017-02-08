//
//  RegisterVC.swift
//  ProjectLogin
//
//  Created by TranTPhuong on 2/7/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var txtFieldAddress: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldFullName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    @IBAction func btnSubmitPressed(_ sender: Any) {
        let fullname:String = txtFieldFullName.text!
        let email:String = txtFieldEmail.text!
        let address:String = txtFieldAddress.text!
        print(fullname, email, address)
        sendMsgToServer(fullname: fullname, email: email, address: address)
    }
    
    func sendMsgToServer(fullname:String, email:String, address:String) {
        
        let url:URL = URL(string: "http://localhost:3000/login/\(fullname)/\(email)/\(address)")!
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
            do {
                let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                print(object)
            } catch {
                
            }
        }.resume()
    }

}

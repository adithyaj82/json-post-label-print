//
//  ViewController.swift
//  login
//
//  Created by Sudheer on 3/6/18.
//  Copyright © 2018 Sudheer. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    var URLReq:URLRequest?
    var URLSessionObj = URLSession(configuration: URLSessionConfiguration.default)
    var dataTask:URLSessionDataTask?
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet var labels: UILabel!
    @IBOutlet weak var passWordTF: UITextField!
    var name : String?

    @IBAction func LoginBtn(_ sender: Any) {
     self.URLReq = URLRequest(url: URL(string:"http://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php")!)
        self.URLReq?.httpMethod = "POST"
        let dataToSend = "funcName=verifyLogin&registeredEmail="+self.userNameTF.text!+"&registeredPassword="+self.passWordTF.text!
        self.URLReq?.httpBody = dataToSend.data(using: .utf8)
        self.dataTask = self.URLSessionObj.dataTask(with: URLReq!, completionHandler: { (data, response, error) in
            print(data!)
            do{
              let s = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! NSDictionary
                 print(s)
                self.name = s.value(forKey:"batchID") as? String


                DispatchQueue.main.async {
        self.labels.text = (self.name)
                  
                    
                    
                  
                }
                
            }
                
            catch
            {
                print(error)
                //print(response)
             print("error occured")
            }
        })
        self.dataTask?.resume()
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


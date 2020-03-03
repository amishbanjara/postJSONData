//
//  ViewController.swift
//  postJSON
//
//  Created by Amish Banjara on 2/9/20.
//  Copyright © 2020 Amish Banjara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        postJson { (status) in
            print(status)
        }
    }
    // post JSON Data
    func postJson(completion:@escaping (Int) -> ()){
        let url = URL(string: "https://example.com/post")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let json = [
            "email":"abc@email.com",
            "password":"password"
        ]
        
        //using URL Session
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []){
            URLSession.shared.uploadTask(with: request, from: jsonData) { (data, response, error) in
                print("some actions")
                
                if let httpResponse = response as! HTTPURLResponse?{
                    completion(httpResponse.statusCode)
                }
            }.resume()
        }
    }

}


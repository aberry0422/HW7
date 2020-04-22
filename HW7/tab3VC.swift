//
//  tab3VC.swift
//  HW7
//
//  Created by Ashawn C Berry on 4/21/20.
//  Copyright © 2020 Ashawn C Berry. All rights reserved.
//

import UIKit
import WebKit
import MessageUI

class tab3VC: UIViewController, MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller:MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
    
    
    
    @IBOutlet weak var webview: WKWebView!
    
    
    @IBAction func cedarPoint(_ sender: Any) {
        if let url = URL(string: "https://www.cedarpoint.com/"){
                   UIApplication.shared.open(url, options: [:])
               }
    }
    
    
    @IBAction func sendSMS(_ sender: Any) {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self

        composeVC.recipients = ["2164014805"]
        composeVC.body = "Hello, this message is being sent from my app"
        
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else{
            print("Can't send message")
        }
    }
    
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
             let myURL = URL(string:"https://www.cedarpoint.com/")
             let myRequest = URLRequest(url: myURL!)
        webview.load(myRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

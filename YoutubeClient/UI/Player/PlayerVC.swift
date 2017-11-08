//
//  PlayerVC.swift
//  YoutubeClient
//
//  Created by Tanabe Yuki on 2017/10/06.
//  Copyright © 2017年 Tanabe Yuki. All rights reserved.
//

import UIKit
import WebKit

class PlayerVC: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    public var videoId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        if let url = URL(string: "https://www.youtube.com/embed/\(videoId)") {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("error")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

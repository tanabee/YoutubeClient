//
//  VideoListVC.swift
//  YoutubeClient
//
//  Created by Tanabe Yuki on 2017/10/06.
//  Copyright © 2017年 Tanabe Yuki. All rights reserved.
//

import UIKit

class VideoListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let videoModel = VideoModel()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        videoModel.load(success: {
            print(self.videoModel.list)
            self.tableView.reloadData()
        }) {
            print("error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let snippet = videoModel.list[indexPath.row]["snippet"] as? [String:Any],
            let title = snippet["title"] as? String {
            cell.textLabel?.text = title
        } else {
            cell.textLabel?.text = "No title"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowPlayer", sender: nil)
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

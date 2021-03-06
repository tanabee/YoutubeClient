//
//  VideoListVC.swift
//  YoutubeClient
//
//  Created by Tanabe Yuki on 2017/10/06.
//  Copyright © 2017年 Tanabe Yuki. All rights reserved.
//

import UIKit
import Kingfisher

class VideoListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let videoModel = VideoModel()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoModel.load(success: {
            
            self.tableView.reloadData()
        }) {
            print("error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPlayer" {
            if let vc = segue.destination as? PlayerVC,
            let videoId = sender as? String {
                vc.videoId = videoId
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoModel.list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = UITableViewCell()
        
        if let snippet = videoModel.list[indexPath.row]["snippet"] as? [String:Any] {
            if let title = snippet["title"] as? String {
                cell.textLabel?.text = title
            } else {
                cell.textLabel?.text = "No title"
            }
            
            if let thumbnails = snippet["thumbnails"] as? [String:Any],
                let defaultThumb = thumbnails["default"] as? [String:Any],
                let urlStr = defaultThumb["url"] as? String
            {
                let url = URL(string: urlStr)
                cell.imageView?.kf.setImage(with: url)
            } else {
                cell.imageView?
                    .image = nil
            }
        }
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let id = videoModel.list[indexPath.row]["id"] as? [String:Any],
            let videoId = id["videoId"] as? String {
            self.performSegue(withIdentifier: "ShowPlayer", sender: videoId)
        }
    }
}

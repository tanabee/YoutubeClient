//
//  VideoCell.swift
//  YoutubeClient
//
//  Created by tanabe yuki on 2017/11/08.
//  Copyright © 2017年 Tanabe Yuki. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

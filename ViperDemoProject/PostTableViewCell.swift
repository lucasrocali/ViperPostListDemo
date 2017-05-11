//
//  PostTableViewCell.swift
//  ViperDemoProject
//
//  Created by Lucas Rocali on 5/10/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var commentsStatusLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(post:Post) {
        titleLbl.text = post.title
        bodyLbl.text = post.body
        authorLbl.text = ""
        if let userName = post.getUser()?.username {
            authorLbl.text = "Written by \(userName)"
        }
        commentsStatusLbl.text = "\(post.getComments().count) comments"

    }
    
}

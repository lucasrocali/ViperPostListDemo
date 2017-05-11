//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class PostDetailViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, PostDetailViewProtocol {

    var presenter: PostDetailPresenterProtocol?

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyTxtViw: UITextView!
    @IBOutlet weak var authorBtn: UIButton!
    @IBOutlet weak var authorDetailsLbl: UILabel!
    @IBOutlet weak var commentsTableView: UITableView!

    var comments : [Comment] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getPostInfo()
    }

    func setPostInfo(post:Post) {
        titleLbl.text = post.title
        bodyTxtViw.text = post.body
        if let user = post.getUser() {
            authorBtn.setTitle(user.name, for: .normal)
            authorDetailsLbl.text = "\(user.username) - \(user.website)"
        }
        comments = post.getComments()
        commentsTableView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setNavInfo(title: String?, leftBtnText: String?, rightBtnText: String?) {
        self.title = title

        let leftButton =  UIBarButtonItem(title: leftBtnText, style: .plain, target: self, action: #selector(self.leftBtnClicked(_:)))
        self.navigationItem.leftBarButtonItem = leftButton

        let rightButton =  UIBarButtonItem(title: rightBtnText, style: .plain, target: self, action: #selector(self.rightBtnClicked(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
    }

    func leftBtnClicked(_ sender:UIBarButtonItem) {
        presenter?.leftBtnClicked()

    }
    func rightBtnClicked(_ sender:UIBarButtonItem) {
        presenter?.rightBtnClicked()
    }

    @IBAction func seeUserDetail(_ sender: UIButton) {
        presenter?.showUserInfo()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CommentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell

        cell.setupCell(comment: comments[indexPath.row])
        return cell
    }

}

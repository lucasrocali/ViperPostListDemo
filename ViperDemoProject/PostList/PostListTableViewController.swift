//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class PostListTableViewController: UITableViewController, PostListViewProtocol {

    var presenter: PostListPresenterProtocol?

    var posts : [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getPosts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setNavInfo(title: String?) {
        self.title = title

    }

    func updatePosts(_ posts:[Post]) {
        self.posts = posts
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell

        cell.setupCell(post: posts[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")

        if indexPath.row < posts.count {
            presenter?.selectedPost(posts[indexPath.row])
        }
    }
}

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.posts.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell

        cell.setupCell(post: self.posts[indexPath.row])
        return cell
    }
}

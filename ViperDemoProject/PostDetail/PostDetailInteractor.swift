//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation

class PostDetailInteractor: PostDetailInteractorInputProtocol {

    weak var presenter: PostDetailInteractorOutputProtocol?

    var post : Post
    
    init() {
        post = Post()
    }
}

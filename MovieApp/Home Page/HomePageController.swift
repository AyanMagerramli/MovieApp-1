//
//  HomePageController.swift
//  MovieApp
//
//  Created by Ziyadkhan on 03.12.23.
//

import UIKit

class HomePageController: UIViewController {
    
    let viewModel = HomePageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configureViewModel()
    }
}

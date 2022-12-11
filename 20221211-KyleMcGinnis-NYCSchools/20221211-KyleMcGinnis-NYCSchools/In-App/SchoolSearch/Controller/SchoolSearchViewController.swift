//
//  SchoolSearchViewController.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import SwiftUI

class SchoolSearchViewController: UIViewController {
    
    var viewModel: SchoolSearchViewModel = SchoolSearchViewModel()
    
    var navTitle: String {
        "Schools"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupHostingVC()
        // Do any additional setup after loading the view.
    }
    
    private func setupNavBar(){
        title = navTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHostingVC(){
        let vc = SchoolSearchView(viewModel: viewModel)
        let hostingVC = UIHostingController(rootView: vc)
        add(hostingVC, to: view)
    }

}

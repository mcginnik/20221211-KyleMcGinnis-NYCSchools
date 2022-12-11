//
//  SchoolDetailViewController.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import SwiftUI

class SchoolDetailViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var hasCloseButton: Bool {
        return true
    }

    var closeButton: UIBarButtonItem {
        return UIBarButtonItem(
            image: UIImage(systemName: ImageConstants.xmark),
            style: .plain,
            target: self,
            action: #selector(didTapExit(_:))
        )
    }
    
    var viewModel: SchoolDetailViewModel
    
    var navTitle: String {
        viewModel.name
    }
    
    // MARK: Lifecycle
    
    init(viewModel: SchoolDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupHostingVC()
    }
    
    private func setupNavBar(){
        if hasCloseButton {
            navigationItem.leftBarButtonItem = closeButton
        } else {
            navigationController?.navigationBar.isHidden = true
        }
        title = navTitle
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupHostingVC(){
        let vc = SchoolDetailView(viewModel: viewModel)
        let hostingVC = UIHostingController(rootView: vc)
        add(hostingVC, to: view)
    }
    
    // MARK: Actions
    
    @objc func didTapExit(_ sender: Any) {
        navigationController?.dismiss(animated: true) { }
    }

}

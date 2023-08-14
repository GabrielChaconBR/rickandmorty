
//
//  HomeViewController.swift
//  RickAndMorty
//
//  Created Gabriel Chacon on 13/08/23.
//

import UIKit

public class HomeViewController: UIViewController {

    private enum Constants {
        static let title = "Rick And Morty"
    }
    // MARK: - PROPERTIES

    public let contentView: HomeViewProtocol?
    public var listRickAndMorty: (() -> Void)?

    // MARK: - INITIALIZERS

    public init(contentView: HomeViewProtocol = HomeView()) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    @available (*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LIFE CYCLE
    public override func loadView() {
        contentSetup()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        listRickAndMorty?()
    }
    
    // MARK: - PRIVATE
    private func setup() {
        title = Constants.title
        self.navigationItem.hidesBackButton = true
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func contentSetup() {
        if let contentView = contentView {
            self.view = contentView.content
        }
    }
}

extension HomeViewController: HomeViewControllerProtocol {
    public func updateView(with viewState: HomeViewState) {
        contentView?.updateView(with: viewState)
    }
}

extension HomeViewController: HomeViewModelProtocol {
    public func viewState(state: HomeViewState) {
        self.updateView(with: state)
    }
}

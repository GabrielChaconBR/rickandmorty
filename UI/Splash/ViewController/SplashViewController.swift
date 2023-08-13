
//
//  SplashViewController.swift
//  RickAndMorty
//
//  Created Gabriel Chacon on 12/08/23
//

import UIKit
import ViewModel

public class SplashViewController: UIViewController {

    public let contentView: SplashViewProtocol?
    public var rickAndMorty: (() -> Void)?

    public init(contentView: SplashViewProtocol = SplashView()) {
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
        rickAndMorty?()
    }
    
    // MARK: - PRIVATE
    private func setup() {
    }

    private func contentSetup() {
        if let contentView = contentView {
            self.view = contentView.content
        }
    }
}

extension SplashViewController: SplashViewDelegate {

}

extension SplashViewController: AlertView {
    public func showMessage(alertViewModel: ViewModel.AlertViewModel) {
        
    }
}

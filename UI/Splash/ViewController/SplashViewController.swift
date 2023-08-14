
//
//  SplashViewController.swift
//  RickAndMorty
//
//  Created Gabriel Chacon on 12/08/23
//

import UIKit

public class SplashViewController: UIViewController {

    public let contentView: SplashViewProtocol?
    public var rickAndMorty: (() -> Void)?
    public var splashRouter: ((String) -> Void)?

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
        rickAndMorty?()
    }

    private func contentSetup() {
        if let contentView = contentView {
            self.view = contentView.content
        }
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension SplashViewController: SplashViewModelProtocol {
    public func viewState(state: SplashViewState) {
        switch state {
        case .hasData(let data):
            splashRouter?(data)
        default:
            break
        }
    }
}

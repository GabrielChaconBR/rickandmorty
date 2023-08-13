//
//  SplashView.swift
//  RickAndMorty
//
//  Created Gabriel Chacon on 12/08/23.

import UIKit

final public class SplashView: UIView, SplashViewProtocol {
    
    private enum Value {
        static let four: CGFloat = 4
    }
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "rm")
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    @available (*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(view)
        view.addSubview(imageView)
    }
    
    private func addConstraints() {
        view.pinToSuperview()
        imageView.centerToSuperview()
        imageView.pinToSuperview(sides: [.left, .right], constant: Value.four)
    }
}

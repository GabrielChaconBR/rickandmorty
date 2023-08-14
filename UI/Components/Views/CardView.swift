//
//  CardView.swift
//  UI
//
//  Created by Gabriel Chacon on 13/08/23.
//

import UIKit

final public class CardView: UIView {
    
    // MARK: - UI
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var photoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
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
    }
    
    private func addConstraints() {
        view.pinToSuperview()
        
        photoImageView.pinToSuperview(sides: [.top, .left, .bottom])
        photoImageView.centerVerticalToSuperview()
        photoImageView.width(equalToConstant: 24)
        photoImageView.height(equalToConstant: 24)
        
        nameLabel.right(to: photoImageView, constant: 8)
        nameLabel.centerVertical(to: photoImageView)
    }
    
    public func updateView(with entity: ItemViewEntity) {
        photoImageView.image = entity.image
        nameLabel.text = entity.name
    }
}

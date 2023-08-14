//
//  CardView.swift
//  UI
//
//  Created by Gabriel Chacon on 13/08/23.
//

import UIKit
import Kingfisher

final public class CardView: UIView {
    
    private enum Values {
        static let borderWidth: CGFloat = 2
        static let viewMargin: CGFloat = 8
        static let photoImageViewHeight: CGFloat = 80
        static let photoImageViewWidth: CGFloat = 80
    }
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var photoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = Values.borderWidth
        view.contentMode = .scaleAspectFit
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
        
        view.addSubview(photoImageView)
        view.addSubview(nameLabel)
    }
    
    private func addConstraints() {
        view.pinToSuperview()
        
        photoImageView.pinToSuperview(sides: [.top, .left, .bottom], constant: Values.viewMargin)
        photoImageView.centerVerticalToSuperview()
        photoImageView.width(equalToConstant: Values.photoImageViewWidth)
        photoImageView.height(equalToConstant: Values.photoImageViewHeight)
        
        nameLabel.right(to: photoImageView, constant: Values.viewMargin)
        nameLabel.centerVertical(to: photoImageView)
    }
    
    public func updateView(with entity: ItemViewEntity) {
        photoImageView.kf.setImage(with: entity.image)
        nameLabel.text = entity.name
    }
}

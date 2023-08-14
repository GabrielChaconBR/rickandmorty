//
//  HomeViewCell.swift
//  UI
//
//  Created by Gabriel Chacon on 13/08/23.
//

import UIKit

final public class HomeViewCell: UITableViewCell, ReusableCell {
    
    // MARK: - UI
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var cardView: CardView = {
        let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available (*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE
    
    func setup() {
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(view)
        
        addSubview(cardView)
    }
    
    private func addConstraints() {
        view.pinToSuperview()
        
        cardView.pinToSuperview()
    }
    
    public func updateView(with entity: ItemViewEntity) {
        cardView.updateView(with: entity)
    }
}

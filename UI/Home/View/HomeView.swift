//
//  HomeView.swift
//  RickAndMorty
//
//  Created Gabriel Chacon on 13/08/23.
//

import UIKit

final public class HomeView: UIView {
    
    // MARK: - UI
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell.reuseIdentifier)
        tableView.dataSource = dataSource
        return tableView
    }()
    
    var dataSource = HomeTableViewDataSource(items: [])
    
    // MARK: - INITIALIZERS
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
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
        
        view.addSubview(tableView)
    }
    
    private func addConstraints() {
        view.pinToSuperview()
        
        tableView.pinToSuperview()
    }
    
    private func updateView(with entity: HomeViewEntity) {
        dataSource.items = entity.items
        tableView.reloadData()
    }
}

extension HomeView: HomeViewProtocol {
    public func updateView(with viewState: HomeViewState) {
        switch viewState {
        case .hasData(let data):
            updateView(with: data)
        case .isEmpty:
            break
        case .hasError(_):
            // TODO: Aplicar View de Erro
            break
        case .hasLoading(_):
            // TODO: Aplicar View de Loading
            break
        }
    }
}

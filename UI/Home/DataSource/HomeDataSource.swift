//
//  HomeDataSource.swift
//  UI
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation
import UIKit

class HomeDataSource: UIDataSource<ItemViewEntity> {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.reuseIdentifier,
                                                       for: indexPath) as? HomeViewCell else { return UITableViewCell() }
        
        if let entity = item(at: indexPath.row) {
            cell.updateView(with: entity)
        }
        
        return cell
    }
}

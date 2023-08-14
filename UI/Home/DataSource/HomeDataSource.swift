//
//  HomeDataSource.swift
//  UI
//
//  Created by Gabriel Chacon on 13/08/23.
//

import Foundation
import UIKit

class HomeTableViewDataSource: NSObject, UITableViewDataSource {
    var items: [ItemViewEntity]
    
    init(items: [ItemViewEntity]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.reuseIdentifier,
                                                       for: indexPath) as? HomeViewCell else { return UITableViewCell() }
        
        let entity = self.items[indexPath.row]
            cell.updateView(with: entity)
        
        return cell
    }
}

//
//  ViewController.swift
//  HansGoodsApp
//
//  Created by Farhan on 24/03/23.
//

import UIKit

class ListItemsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listItemViewModel: ListItemsViewModel?
    
    private var listDatas: [ListItemsModel]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    func registerCell() {
        tableView.register(ItemsTableCell.self, forCellReuseIdentifier: ItemsTableCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension ListItemsController: UITableViewDelegate, UITableViewDataSource {
    
    func setupItemsApi() {
        let url = "https://fakestoreapi.com/products"
        
        self.listItemViewModel = ListItemsViewModel(urlString: url, apiService: ApiService())
        self.listItemViewModel?.bindListData = {
            listModel in
            if let listData = listModel {
                self.listDatas = listData
                
                self.tableView.backgroundColor = .white
            } else {
                self.tableView.backgroundColor = .blue
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemsTableCell.identifier, for: indexPath) as? ItemsTableCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
}



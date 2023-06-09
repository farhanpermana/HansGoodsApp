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
        setupItemsApi()
        
    }
    
    func registerCell() {
        tableView.register(ItemsTableCell.self, forCellReuseIdentifier: ItemsTableCell.identifier)
        
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

extension ListItemsController: UITableViewDelegate, UITableViewDataSource {
    
    func setupItemsApi(apiUrl: String = "https://fakestoreapi.com/products/") {
        
        self.listItemViewModel = ListItemsViewModel(urlString: apiUrl, apiService: ApiService())
        self.listItemViewModel?.bindListData = {
            listModel in
            if let listData = listModel {
                self.listDatas = listData
                print("bind", self.listDatas?.first?.title ?? "null")
                self.tableView.backgroundColor = .white
            } else {
                print("gagallll")
                
                self.tableView.backgroundColor = .blue
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDatas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let items = listDatas?[indexPath.row],
              let cell = tableView.dequeueReusableCell(withIdentifier: ItemsTableCell.identifier, for: indexPath) as? ItemsTableCell else {
            return UITableViewCell()
        }
        
        cell.setupConstraint()
        cell.config(model: items )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let items = listDatas?[indexPath.row],
           let vc = storyboard.instantiateViewController(identifier: DetailItemsController.identifier) as? DetailItemsController
        {
            // move to detail page with id
            
            vc.listItems = [items]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}



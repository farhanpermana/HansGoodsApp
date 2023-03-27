//
//  DetailItemsController.swift
//  HansGoodsApp
//
//  Created by Farhan Permana on 26/03/23.
//

import UIKit
// import SDWebImage


enum sectionsDetail: Int {
    case image = 0
    case header = 1
    case desc = 2
}

class DetailItemsController: UIViewController {
    
    static let identifier = "DetailItemsController"
    
    @IBOutlet weak var tableView: UITableView!
    
    var listItems: [ListItemsModel]?
    var itemDetail: DetailItemsModel?
    
    var detailViewModel: DetailItemsViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupApi()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: ImageTableCell.identifier, bundle: nil), forCellReuseIdentifier: ImageTableCell.identifier)
        tableView.register(UINib(nibName: HeaderTableCell.identifier, bundle: nil), forCellReuseIdentifier: HeaderTableCell.identifier)
        tableView.register(UINib(nibName: DescItemTableCell.identifier, bundle: nil), forCellReuseIdentifier: DescItemTableCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupApi(apiUrl: String = "https://fakestoreapi.com/products/") {
        
        self.detailViewModel = DetailItemsViewModel(apiService: ApiService(), urlString: apiUrl + "\(listItems?.first?.id ?? 0)")
        
        self.detailViewModel?.bindItemData = {
            detailItem in
            if let detailItem = detailItem {
                self.itemDetail = detailItem
                print("sukses setup api")
            }
            else {
                print("gagal setup api")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
}

extension DetailItemsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return listItems?.count ?? 0
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = sectionsDetail(rawValue: indexPath.section)
        switch sections {
        case .image:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableCell.identifier, for: indexPath) as? ImageTableCell else { return UITableViewCell() }
            cell.imgLabel.sd_setImage(with: URL(string: itemDetail?.image ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            return cell
        case .header:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableCell.identifier, for: indexPath) as? HeaderTableCell else { return UITableViewCell() }
            cell.titleLabel.text = itemDetail?.title
            cell.priceLabel.text = "$\(itemDetail?.price ?? 0)"
            return cell
        case .desc:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescItemTableCell.identifier, for: indexPath) as? DescItemTableCell else { return UITableViewCell() }
            cell.ratingsValue.text = "\(itemDetail?.rating.rate ?? 0)"
            cell.catValue.text = itemDetail?.category
            cell.descValue.text = itemDetail?.description
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sections = sectionsDetail(rawValue: indexPath.section)
        switch sections {
        case .image:
            return 200
        case .header:
            return 100
        case .desc:
            return 200
        default:
            return 0
        }
    
    }
    
}



//
//  PhotoListView.swift
//  PixelsPhotosApp
//
//  Created by ramil on 11.03.2021.
//

import UIKit

protocol PhotoListItemDelegate: class {
    func selectedPhoto(photo: Photo)
}

class PhotoListView: UIView {
    weak var delegate: PhotoListItemDelegate?
    
    lazy var vm: PhotoListViewModel = {
       let vm = PhotoListViewModel()
        vm.delegate = self
        return vm
    }()
    
    lazy var tableView: UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.delegate = self
        v.dataSource = self
        v.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        return v
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        addSubview(tableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension PhotoListView: PhotoListViewModelDelegate {
    func photoLoaded() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

extension PhotoListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension PhotoListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
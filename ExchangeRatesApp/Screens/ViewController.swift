//
//  ViewController.swift
//  ExchangeRatesApp
//
//  Created by Дмитрий Лещёв on 05/07/2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let headerTitle = UILabel()
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 260, height: 100)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.showsVerticalScrollIndicator = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "customCell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 9 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
}

extension ViewController {
    private func setupSubviews() {
        view.addSubview(headerTitle)
        view.addSubview(collectionView)
        
        headerTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.leading.equalToSuperview().offset(30)
        }
        
        headerTitle.text = "Exchange rates"
        headerTitle.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        headerTitle.textAlignment = .left
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerTitle.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(20)
        }
        
        collectionView.backgroundColor = .none
    }
}


//UITabBarDelegate, UITableViewDataSource


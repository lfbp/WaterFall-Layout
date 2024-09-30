//
//  ViewController.swift
//  collection
//
//  Created by LUIS FELIPE B PEREIRA on 30/09/24.
//

import UIKit

class ViewController: UIViewController  {
    
    let horizontalSpacing: CGFloat = 8.0
    var collection: UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.minimumInteritemSpacing = 4.0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    let numberOfViews = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(collection)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        setConstraints()
    
    }
    
    func setConstraints() {
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func sizeForItem(_ item: Int) -> CGSize {
        let width = view.frame.width
        let unit = (width-horizontalSpacing)/2
        var size = CGSize()
        switch item {
            
        case 0,2,4,6:
            size =  CGSize(width: unit, height: unit)
        case 1,3,5,7:
            size =  CGSize(width: unit, height: unit/2)
        
        default:
            size = CGSize(width: 0, height: 0)
            
        }
        return size
    }
}


extension ViewController:  CHTCollectionViewDelegateWaterfallLayout ,UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfViews
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let id = indexPath.item
        let cgSize = sizeForItem(id)
        return cgSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnCountFor section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingFor section: Int) -> CGFloat {
        return horizontalSpacing
    }
}

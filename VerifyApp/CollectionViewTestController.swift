//
//  CollectionViewTestController.swift
//  VerifyApp
//
//  Created by yuwa on 2019/04/01.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import UIKit

class CollectionViewTestController: ViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // カスタムセルをコレクションビューに登録
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
    }
    
    // UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // セルがタップされた時の処理
        print(String(indexPath.row) + "番目のセルがタップされた")
    }
    
    // UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // セルの数を返す
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 表示するセルの内容を返す
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // CustomCollectionViewCellにダウンキャスト
        if let cell = cell as? CustomCollectionViewCell {
            cell.title.text = "タイトル" + String(indexPath.row)
        }
        
        return cell
    }
    
}

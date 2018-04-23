//
//  CategoryViewController.swift
//  satoshi
//
//  Created by xy on 13/04/2018.
//  Copyright © 2018 xy. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    
    var tabItems = ["WiFi", "美妝", "箱包", "流量", "日租"]
    var selectedCategoryId = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = MyApp.shared.languageStringByKey("categoryTitle")
        self.navigationController?.tabBarItem.title = MyApp.shared.languageStringByKey("categoryBarTitle")
        
        let attr = [NSAttributedStringKey.foregroundColor: UIColor.orange]
        tabBarItem.setTitleTextAttributes(attr, for: UIControlState.selected)
        
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        let indexPath = IndexPath(row: 0, section: 0)
        let firstCell = tableView.cellForRow(at: indexPath)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
        firstCell?.setSelected(true, animated: true)
        didSelectCategory(categoryId: 0, categoryCell: firstCell!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/2.0
        let height = width * 150/135
        return CGSize(width: width, height: height)
    }
    */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "ReusedCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        /*if let viewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = collectionView.frame.width/2.0
            let height = width * 130/135
            viewLayout.itemSize = CGSize(width: width, height: height)
        }*/
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ReusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(nil == cell) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        cell?.backgroundColor = UIColor.lightGray
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        cell?.textLabel?.text = tabItems[indexPath.row]
        cell?.textLabel?.textAlignment = NSTextAlignment.center
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        selectCategory(categoryId: indexPath.row, categoryCell: cell)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray
    }
    
    private func selectCategory(categoryId: Int, categoryCell: UITableViewCell?) {
        print("--- categoryDidSelect = \(categoryId)")
        if selectedCategoryId == categoryId && nil != categoryCell {
            return
        }
        
        var cell = categoryCell
        if nil == cell {
            cell = tableView.cellForRow(at: IndexPath(row: categoryId, section: 0))
        }
        
        didSelectCategory(categoryId: categoryId, categoryCell: cell!)
    }
    
    private func didSelectCategory(categoryId: Int, categoryCell: UITableViewCell) {
        selectedCategoryId = categoryId
        categoryCell.backgroundColor = UIColor.white
        //collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

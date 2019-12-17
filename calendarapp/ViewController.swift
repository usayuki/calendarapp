//
//  ViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2019/10/13.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
      
        
        
        struct MoveMonthRequest {
                
                var year: Int
                var month: Int
                
                init(_ monthCounter: Int) {
                        let calendar = Calendar(identifier: .gregorian)
                        let date = calendar.date(byAdding: .month, value: monthCounter, to: Date())
                        let newDate = calendar.dateComponents([.year, .month], from: date!)
                        year = newDate.year!
                        month = newDate.month!
                }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        @IBOutlet var headTitle: UILabel!
        
        let datemanager = DateManager()
        
        @IBOutlet var collectionView: UICollectionView!
     
        let daysPerWeek = 7
        let weekArray = ["日","月","火","水","木","金","土",]
        let numOfDays = 7
        var monthCounter = 0
        
        
        override func viewDidLoad() {
                super.viewDidLoad()
                
               datemanager.dateManager(datemanager.year,datemanager.month)
            
                headTitle.text = "\(String(datemanager.year))年\(String(datemanager.month))月\(String(datemanager.day))日"
                
                // レイアウトを調整
                let layout = UICollectionViewFlowLayout() //UICollectionVIewLayoutの調整。Cellの大きさを動的な変更ができない
                collectionView.collectionViewLayout = layout
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {  //セルの数
             //   return section == 0 ? 7 :datemanager.numberOfDays(datemanager.year,datemanager.month)
                return section == 0 ? 7 : (datemanager.numberOfWeeks(datemanager.year, datemanager.month)*7)
                }
        //データを返すメソッド
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                //コレクションビューから識別子「CalendarCell」のセルを取得する/
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CalendarCell
                if(indexPath.section == 0){             //曜日表示
                        cell.backgroundColor = UIColor.green
                                   cell.textLabel.text = weekArray[indexPath.row]
                }else{                                  //日付表示
                        cell.backgroundColor = UIColor.red
                   cell.textLabel.text = datemanager.daysArray[indexPath.row]  //Index番号から表示する日を求める
                }
                return cell
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                //横方向のスペース調整
                let horizontalSpace : CGFloat = 2
                let _ : CGFloat = 1
                //セルの大きさ（viewの横幅/5-2)
                let cellSize : CGFloat = self.view.bounds.width / 8  - horizontalSpace //画面の横幅/5-2することで5等分より少し小さいcellの大きさに設定しようとすることであっていますか？
                return CGSize(width: cellSize, height: cellSize)
        }
        // アイテム表示領域全体の上下左右の余白を設定（UICollectionViewDelegateFlowLayout が必要）
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
                let a : CGFloat = 1
                let inset = a  //(self.view.frame.width / 8) / 8
                
                return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        }
   
        func numberOfSections(in collectionView: UICollectionView) -> Int {  //セクションの数
                return 2
        }
        
        @IBAction func nextButton(_ sender: Any) {
                monthCounter = monthCounter + 1
                 commonSettingMoveMonth()
                
        }
        
        
        @IBAction func backButton(_ sender: Any) {
     monthCounter = monthCounter - 1
        }
        
        
        func commonSettingMoveMonth(){
                datemanager.daysArray = nil
                let moveDate = MoveMonthRequest(monthCounter)
                datemanager.numberOfWeeks(moveDate.year, moveDate.month)
                collectionView.reloadData()
        
        
        
        
        
        
        }
        
}










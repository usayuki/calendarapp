//
//  SetupViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2020/02/20.
//  Copyright © 2020 Masato.achiwa. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController,UITextFieldDelegate {//ViewControllerクラスがUITextFieldDelegateプロトコルに準拠することを宣言する
        
        @IBOutlet var nameText: UITextField!
        
        @IBOutlet var effortText: UITextField!
        
        @IBOutlet var periodText: UITextField!
        
        @IBOutlet var unitText: UITextField!
      
        let setup = SetupManager.shared
        
        
    override func viewDidLoad() {
        nameText.delegate = self //UITextFieldクラスのインスタンスであるnametTextのdelegateプロパティにViewControllerのインスタンスを渡している

        effortText.delegate = self
        periodText.delegate = self
        unitText.delegate = self
        
        super.viewDidLoad()
        let zzz = UserDefaults.standard.string(forKey: {"name"}())
        
        nameText.text = zzz
        
        let bbb = UserDefaults.standard.string(forKey: {"effort"}())
        effortText.text = bbb
        
        let ccc = UserDefaults.standard.string(forKey: {"period"}())
        periodText.text = ccc
        
        let uuu = UserDefaults.standard.string(forKey: {"unit"}())
        unitText.text = uuu
        
        
        
        
        
    }
    
        @IBAction func register(_ sender: Any) {
      
                guard let nametext = nameText.text,
                        let effortext = effortText.text,
                        let periodtext = periodText.text,
                        let unittext = unitText.text else{
                                
                                let alert = UIAlertController(title: "エラー", message: "入力されていない項目があります。", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                present(alert,animated: true, completion: nil)
                                
                                return
                                
                }
                
                
        setup.register(name: nametext)
        setup.register2(effort: effortext)
       setup.register3(period: periodtext)
        setup.register4(unit: unittext )
                
                print(nametext)
                print(effortext)
                print(periodtext)
                print (unittext)
                
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                // キーボードを閉じる
                textField.resignFirstResponder()

                return true
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                
                self.view.endEditing(true)
      }
        
        
    
}

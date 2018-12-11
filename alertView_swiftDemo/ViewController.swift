//
//  ViewController.swift
//  alertView_swiftDemo
//
//  Created by sxf_pro on 2018/12/11.
//  Copyright © 2018年 sxf_pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var contentLb : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let btn = UIButton(type: .custom)
        
        btn.setTitle("showAlertView", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.9821541905, green: 0.2787161171, blue: 0.2328091562, alpha: 1), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        btn.addTarget(self, action: #selector(clickBtn(sender:)), for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        btn.center = CGPoint(x: view.center.x, y: view.center.y + 200)
        view.addSubview(btn)
        
        
        
        contentLb = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        
        contentLb.center = CGPoint(x: view.center.x, y: 150)
        contentLb.textAlignment = .center
        contentLb.font = UIFont.systemFont(ofSize: 15)
        contentLb.textColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        contentLb.numberOfLines = 0
        view.addSubview(contentLb)
    }

    
    @objc func clickBtn(sender:UIButton){
        
        lotteryAlertView.showAlert(sure: { (name : String, phone : String) -> (Void) in
            print("确认-----\(name)----\(phone)")
            self.contentLb.text = String(format: "name : \(name)\n\n phone :\(phone)")
            
        }) {
            print("取消")
        }
        
    }
    
    
    

}


//
//  lotteryAlertView.swift
//  testSnapkit
//
//  Created by sxf_pro on 2018/12/7.
//  Copyright © 2018年 sxf_pro. All rights reserved.
//

/**
 使用：
 
 
    lotteryAlertView.showAlert(sure: { (name : String, phone : String) -> (Void) in
    print("确认-----\(name)----\(phone)")

    }) {
    print("取消")
    }
 
 
 */


import UIKit
import SnapKit
enum btn_type {
    case btn_typeCancle
    case btn_typeSure
}
class lotteryAlertView: UIView {
    fileprivate var bgView = UIView()
    fileprivate var alertTitleLb = UILabel()
    fileprivate let nameTF = UITextField()
    fileprivate let phoneNumTF = UITextField()
    fileprivate let cancleBtn = UIButton()
    fileprivate let beSureBtn = UIButton()
    var colorBgView:UIView!
    var gradientLayer = CAGradientLayer()
    var btnCallBack : ((_ type : btn_type)->Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addChidrenViews()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addChidrenViews(){
        
        self.layer.cornerRadius = 8
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.colorBgView = UIView.init()
        self.gradientLayer = CAGradientLayer()
        self.addSubview(colorBgView!)
        self.layer.addSublayer(gradientLayer)
        
        addSubview(colorBgView)
        colorBgView.layer.addSublayer(gradientLayer)
        addSubview(alertTitleLb)
        addSubview(nameTF)
        addSubview(phoneNumTF)
        addSubview(cancleBtn)
        addSubview(beSureBtn)
        
        
        alertTitleLb.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        alertTitleLb.text = "填写参与信息，方便我们尽快联系到您"
        alertTitleLb.numberOfLines = 2
        alertTitleLb.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 1.5))
        nameTF.layer.cornerRadius = 2
        phoneNumTF.layer.cornerRadius = 2
        cancleBtn.layer.cornerRadius = 2
        beSureBtn.layer.cornerRadius = 2
        colorBgView.layer.cornerRadius = 2;
        colorBgView.layer.masksToBounds = true
        nameTF.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        phoneNumTF.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        nameTF.placeholder = "昵称"
        phoneNumTF.placeholder = "手机号"
        
        cancleBtn.setTitle("取消", for: .normal)
        cancleBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        cancleBtn.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        cancleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 1.5))
        beSureBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 1.5))
        beSureBtn.setTitle("提交", for: .normal)
        beSureBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)

        
        cancleBtn.addTarget(self, action: #selector(clickBtn(sender:)), for: .touchUpInside)
        beSureBtn.addTarget(self, action: #selector(clickBtn(sender:)), for: .touchUpInside)

        
        
        
        
        
        //修改placeHolder
        //字体大小
        let color = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        nameTF.attributedPlaceholder = NSAttributedString.init(string:"   昵   称", attributes: [kCTFontAttributeName as NSAttributedStringKey:UIFont.systemFont(ofSize:12)])
        //字体颜色
        nameTF.attributedPlaceholder = NSAttributedString.init(string:"   昵   称", attributes: [
            kCTForegroundColorAttributeName as NSAttributedStringKey:color])
        
        phoneNumTF.attributedPlaceholder = NSAttributedString.init(string:"   手机号", attributes: [kCTFontAttributeName as NSAttributedStringKey:UIFont.systemFont(ofSize:12)])
        //字体颜色
        phoneNumTF.attributedPlaceholder = NSAttributedString.init(string:"   手机号", attributes: [
            kCTForegroundColorAttributeName as NSAttributedStringKey:color])
        
        phoneNumTF.delegate = self
        nameTF.delegate = self
        
    }
    
    @objc func clickBtn(sender : UIButton){
        
        if sender == cancleBtn{
            //删除
            if btnCallBack != nil{
                btnCallBack!(btn_type.btn_typeCancle)
            }
        }else{
            //确认
            if btnCallBack != nil{
                btnCallBack!(btn_type.btn_typeSure)
            }
        }
    }
    
    func setTitle(title : String) -> Void {
        alertTitleLb.text = title
    }
    
    
    
    private func confirgerColorView(colors:Array<Any>) {
        gradientLayer.colors = colors;
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0)
    }
    
    
    override func layoutSubviews() {
        super .layoutSubviews()
        alertTitleLb.snp.makeConstraints { (title) in
            title.centerX.equalTo(self.snp.centerX)
            title.top.equalTo(self.snp.top).offset(17)
        }
        
        nameTF.snp.makeConstraints { (name) in
            name.left.equalTo(self.snp.left).offset(42)
            name.right.equalTo(self.snp.right).offset(-42)
            name.top.equalTo(alertTitleLb.snp.bottom).offset(22)
            name.height.equalTo(30)
        }
        phoneNumTF.snp.makeConstraints { (phone) in
            phone.left.equalTo(self.snp.left).offset(42)
            phone.right.equalTo(self.snp.right).offset(-42)
            phone.top.equalTo(nameTF.snp.bottom).offset(10)
            phone.height.equalTo(30)
        }
        
        
        cancleBtn.snp.makeConstraints { (cancle) in
            cancle.left.equalTo(nameTF.snp.left)
            cancle.height.equalTo(28)
            cancle.bottom.equalTo(self.snp.bottom).offset(-25)
            cancle.width.equalTo(92)
        }
        
        colorBgView.snp.makeConstraints { (color) in
            color.right.equalTo(nameTF.snp.right)
            color.height.equalTo(28)
            color.bottom.equalTo(cancleBtn.snp.bottom)
            color.width.equalTo(92)
        }
        
        beSureBtn.snp.makeConstraints { (beSure) in
            beSure.right.equalTo(nameTF.snp.right)
            beSure.height.equalTo(28)
            beSure.bottom.equalTo(cancleBtn.snp.bottom)
            beSure.width.equalTo(92)
        }
        
        
        layoutIfNeeded()
        gradientLayer.frame = colorBgView.bounds
        
        //设置渐变色
        confirgerColorView(colors: [UIColor(red: 0/255.0, green: 196/255.0, blue: 172/255.0, alpha: 1.0).cgColor, UIColor(red: 30/255.0, green: 220/255.0, blue: 149/255.0, alpha: 1.0).cgColor])
        
       
    }
    
    
    class func showAlert(sure :@escaping ((_ name : String, _ phone : String)->(Void)) , cancle : @escaping (()->Void)){
        let kw = UIApplication.shared.keyWindow
        
        
        let alert = lotteryAlertView(frame: CGRect(x: 0, y: 0, width: 280, height: 214))
        alert.bgView = UIView()
        alert.bgView.frame = (kw?.bounds)!
        alert.bgView.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        kw?.addSubview(alert.bgView)
        kw?.addSubview(alert)
        alert.center = (kw?.center)!
        alert.backgroundColor = UIColor.white
        alert.alpha = 0.0
        UIView.animate(withDuration: 0.3, animations: {
            alert.bgView.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
            alert.alpha = 1.0
        })
        alert.btnCallBack = {(type : btn_type)->Void in
            
            UIView.animate(withDuration: 0.3, animations: {
                alert.bgView.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
                alert.alpha = 0.0
            }, completion: { (complete) in
                alert.bgView .removeFromSuperview()
                alert.removeFromSuperview()
            })
            
            if type == btn_type.btn_typeCancle {
                //取消
                cancle()
                
            }else{
                //确认
                sure(alert.nameTF.text!, alert.phoneNumTF.text!)
            }
            
        }
        
    }
    

}




extension lotteryAlertView : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        
        return true
    }
    
    
    
    
}

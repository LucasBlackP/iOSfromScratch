//
//  VerifyLoginInfo.swift
//  CustomCell
//
//  Created by PhatDT on 6/26/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol CustomTextFieldDelegate: UITextFieldDelegate{
    func onTextFieldEmpty(_ textField: CustomTextField)
    func onTextFieldDidChangedText(_ textField: CustomTextField)
}

protocol CustomTextFieldProtocol: class{
    var customDelegate: CustomTextFieldDelegate?{get set}
    var verifyState: CustomTextField.VerifyState{get set}
    func setFormatPattern(pattern: String)
}

class CustomTextField: UITextField, CustomTextFieldProtocol{
    
    public enum VerifyState{
        case idle
        case empty
        case hasText
    }
    
    var verifyState: VerifyState = .idle{
        didSet{
            onStateChange()
        }
    }
    
    var leftIcon: UIImage?{
        didSet{
            updateView()
        }
    }
    
    var rightIcon: UIImage?{
        didSet{
            updateView()
        }
    }
    
    var lineBorder: UIView?
    
    var lineBorderHeight:Double = 1.0
    
    internal var leftIconHeight:CGFloat = 1.0
    
    internal var rightIconHeight:CGFloat = 0.0
    
    internal var isInitial = false
    
    let iconShowPassword = UIImage(named: "see")
    
    let iconHidePassword = UIImage(named: "unsee")
    
    var isShowPassword = false{
        didSet{
            
        }
    }
    
    var customDelegate: CustomTextFieldDelegate?{
        didSet{
            self.delegate = customDelegate
            self.verifyState = .empty
            self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }

    var formatPattern: String = ""
    
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if(!isInitial){
            lineBorder = UIView()
            updateView()
            lineBorder?.backgroundColor = RadiusButton.defaultColor
            addSubview(lineBorder!)
            isInitial = true
            self.borderStyle = .none
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 1.5*leftIconHeight, dy: 0.0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds: bounds)
    }
    
    internal func updateView(){
        if leftIcon != nil{
            leftIconHeight = (2/3)*frame.height
            let leftView = UIImageView(frame: CGRect(x: 0, y: 0, width: leftIconHeight, height: leftIconHeight))
            leftView.center = center
            leftView.image = leftIcon!
            self.leftViewMode = .always
            self.leftView = leftView
        }
        else{
            leftIconHeight = 0.0
            self.leftViewMode = .never
        }
        if rightIcon != nil{
            rightIconHeight = (2/3)*frame.height
            let rightView = UIImageView(frame: CGRect(x: 0, y: 0, width: rightIconHeight, height: rightIconHeight))
            rightView.center = center
            rightView.image = rightIcon!
            self.rightViewMode = .always
            self.rightView = rightView
        }
        else{
            rightIconHeight = 0.0
            self.rightViewMode = .never
        }
        lineBorder?.frame = CGRect(x: 0, y: frame.height - CGFloat(lineBorderHeight), width: frame.width, height: CGFloat(lineBorderHeight))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal func onStateChange() {
        switch self.verifyState{
        case .idle:
            break
        case .empty:
            customDelegate?.onTextFieldEmpty(self)
        case .hasText:
            checkLength(text: self.text ?? "")
        }
    }
    
    internal func checkLength(text: String){
        if (text.count == 0){
            self.verifyState = .empty
        }
        else{
            checkFormat(text: text)
        }
    }
    
    internal func switchPasswordIcon(){
        if (isShowPassword){
            self.rightIcon = iconShowPassword
        }
        else{
            self.rightIcon = iconHidePassword
        }
    }
    
    internal func checkFormat(text: String){
        let regularExpression = try! NSRegularExpression(pattern: formatPattern, options: .caseInsensitive)
        if regularExpression.firstMatch(in: text, options: [], range: NSRange(location: 0, length: text.count)) == nil {
            lineBorder?.backgroundColor = .red
        }
        else{
            lineBorder?.backgroundColor = RadiusButton.defaultColor
        }
    }
    
    func setFormatPattern(pattern: String) {
        self.formatPattern = pattern
    }
    
    @objc func textFieldDidChange(_ textField: CustomTextField) {
        textField.verifyState = .hasText
        self.customDelegate?.onTextFieldDidChangedText(self)
    }
}

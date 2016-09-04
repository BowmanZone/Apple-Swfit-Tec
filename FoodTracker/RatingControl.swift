//
//  RatingControl.swift
//  FoodTracker
//
//  Created by 钟 on 16/9/4.
//  Copyright © 2016年 Sean. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: Properties
    let spacing = 5
    let starCount = 5
    
    //TODO:闭包？观察者？ 这里写一个闭包？来实时更新UI，只要rating的值改变就会调用里面的方法。
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    
    //MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage.init(named: "filledStar")
        let emptyStarImage = UIImage.init(named: "emptyStar")//emptyStar
        
        for _ in 0..<starCount {
            let button = UIButton()

            //绑定事件
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            //设置不同状态下的button背景图片
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            //This is to make sure that the image doesn’t show an additional highlight during the state change. 原话，不会显示额外的强调
            button.adjustsImageWhenHighlighted = false
            addSubview(button)
            ratingButtons += [button]
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        //这里的size貌似是从sb中设置intrinsicContentSize后传过来的size，layoutSubviews中的frame则是从这里传过去的。
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        return CGSizeMake(CGFloat(width), CGFloat(buttonSize))
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
//        print("Button pressed 👌")
        rating = ratingButtons.indexOf(button)! + 1
        
        //更新button
        updateButtonSelectionState()
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRectMake(0, 0, CGFloat(buttonSize), CGFloat(buttonSize))
        
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        //更新button 原话：It’s important to update the button selection states when the view loads, not just when the rating changes.
        updateButtonSelectionState()
    }
    
    func updateButtonSelectionState() {
        //设置
        for (index, button) in ratingButtons.enumerate() {
            //如果button的index小于rating，那么button不会被选中
            button.selected = index < rating
        }
    }
}

//在init中创建button并添加事件
//在intrinsicContentSize中设置本类RatingControl的frame
//在layoutSubviews中设置subviews的frame

//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Sakura on 2017/10/11.
//  Copyright © 2017年 Sakura. All rights reserved.
//

import UIKit

// IBDesignableにすると、InterfaceBuilder上でカスタムビューの見た目を確認できたり、プロパティを設定できるようになる
@IBDesignable class RatingControl: UIStackView {

  //MARK: Properties
  private var ratingButtons = [UIButton]()

  // メンバ変数に@IBInspectableをつけると、Interface Builder上で値を設定できる
  //  var starSize: CGSize = CGSize(width: 44.0, height: 44.0)
  //  var starCount: Int = 5
  @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
    didSet {
      setupButtons()
    }
  }
  @IBInspectable var starCount: Int = 5 {
    didSet {
      setupButtons()
    }
  }

  var rating = 0

  //MARK: Initialization
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupButtons()
  }

  required init(coder: NSCoder) {
    super.init(coder: coder)
    setupButtons()
  }

  //MARK: Button Action
  func ratingButtonTapped(button :UIButton) {
    print("Button Pressed 👍")
  }

  //MARK: Private Methods
  private func setupButtons() {

    // clear any existing buttons
    for button in ratingButtons {
      removeArrangedSubview(button)
      button.removeFromSuperview()
    }
    ratingButtons.removeAll()

    for _ in 0..<starCount {
      // Create the button
      let button = UIButton()
      button.backgroundColor = UIColor.red

      // Add constraints
      button.translatesAutoresizingMaskIntoConstraints = false
      button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
      button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true

      // Setup the button action
      button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)

      // Add the button to the stack
      //    自動配置させたい子Viewをコードから追加する場合、addArangedSubview:で行います。
      //    addSubview:では通常通りの子View追加となり、自動配置は行ってくれません。
      addArrangedSubview(button)

      // Add the new button to the rating button array
      ratingButtons.append(button)
    }
  }
}

//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Sakura on 2017/10/11.
//  Copyright © 2017年 Sakura. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

  //MARK: Properties
  private var ratingButtons = [UIButton]()

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
  private func setupButtons(){

    for _ in 0..<5 {

      // Create the button
      let button  = UIButton()
      button.backgroundColor = UIColor.red

      // Add constraints
      button.translatesAutoresizingMaskIntoConstraints = false
      button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
      button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true

      // Setup the button action
      button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)

      // Add the button to the stack
      //    自動配置させたい子Viewをコードから追加する場合、addArangedSubview:で行います。
      //    addSubview:では通常通りの子View追加となり、自動配置は行ってくれません。
      addArrangedSubview(button)
    }
  }
}

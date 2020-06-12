//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by iMac Óscar on 12/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

class GFItemInfoVC: UIViewController {
  
  let stackView       = UIStackView()
  let itemInfoViewOne = GFItemInfoView()
  let itemInfoViewTwo = GFItemInfoView()
  let actionButon     = GFButton()
  
  var user: User!
  
  init(user: User) {
    super.init(nibName: nil, bundle: nil)
    self.user = user
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureBackgroundView()
    layoutUI()
    configureStackView()
  }
  
  private func configureBackgroundView() {
    view.layer.cornerRadius = 18
    view.backgroundColor    = .secondarySystemBackground
  }
  
  private func configureStackView() {
    stackView.axis         = .horizontal
    stackView.distribution = .equalSpacing
    
    stackView.addArrangedSubview(itemInfoViewOne)
    stackView.addArrangedSubview(itemInfoViewTwo)
  }
  
  private func layoutUI() {
    view.addSubview(stackView)
    view.addSubview(actionButon)
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    let padding: CGFloat = 20
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
      stackView.heightAnchor.constraint(equalToConstant: 50),
      
      actionButon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
      actionButon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
      actionButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
      actionButon.heightAnchor.constraint(equalToConstant: 44)
    ])
  }
}

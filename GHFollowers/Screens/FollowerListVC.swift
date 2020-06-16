//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by iMac Óscar on 09/06/2020.
//  Copyright © 2020 Óscar García. All rights reserved.
//

import UIKit

class FollowerListVC: GFDataLoadingVC {
  
  enum Section { case main }
  
  var username: String!
  var followers: [Follower]         = []
  var filteredFollowers: [Follower] = []
  var page                          = 1
  var hasMoreFollowers              = true
  var isSearching                   = false
  var isLoadingMoreFollowers        = false
  
  var collectionView: UICollectionView!
  var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
  
  
  init(username: String) {
    super.init(nibName: nil, bundle: nil)
    self.username = username
    title         = username
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    configureSearchController()
    configureCollectionView()
    getFollers(username: username, page: page)
    configureDataSource()
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  
  private func configureViewController() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
    
    let addButton                     = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    navigationItem.rightBarButtonItem = addButton
  }
  
  
  private func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
    view.addSubview(collectionView)
    collectionView.delegate        = self
    collectionView.backgroundColor = .systemBackground
    collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
  }
  
  
  private func configureSearchController() {
    let searchController                                  = UISearchController()
    searchController.searchResultsUpdater                 = self
    searchController.searchBar.placeholder                = "Search for a username"
    searchController.obscuresBackgroundDuringPresentation = false
    navigationItem.searchController                       = searchController
  }
  
  
  private func getFollers(username: String, page: Int) {
    showLoadingView()
    isLoadingMoreFollowers = true
    
    NetworkManager.shared.getFollowers(for: username, page: page) { result in
      self.dismissLoadingView()
      
      switch result {
      case .success(let followers):
        self.updateUI(with: followers)
        
      case .failure(let error):
        self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
        DispatchQueue.main.async {
          self.navigationController?.popViewController(animated: true)
        }
      }
      
      self.isLoadingMoreFollowers = false
    }
  }
  
  
  private func updateUI(with followers: [Follower]) {
    if followers.count < 100 { self.hasMoreFollowers = false }
    self.followers.append(contentsOf: followers)
    
    if self.followers.isEmpty {
      let message = "This user doesn't have any followers. Go follow them 😀."
      DispatchQueue.main.async {
        self.navigationItem.searchController = nil
        self.showEmptyStateView(with: message, in: self.view)
      }
      return
    }
    
    self.updateData(on: self.followers)
  }
  
  
  private func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView) {
      (collectionView, indexPath, follower) -> UICollectionViewCell? in
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
      cell.set(follower: follower)
      return cell
    }
  }
  
  
  private func updateData(on followers: [Follower]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
    snapshot.appendSections([.main])
    snapshot.appendItems(followers)
    DispatchQueue.main.async {
      self.dataSource.apply(snapshot, animatingDifferences: true)
    }
  }
  
  
  @objc private func addButtonTapped() {
    showLoadingView()
    
    NetworkManager.shared.getUserInfo(for: username) { result in
      self.dismissLoadingView()
      
      switch result {
      case .success(let user):
        self.addUserToFavorites(user: user)
        
      case .failure(let error):
        self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
      }
    }
  }
  
  
  private func addUserToFavorites(user: User) {
    let favorite = Follower(login: user.login, avatarUrl: user.avatarUrl)
    
    PersistenceManager.updateWith(favorite: favorite, actionType: .add) { error in
      guard let error = error else {
        self.presentGFAlertOnMainThread(title: "Success!", message: "You have successfully favorited this user 🎉", buttonTitle: "Hooray!")
        return
      }
      
      self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
    }
  }
}


extension FollowerListVC: UICollectionViewDelegate {
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    let offsetY       = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height
    let height        = scrollView.frame.size.height
    
    if offsetY > contentHeight - height {
      guard hasMoreFollowers, !isLoadingMoreFollowers else { return }
      page += 1
      getFollers(username: username, page: page)
    }
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let activeArray   = isSearching ? filteredFollowers : followers
    let follower      = activeArray[indexPath.item]
    
    let destVC        = UserInfoVC()
    destVC.username   = follower.login
    destVC.delegate   = self
    let navController = UINavigationController(rootViewController: destVC)
    present(navController, animated: true)
  }
}


extension FollowerListVC: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    guard let filter = searchController.searchBar.text, !filter.isEmpty else {
      filteredFollowers.removeAll()
      updateData(on: followers)
      isSearching = false
      return
    }
    
    isSearching       = true
    filteredFollowers = followers.filter { $0.login.lowercased().contains(filter.lowercased()) }
    updateData(on: filteredFollowers)
  }
}


extension FollowerListVC: UserInfoVCDelegate {
  
  func didRequestFollowers(for username: String) {
    self.username = username
    title         = username
    page          = 1

    followers.removeAll()
    filteredFollowers.removeAll()
    collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
    getFollers(username: username, page: page)
  }
}

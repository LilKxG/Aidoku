//
//  BaseObservingViewController.swift
//  Aidoku (iOS)
//
//  Created by Skitty on 8/2/22.
//

import UIKit

class BaseObservingViewController: BaseViewController {

    private var observers: [NSObjectProtocol] = []

    deinit {
        for observer in observers {
            NotificationCenter.default.removeObserver(observer)
        }
    }

    func addObserver(forName name: NSNotification.Name, object: Any? = nil, using block: @escaping (Notification) -> Void) {
        observers.append(NotificationCenter.default.addObserver(
            forName: name, object: object, queue: nil, using: block
        ))
    }

    func addObserver(forName name: String, object: Any? = nil, using block: @escaping (Notification) -> Void) {
        addObserver(forName: NSNotification.Name(name), object: object, using: block)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setStatusBarBackgroundColor()
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        observe()
    }

    func observe() {}
    
    
}

extension BaseObservingViewController{
    
      func setStatusBarBackgroundColor(){
          if #available(iOS 15.0, *) {
              let  storedTabBarAppearance = navigationController?.tabBarController?.tabBar.scrollEdgeAppearance
              let tabBarAppearance = UITabBarAppearance()
              //tabBarAppearance.configureWithOpaqueBackground()
              tabBarAppearance.backgroundColor = .systemGreen
              navigationController?.tabBarController?.tabBar.scrollEdgeAppearance = tabBarAppearance
          }
          
          //静态时状态栏
              let statusBarview=UIView()
              statusBarview.backgroundColor = .systemGreen
              view.addSubview(statusBarview)
              statusBarview.translatesAutoresizingMaskIntoConstraints = false
              statusBarview.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
              statusBarview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
              statusBarview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
      //        statusBarview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive=true
              statusBarview.heightAnchor.constraint(equalToConstant: 90).isActive = true
              //滑动时状态栏
              navigationController?.navigationBar.barTintColor  = .systemGreen
      }
}

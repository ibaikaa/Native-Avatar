//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Ian Baikuchukov on 24/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var avatarView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.crop.circle.fill")
        view.tintColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let largeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        guard let titleView = navigationController?.navigationBar.subviews.first(where: { $0.isKind(of: largeTitleView) }) else { return }
        
        titleView.addSubview(avatarView)
        NSLayoutConstraint.activate([
            avatarView.rightAnchor.constraint(equalTo: titleView.rightAnchor, constant: -16),
            avatarView.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -10),
            avatarView.widthAnchor.constraint(equalToConstant: 36),
            avatarView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
}

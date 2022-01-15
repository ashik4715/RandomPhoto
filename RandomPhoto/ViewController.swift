//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Md Ashikur Rahman on 2022-01-15.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()

    private let imageButton: UIButton = {
       let imageButton = UIButton()
        imageButton.backgroundColor = .purple
        imageButton.setTitle("Click here & Get A Random Photo!", for: .normal)
        imageButton.setTitleColor(.white, for: .normal)
        return imageButton
    }()
    
    let colors: [UIColor] = [
        .systemMint,
        .systemRed,
        .systemBlue,
        .systemPink,
        .systemIndigo,
        .systemOrange,
        .systemBrown
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(imageView)
        imageView.frame = CGRect(x:0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(imageButton)
    
        getRandomPhoto()
        imageButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
        
    @objc func didTapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageButton.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55
        )
    }
    
    func getRandomPhoto() {
        let urlString =
            "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let imageData = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: imageData)
    }

}


//
//  ViewController.swift
//  Calculator
//
//  Created by Margarita Can on 10.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
    }
    private func viewSettings() {
        screenSettings()
        buttonSettings()
        view.backgroundColor = .black
    }
    let screenView = UIView()
    private func screenSettings() {
        screenView.backgroundColor = .darkGray
        screenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(screenView)

        NSLayoutConstraint.activate([
            screenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0),
            screenView.heightAnchor.constraint(equalToConstant: 200),
            screenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            screenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
    ])
    }
    
    private let buttonTitles1 = ["C","<=","%","/"]
    private let buttonTitles2 = ["7","8","9","x"]
    private let buttonTitles3 = ["4","5","6","-"]
    private let buttonTitles4 = ["1","2","3","√"]
    private let buttonTitles5 = [".","0","=","+"]
    private var buttons = [UIButton]()
    
    private func buttonSettings() {
        let stackView = UIStackView ()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: screenView.bottomAnchor, constant: 1),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0 ),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            ])
        
        let buttonTitlesArray = [buttonTitles1,buttonTitles2,buttonTitles3,buttonTitles4, buttonTitles5]
        for titles in buttonTitlesArray {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 1
            rowStackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(rowStackView)
            
            
            for title in titles {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.setTitle(title, for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
                rowStackView.addArrangedSubview(button)
                buttons.append(button)
                
                if let number = Int(title), number >= 0 && number <= 9 {
                    button.backgroundColor = .systemOrange }
                else if title == "." || title == "=" {
                    button.backgroundColor = .systemOrange }
                else {
                    button.backgroundColor = .systemBlue
                }
                }
            
        }
    }
    @objc private func buttonTap () {
        print ("butttonTapped")
    }
}



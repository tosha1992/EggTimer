//
//  ViewController.swift
//  EggTimer
//
//  Created by Anton Medovnik on 14.04.2023.
//

import UIKit

protocol GameViewModelProtocol: AnyObject {
    func updateUI(seconds: Int)
}

class CustomButton: UIButton {
    override open var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.1 : 1
        }
    }
}

class ViewController: UIViewController {
    weak var delegate: GameViewModelProtocol?
    
    let viewStack = UIStackView ()
    let topLabel = UILabel ()
    
    
    let horizontalEggStack = UIStackView ()
    let timeView = UILabel()
    let softEggView = UIImageView (image: UIImage(named: "soft_egg"))
    let mediumEggView = UIImageView (image: UIImage(named: "medium_egg"))
    let hardEggView = UIImageView (image: UIImage(named: "hard_egg"))
    let softButton = CustomButton()
    let mediumButton = CustomButton ()
    let hardButton = CustomButton ()
    let timerLabel = UILabel()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        timeView.isUserInteractionEnabled = true
        buttonsSettings()
        setupTimeview()
        setupHorizontalEggStack()
        setupEggsView()
        setupLableStack()
        setupViewStack()
        setupAllConstraints()
        
    }
    
   
    
    
    // View Stack
    
    func setupViewStack () {
        view.addSubview(viewStack)
        
        viewStack.backgroundColor = .gray
        viewStack.alignment = .fill
        viewStack.distribution = .fillEqually
        viewStack.axis = .vertical
        viewStack.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    // Top label
    
    func setupLableStack () {
        viewStack.addSubview(topLabel)
        timerLabel.textColor = .white
        timerLabel.font = UIFont.boldSystemFont(ofSize: 40)
        topLabel.textColor = .white
        topLabel.text = "HOW DO YOU WANT TO COOK YOUR EGGS?"
        topLabel.textAlignment = .center
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    //Horizontal Stack View
    
    func setupHorizontalEggStack () {
        viewStack.addSubview(horizontalEggStack)
        horizontalEggStack.alignment = .fill
        horizontalEggStack.distribution = .fillEqually
        horizontalEggStack.axis = .horizontal
        horizontalEggStack.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    //Time View
    
    func setupTimeview () {
        viewStack.addSubview(timeView)
        timeView.addSubview(timerLabel)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timeView.translatesAutoresizingMaskIntoConstraints = false
        
       
        
        
    }
    
    
    
    //Soft Button Pressed
    
    
    
    
    
    func buttonsSettings () {
        softButton.setTitle("Soft", for: .normal)
        mediumButton.setTitle("Medium", for: .normal)
        hardButton.setTitle("Hard", for: .normal)
        
        softButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        hardButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        
        softButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        mediumButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        hardButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        softEggView.addSubview(softButton)
        mediumEggView.addSubview(mediumButton)
        hardEggView.addSubview(hardButton)
        
        softButton.translatesAutoresizingMaskIntoConstraints = false
        mediumButton.translatesAutoresizingMaskIntoConstraints = false
        hardButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    
    //Egg View
    
    func setupEggsView () {
        horizontalEggStack.addSubview(softEggView)
        horizontalEggStack.addSubview(mediumEggView)
        horizontalEggStack.addSubview(hardEggView)
        softEggView.isUserInteractionEnabled = true
        hardEggView.isUserInteractionEnabled = true
        mediumEggView.isUserInteractionEnabled = true
        softEggView.contentMode = .scaleAspectFit
        mediumEggView.contentMode = .scaleAspectFit
        hardEggView.contentMode = .scaleAspectFit
        softEggView.translatesAutoresizingMaskIntoConstraints = false
        mediumEggView.translatesAutoresizingMaskIntoConstraints = false
        hardEggView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //Constraints
    
    func setupAllConstraints () {
        
        NSLayoutConstraint.activate([
            //
            viewStack.topAnchor.constraint(equalTo: view.topAnchor),
            viewStack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            topLabel.topAnchor.constraint(equalTo: viewStack.topAnchor),
            topLabel.leadingAnchor.constraint(equalTo: viewStack.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: viewStack.trailingAnchor),
            topLabel.bottomAnchor.constraint(equalTo: horizontalEggStack.topAnchor),
            
            horizontalEggStack.centerYAnchor.constraint(equalTo: viewStack.centerYAnchor),
            horizontalEggStack.leadingAnchor.constraint(equalTo: viewStack.leadingAnchor),
            horizontalEggStack.trailingAnchor.constraint(equalTo: viewStack.trailingAnchor),
            horizontalEggStack.heightAnchor.constraint(equalToConstant: 200),
            
            timeView.leadingAnchor.constraint(equalTo: viewStack.leadingAnchor),
            timeView.trailingAnchor.constraint(equalTo: viewStack.trailingAnchor),
            timeView.topAnchor.constraint(equalTo: horizontalEggStack.bottomAnchor),
            timeView.bottomAnchor.constraint(equalTo: viewStack.bottomAnchor),
            
            softEggView.trailingAnchor.constraint(equalTo: mediumEggView.leadingAnchor, constant: -10),
            softEggView.topAnchor.constraint(equalTo: horizontalEggStack.topAnchor),
            softEggView.widthAnchor.constraint(equalToConstant: 110),
            softEggView.bottomAnchor.constraint(equalTo: horizontalEggStack.bottomAnchor),
            
            mediumEggView.centerXAnchor.constraint(equalTo: horizontalEggStack.centerXAnchor),
            mediumEggView.topAnchor.constraint(equalTo: horizontalEggStack.topAnchor),
            mediumEggView.widthAnchor.constraint(equalToConstant: 110),
            mediumEggView.bottomAnchor.constraint(equalTo: horizontalEggStack.bottomAnchor),
            
            hardEggView.leadingAnchor.constraint(equalTo: mediumEggView.trailingAnchor, constant: 10),
            hardEggView.topAnchor.constraint(equalTo: horizontalEggStack.topAnchor),
            hardEggView.widthAnchor.constraint(equalToConstant: 110),
            hardEggView.bottomAnchor.constraint(equalTo: horizontalEggStack.bottomAnchor),
            
            softButton.centerXAnchor.constraint(equalTo: softEggView.centerXAnchor),
            softButton.centerYAnchor.constraint(equalTo: softEggView.centerYAnchor),
            
            mediumButton.centerXAnchor.constraint(equalTo: mediumEggView.centerXAnchor),
            mediumButton.centerYAnchor.constraint(equalTo: mediumEggView.centerYAnchor),
            
            hardButton.centerXAnchor.constraint(equalTo: hardEggView.centerXAnchor),
            hardButton.centerYAnchor.constraint(equalTo: hardEggView.centerYAnchor),
            
            timerLabel.centerXAnchor.constraint(equalTo: timeView.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: timeView.centerYAnchor)
            
            
            
        ])
    }
    let eggTimes = ["Soft": 5, "Medium": 30, "Hard": 60]
    
    @objc func pressMe(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        let result = eggTimes[hardness]!
        
        print(result)
        
    }
    
    var timer: Timer?
    var currentTime = 20
    
    @objc func startTimer (_ sender: UIButton) {
        timer?.invalidate()
        let hardness = sender.currentTitle!
        currentTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector (updateTimer),
                                     userInfo: nil,
                                     repeats: true)
 
    }
    func stopTimer() {
        timer?.invalidate()
        
    }
    
    
    
    @objc func updateTimer () {
        
        if currentTime > 0 {
            currentTime -= 1
           updateUI(seconds: currentTime)
        }
        if currentTime == 0 {
            stopTimer()
            print("open")
        }
        
        
        func updateUI(seconds: Int) {
            timerLabel.text = String(format: "00:%02d", seconds)
        }
       
        
        
        //    func makeTimeString (minute: Int, seconds:Int) ->String {
        //        var timeString = ""
        //        timeString += String (format: "0%2d", minute)
        //        var timeString = ""
        //        timeString += String (format: "0%2d", seconds)
        //    }
        
        
    }
    
}
    


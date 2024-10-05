//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Yaroslav Malygin on 02.10.2024.
//

import UIKit

final class ViewController: UIViewController {

    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        
        setupColorView()
        setupRedSlider()
        setupGreenSlider()
        setupBlueSlider()
        setColorForLabel()
    }
    
    @IBAction func sliderAction() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        redValueLabel.text = String(format: "%.02f", redSlider.value)
        greenValueLabel.text = String(format: "%.02f", greenSlider.value)
        blueValueLabel.text = String(format: "%.02f", blueSlider.value)
    }
    
    private func setupColorView() {
        colorView.layer.borderWidth = 1
        colorView.backgroundColor = .black
        colorView.layer.cornerRadius = 10
    }
    
    private func setColorForLabel() {
        redLabel.textColor = .white
        greenLabel.textColor = .white
        blueLabel.textColor = .white
        
        redValueLabel.textColor = .white
        greenValueLabel.textColor = .white
        blueValueLabel.textColor = .white
    }
    
    private func setupRedSlider() {
        redSlider.value = 0.0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = .gray
    }
    
    private func setupGreenSlider() {
        greenSlider.value = 0.0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .gray
    }
    
    private func setupBlueSlider() {
        blueSlider.value = 0.0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .gray
    }
}

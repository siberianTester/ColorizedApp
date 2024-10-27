//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Yaroslav Malygin on 02.10.2024.
//

import UIKit

final class ColorViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var color: UIColor!
    
    weak var delegate: ColorViewControllerDelegate?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColorView()
        setSliderValue()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        viewSetColor()
        
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
            redTextField.text = redValueLabel.text
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
            greenTextField.text = greenValueLabel.text
        default:
            blueValueLabel.text = string(from: blueSlider)
            blueTextField.text = blueValueLabel.text
        }
    }
    
    @IBAction func saveColorAction() {
        delegate?.setColor(colorView)
        dismiss(animated: true)
    }
    
    private func setSliderValue() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
        
        redTextField.text = redValueLabel.text
        greenTextField.text = greenValueLabel.text
        blueTextField.text = blueValueLabel.text
    }
    
    private func setupColorView() {
        colorView.layer.borderWidth = 1
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = color
    }
    
    private func viewSetColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) 
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension ColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let textValue = textField.text
        guard let inputText = textValue, !inputText.isEmpty else {
            showAlert(
                withTitle: "Text field is empty",
                andMessage: "Please enter a value from 0.00 to 1.00"
            )
            return
        }
        
        guard let text = Float(textValue ?? ""), text >= 0 && text <= 1 else {
            showAlert(
                withTitle: "Wrong format!",
                andMessage: "Please enter a value from 0.00 to 1.00"
            )
            return
        }
        
        switch textField {
        case redTextField:
            redValueLabel.text = textValue ?? ""
            redSlider.setValue(Float(textValue ?? "") ?? 0, animated: true)
        case greenTextField:
            greenValueLabel.text = textValue ?? ""
            greenSlider.setValue(Float(textValue ?? "") ?? 0, animated: true)
        default:
            blueValueLabel.text = textField.text ?? ""
            blueSlider.setValue(Float(textValue ?? "") ?? 0, animated: true)
        }
        viewSetColor()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

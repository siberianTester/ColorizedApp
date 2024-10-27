//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Yaroslav Malygin on 27.10.2024.
//

import UIKit

protocol ColorViewControllerDelegate: AnyObject {
    func setColor(_ colorView: UIView)
}

final class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else { return }
        colorVC.color = view.backgroundColor
        colorVC.delegate = self
    }
}

// MARK: - ColorViewControllerDelegate
extension StartViewController: ColorViewControllerDelegate {
    func setColor(_ colorView: UIView) {
        view.backgroundColor = colorView.backgroundColor
    }
}

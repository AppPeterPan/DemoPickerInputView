//
//  ViewController.swift
//  Demo
//
//  Created by Peter Pan on 2022/8/2.
//

import UIKit

class ViewController: UIViewController {
    let songs = ["黑色毛衣", "黑色幽默", "黑色小狗", "黑色柳丁"]

    @IBOutlet weak var songTextField: UITextField!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet var songToolbar: UIToolbar!
    @IBOutlet var songPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        songTextField.inputView = songPickerView
        songTextField.inputAccessoryView = songToolbar
    }

    
    @IBAction func selectSong(_ sender: Any) {
        songTextField.becomeFirstResponder()
    }
    
    @IBAction func selectSongCancel(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func selectSongDone(_ sender: Any) {
        let row = songPickerView.selectedRow(inComponent: 0)
        songLabel.text = songs[row]
        view.endEditing(true)
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        songs.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        songs[row]
    }
}

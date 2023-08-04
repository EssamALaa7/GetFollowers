//
//  ViewController.swift
//  GetFollowers App
//
//  Created by Essam on 30/07/2023.
//

import UIKit

class FisrtScreenVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var imagView: UIImageView!
    let datePicker = UIDatePicker()
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var dateDisplay: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.maximumDate = Date()
        datePicker.locale = Locale(identifier: "en")
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        nameTF.delegate = self
        DatePicker()
        initialSetup()
        print("Hello, from the other side (Adele) created by anas")
    }
    @objc func dateChanged(_ sender: UIDatePicker) {
            let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
            if let day = components.day, let month = components.month, let year = components.year {
                dateDisplay.text = "\(day)-\(month)-\(year)"
            }
        }
    private func initialSetup(){
        imagView.layer.cornerRadius    = 50
        nameTF.layer.borderWidth       = 1
        nameTF.layer.borderColor       = UIColor.blue.cgColor
        nameTF.layer.cornerRadius      = 10
        dateDisplay.layer.borderWidth  = 1
        dateDisplay.layer.borderColor  = UIColor.blue.cgColor
        dateDisplay.layer.cornerRadius = 10
    }
    func creatToolbar () -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnTapped))
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBtnTapped))
        cancelBtn.tintColor = .red
        toolbar.setItems([doneBtn,cancelBtn], animated: true)
        return toolbar
    }
    func DatePicker (){
        dateDisplay.inputAccessoryView = creatToolbar()
        dateDisplay.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
    }
    @objc func doneBtnTapped(){
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        formatter.timeStyle = .none
//        dateDisplay.text = formatter.string(from: datePicker.date)
        let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en")
                dateFormatter.dateStyle = DateFormatter.Style.short
                dateFormatter.dateFormat = "dd-MM-YYYY"
                
                let inputDate = dateFormatter.string(from: datePicker.date)
        dateDisplay.text = inputDate
    }
    @objc func cancelBtnTapped(){
        self.view.endEditing(true)
    }
    @IBAction func nextButton(_ sender: Any) {
        if (nameTF != nil), dateDisplay.text == "" {
            let alertController = UIAlertController(title: "Alert", message: "Please Fill In Required Fields", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondScreenVC") as! SecondScreenVC
        vc.nameUser = nameTF.text ?? ""
        vc.date = dateDisplay.text ?? ""
        
        present(vc, animated: true)
        
    }
    
}


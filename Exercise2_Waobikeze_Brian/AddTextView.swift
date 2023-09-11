//
//  AddTextView.swift
//  Exercise2_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/8/23.
//

import SwiftUI



struct AddTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EditCardDescripRepresentable(switchBackToHome: .constant(false))
        }
    }
}
struct EditCardDescripRepresentable: UIViewControllerRepresentable {
    @Binding var switchBackToHome: Bool
    func makeUIViewController(context: Context) -> EditCardDescripViewController {
    let viewController = EditCardDescripViewController()
        viewController.switchBackToHome = switchBackToHome
        return viewController
    }
    

    func updateUIViewController(_ uiViewController: EditCardDescripViewController, context: Context) {
        uiViewController.switchBackToHome = switchBackToHome
    }
    
}
class EditCardDescripViewController: UIViewController {
    var switchBackToHome: Bool = false
    var cardData: CardData?
    var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        
            let titleLabel = UILabel()
            titleLabel.text = "Add Bullet"
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            
            textField = UITextField()
            textField.placeholder = "New bullet"
            textField.font = UIFont.systemFont(ofSize: 18)
            textField.borderStyle = .roundedRect
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
            
            let saveButton = UIButton(type: .system)
            saveButton.setTitle("Save", for: .normal)
            saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            saveButton.frame = CGRect(x: 0, y: 0, width: 400, height: 50)
            saveButton.addTarget(self, action: #selector(inputTitle), for: .touchUpInside)
            
            let cancelButton = UIButton(type: .system)
            cancelButton.setTitle("Cancel", for: .normal)
            cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            cancelButton.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
            cancelButton.addTarget(self, action: #selector(goBacktoHomePage), for: .touchUpInside)
            
            let stackView = UIStackView(arrangedSubviews: [titleLabel,textField,saveButton, cancelButton])
            stackView.axis = .vertical
            stackView.spacing = 10
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(stackView)
            
            NSLayoutConstraint.activate([
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            ])
        
    }
    
    @objc func inputTitle() {
        // Implement your save action here.
        let enteredText = textField.text ?? ""
        //cardData!.cardTitle[cardData!.selectedTitleIndex] = enteredText
        dismiss(animated: true, completion: nil)
    }
    
    @objc func goBacktoHomePage() {
        //switchBackToHome.toggle()
        dismiss(animated: true, completion: nil)
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
          // Handle text field value change here if needed.
      }
}

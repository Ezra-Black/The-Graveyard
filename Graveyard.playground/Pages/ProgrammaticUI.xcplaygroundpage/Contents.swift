//import Foundation
//
//private func setUpSubviews(){
//           let imageView = UIImageView()
//           imageView.translatesAutoresizingMaskIntoConstraints = false
//           imageView.contentMode = .scaleAspectFit
//           view.addSubview(imageView)
//           imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4).isActive = true
//           imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//           imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1, constant: 0).isActive = true
//           self.imageView = imageView
//
//           let addPhotoButton = UIButton(type: .system)
//           addPhotoButton.translatesAutoresizingMaskIntoConstraints = false
//           addPhotoButton.setTitle("Add Photo", for: .normal)
//           view.addSubview(addPhotoButton)
//           addPhotoButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
//           addPhotoButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
//           addPhotoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//
//           let textField = UITextField()
//           textField.placeholder = "Give this photo a title: "
//           textField.translatesAutoresizingMaskIntoConstraints = false
//           view.addSubview(textField)
//           textField.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 2).isActive = true
//           textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//           textField.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1, constant: 0).isActive = true
//           self.titleTextField = textField
//
//           let barButton = UIBarButtonItem(title: "Save Photo", style: .plain, target: .none, action: #selector(savePhoto))
//           self.navigationItem.setRightBarButton(barButton, animated: true)
//       }

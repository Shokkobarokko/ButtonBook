import UIKit

final class PlainButtonViewController: UIViewController {
    private lazy var plainButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Нажми меня", for: .normal)
           button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
           button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()

       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .systemBackground
           title = "Plain Button"
           setupButton()
       }

       private func setupButton() {
           view.addSubview(plainButton)
           NSLayoutConstraint.activate([
               plainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               plainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
           ])
       }

       @objc private func buttonTapped() {
           print("✨ Plain button tapped!")
       }
   }


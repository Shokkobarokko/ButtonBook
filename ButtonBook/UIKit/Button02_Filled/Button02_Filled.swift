import UIKit

final class FilledButtonViewController: UIViewController {
    
    private lazy var filledButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Заливка", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        
        var config = button.configuration ?? .plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 24, bottom: 14, trailing: 24)
        button.configuration = config
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(filledButton)
        filledButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            filledButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filledButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    //MARK: - Actions
    
    @objc private func buttonTapped() {
        print("🎨 Filled button tapped!")
    }
    
    @objc private func buttonTouchDown() {
        UIView.animate(withDuration: 0.1) {
            self.filledButton.backgroundColor = .systemBlue.withAlphaComponent(0.7)
        }
    }
    
    @objc private func buttonTouchUp() {
        UIView.animate(withDuration: 0.1) {
            self.filledButton.backgroundColor = .systemBlue
        }
    }
}


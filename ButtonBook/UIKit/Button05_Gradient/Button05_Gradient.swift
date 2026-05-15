import UIKit

final class GradientButtonViewController: UIViewController {
    
    private let gradientLayer = CAGradientLayer()
    
    private lazy var gradientButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Градиент", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        button.contentEdgeInsets = UIEdgeInsets(top: 14, left: 28, bottom: 14, right: 28)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.addTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(gradientButton)
        
        NSLayoutConstraint.activate([
            gradientButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gradientButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = gradientButton.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupGradient()
    }
    
    private func setupGradient() {
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemPurple.cgColor
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        gradientLayer.cornerRadius = 14
        gradientButton.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @objc private func buttonTapped() {
        print("Gradient button tapped!")
    }
    
    @objc private func touchDown() {
        UIView.animate(withDuration: 0.1) {
            self.gradientButton.alpha = 0.8
            self.gradientButton.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
        }
    }
    
    @objc private func touchUp() {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseOut) {
            self.gradientButton.alpha = 1.0
            self.gradientButton.transform = .identity
        }
    }
}

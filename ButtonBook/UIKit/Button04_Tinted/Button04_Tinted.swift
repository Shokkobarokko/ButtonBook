import UIKit

final class TintedButtonViewController: UIViewController {
    
    private lazy var tintedButton: UIButton = {
        var config = UIButton.Configuration.tinted()
        config.title = "Оттенок"
        
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .systemBlue
        
        config.cornerStyle = .medium
        
        config.contentInsets = NSDirectionalEdgeInsets(
            top: 14,
            leading: 24,
            bottom: 14,
            trailing: 24
        )
        let button = UIButton(configuration: config)
        
        button.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            return outgoing
        }
        button.configurationUpdateHandler = { button in
            switch button.state {
            case .highlighted:
                button.configuration?.baseBackgroundColor = .systemBlue.withAlphaComponent(0.3)
            default:
                button.configuration?.baseBackgroundColor = .systemBlue
            }
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(tintedButton)
        NSLayoutConstraint.activate([
            tintedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tintedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func buttonTapped() {
        print("Tinted button tapped")
    }
}

import UIKit

final class OutlinedButtonViewController: UIViewController {
    private lazy var outlinedButton: UIButton = {
        var config = UIButton.Configuration.plain()
        
        config.title = "Рамка"
        config.baseBackgroundColor = .systemBlue
        config.background.strokeColor = .systemBlue
        config.background.strokeWidth = 2.0
        config.background.cornerRadius = 12
        
        config.contentInsets = NSDirectionalEdgeInsets(
            top: 14,
            leading: 24,
            bottom: 14,
            trailing: 24
        )
        
        let button = UIButton(configuration: config)
        button.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{ incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            return outgoing
        }
        button.configurationUpdateHandler = {
            button in
            switch button.state {
            case.highlighted:
                button.configuration?.baseBackgroundColor = .systemBlue.withAlphaComponent(0.5)
                button.configuration?.background.strokeColor = .systemBlue.withAlphaComponent(0.5)
            default:
                button.configuration?.baseForegroundColor = .systemBlue
                button.configuration?.background.strokeColor = .systemBlue
            }
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(outlinedButton)
        NSLayoutConstraint.activate([
            outlinedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            outlinedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func buttonTapped() {
        print("Outlined button tapped")
    }
}

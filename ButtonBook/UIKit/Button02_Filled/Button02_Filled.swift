import UIKit

final class FilledButtonViewController: UIViewController {
    
    private lazy var filledButton: UIButton = {
        var config = UIButton.Configuration.filled()
                config.title = "Заливка"
                config.baseBackgroundColor = .systemBlue
                config.baseForegroundColor = .white
                config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 24, bottom: 14, trailing: 24)
        let button = UIButton(configuration: config)
        button.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            return outgoing
        }
        button.configurationUpdateHandler = { button in
                    switch button.state {
                    case .highlighted:
                        button.configuration?.baseBackgroundColor = .systemBlue.withAlphaComponent(0.7)
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
}


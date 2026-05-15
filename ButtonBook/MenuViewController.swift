import UIKit

class MenuViewController: UITableViewController {
    
    private let buttonsUIKit: [(title: String, vc: UIViewController.Type)] = [
           ("Plain", PlainButtonViewController.self),
           ("Filled", FilledButtonViewController.self),
           ("Outlined", OutlinedButtonViewController.self),
           ("Tented", TintedButtonViewController.self),
           ("Gradient", GradientButtonViewController.self)
       ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ButtonBook"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int { 2 }

       override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           section == 0 ? "UIKit" : "SwiftUI"
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           section == 0 ? buttonsUIKit.count : 0
       }

       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
           let item = buttonsUIKit[indexPath.row]
           cell.textLabel?.text = item.title
           cell.accessoryType = .disclosureIndicator
           return cell
       }

       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           let vc = buttonsUIKit[indexPath.row].vc.init()
           navigationController?.pushViewController(vc, animated: true)
       }
   }




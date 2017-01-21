import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var pushMove: UIButton!
    @IBOutlet weak var pushBackButton: UIButton!
    @IBOutlet weak var modalButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var closeModal: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(ViewController.buttonTapped(_:)), for: .touchUpInside)
        pushMove.addTarget(self, action: #selector(ViewController.pushMoveTapped(_:)), for: .touchUpInside)
        
        pushBackButton.addTarget(self, action: #selector(ViewController.pushBackTapped(_:)), for: .touchUpInside)
        let vcCount = navigationController?.childViewControllers.count ?? 0
        pushBackButton.isEnabled = vcCount > 1
        
        modalButton.addTarget(self, action: #selector(ViewController.modalTapped(_:)), for: .touchUpInside)
        
        closeModal.target = self
        closeModal.action = #selector(ViewController.cloaseModalTapped(_:))
        closeModal.isEnabled = presentingViewController != nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NSLog("childViewControllers: \(navigationController?.childViewControllers.count ?? 0)")
    }
    
    func buttonTapped(_ sender: Any) {
        label.text = Date().description
    }

    func pushMoveTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Main") as! ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushBackTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func modalTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
            .instantiateInitialViewController()
            as! UINavigationController
        present(vc, animated: true, completion: nil)
    }
    
    func cloaseModalTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

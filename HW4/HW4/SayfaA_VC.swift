

import UIKit

class SayfaA_VC: UIViewController {

    @IBOutlet weak var sayfaA_label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gitB_button(_ sender: Any) {
        performSegue(withIdentifier: "SayfaA-SayfaB", sender: nil)
    }
    
}

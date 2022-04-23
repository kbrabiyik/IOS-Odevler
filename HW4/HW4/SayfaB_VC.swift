

import UIKit

class SayfaB_VC: UIViewController {

    @IBOutlet weak var SayfaB_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gitY_button(_ sender: Any) {
        performSegue(withIdentifier: "SayfaB-SayfaY", sender: nil)
    }
    
}


import UIKit

class SayfaX_VC: UIViewController {

    @IBOutlet weak var sayfaX_Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gitY_button(_ sender: Any) {
        performSegue(withIdentifier: "SayfaX-SayfaY", sender: nil)
    }
    
}

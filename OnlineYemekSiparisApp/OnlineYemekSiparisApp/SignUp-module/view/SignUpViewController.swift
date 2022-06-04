
import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.signUpIdentifier {
            let barViewControllers = segue.destination as! TabbarViewController
            let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let destinationViewController = nav.topViewController as! YemeklerViewController
            destinationViewController.username = emailTextfield.text
        }
    }

  
  
    @IBAction func signUpPressed(_ sender: UIButton) {
         
         if let email = emailTextfield.text, let password = passwordTextfield.text {
             
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: Constants.signUpIdentifier, sender: self)
                }
            }
         }
         
     }

 }

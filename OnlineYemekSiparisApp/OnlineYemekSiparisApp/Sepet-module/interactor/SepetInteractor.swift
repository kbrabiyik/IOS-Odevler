
import Foundation
class SepetInteractor: PresenterToInteractorSepetProtocol {
    
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func sepettekiYemekSec(userName: String) {
        var request = URLRequest(url: URL(string: Constants.Urller.sepettekiYemekleriGetirUrl)!)
        request.httpMethod = "POST"
        
        let postString = "kullanici_adi=\(userName)"
        request.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
            
                    
            do {
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(SepettekiYemeklerCevap.self, from: data!)
                if let SepettekiYemekListe = result.sepet_yemekler {
                    self.sepetPresenter?.PresenteraVeriGonder(SepettekiYemekListe: SepettekiYemekListe)
                }
            }
            catch let error as DecodingError
            {
                switch error {
                    case .typeMismatch(let key, let value):
                      print("error typeMismatch \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .valueNotFound(let key, let value):
                      print("error valueNotFound \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .keyNotFound(let key, let value):
                      print("error keyNotFound \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .dataCorrupted(let key):
                      //The given data was not valid JSON
                      print("error dataCorrupted \(key), and ERROR: \(error.localizedDescription)")
                    default:
                      print("ERROR: \(error.localizedDescription)")
                    }
                self.sepetPresenter?.PresenteraVeriGonder(SepettekiYemekListe: [])
                
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func sepettenYemekSil(sepet_yemek_id: Int, userName: String) {
        var request = URLRequest(url: URL(string: Constants.Urller.sepettenYemekSilUrl)!)
        request.httpMethod = "POST"
        
        let postString = "sepet_yemek_id=\(sepet_yemek_id)&kullanici_adi=\(userName)"
        request.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
                    
            do {
                let result = try JSONDecoder().decode(SepettenKaldırCevap.self, from: data!)
                print(result)
                self.sepettekiYemekSec(userName: userName)
                
                
             } catch{print(error.localizedDescription)}
        }.resume()
    }
    
    
}

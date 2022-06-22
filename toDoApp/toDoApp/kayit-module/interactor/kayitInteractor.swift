
import Foundation

class yapilacakKayitInteractor : PresenterToInteractorYapilacakKayitProtocol {
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("ToDo.db")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func isEkle(yapilacak_is: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO todo (yapilacak_is) VALUES (?)", values:[yapilacak_is])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}

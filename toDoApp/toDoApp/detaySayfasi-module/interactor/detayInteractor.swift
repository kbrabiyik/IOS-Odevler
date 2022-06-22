

import Foundation

class yapilacakDetayInteractor : PresenterToInteractorYapilacakDetayProtocol {
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("ToDo.db")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func isGuncelle(yapilacak_id: Int, yapilacak_is: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE todo SET yapilacak_is=? WHERE yapilacak_id=?", values: [yapilacak_is,yapilacak_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }

}

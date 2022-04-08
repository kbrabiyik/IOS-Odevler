import UIKit

class Odev2 {
    
    func soru1(derece:Double) -> Double {
        let fahrenheit = (derece * 1.8 ) + 32
        return fahrenheit
    }
    
    func soru2(kenar1:Double,kenar2:Double,kenar3:Double,kenar4:Double) -> Double {
        let cevre = kenar1 + kenar2 + kenar3 + kenar4
        return cevre
    }
    
    func soru3(_ faktoriyel:Int) -> Int {
        if faktoriyel == 0 || faktoriyel == 1 {
            return 1
        }else{
            return(faktoriyel*soru3(faktoriyel - 1))
        }
    }
    
    func soru4(kelime:String,karakter:Character) -> Int {
        let harfler = Array(kelime)
        var sayac = 0
        for harf in harfler {
            if harf == karakter {
                sayac += 1
            }
        }
        return sayac
    }
    
    func soru5(kenarSayisi:Int) -> Int {
        let ic_acilar_toplam = (kenarSayisi - 2 ) * 180
        return ic_acilar_toplam
    }
    
    func soru6(GunSayisi:Int) -> Int {
        var maas:Int = 1600 // ekstrasız max kazancı
        if GunSayisi >= 20 && GunSayisi <= 30 {
            let ekstra = ( GunSayisi - 20 ) * 160
            maas += ekstra
        }
        if GunSayisi < 20 {
            let eksikGun = 20 - GunSayisi
            let eksik = eksikGun * 80
            maas -= eksik
        }
        //Bir ayın 30 gün olduğu varsayılmıştır ve 30'un üzerindekiler bir sonraki aya aktarılmıştır.
        
        if GunSayisi > 30{
            if GunSayisi % 30 == 0 {
                let kacAy = GunSayisi / 30
                maas = 3200 * kacAy
                
            }else{
                let kacAy:Int = GunSayisi / 30
                let artıkGun = GunSayisi % 30
                let artı = soru6(GunSayisi: artıkGun)
                maas = 3200 * kacAy + artı
            }
        }
       
        return maas
    }
    
    func soru7(Kota:Double) -> Double{
        var ucret = 100.00
        if Kota >= 50.00{
            let ek = (Kota - 50.00) * 4.00
            ucret += ek
        }
        return ucret
    }
     
}

let o = Odev2()
o.soru1(derece: 12.0)
o.soru1(derece: 5)
o.soru2(kenar1: 20.5, kenar2: 30, kenar3: 50, kenar4: 10)
o.soru3(4)
o.soru3(1)
o.soru3(0)
o.soru3(5)
o.soru4(kelime:"Berenalp", karakter: "e")
o.soru4(kelime: "Nabersin, Nasılsın", karakter: "a")
o.soru5(kenarSayisi: 3)
o.soru6(GunSayisi: 34)
o.soru6(GunSayisi: 5)
o.soru6(GunSayisi: 26)
o.soru6(GunSayisi: 20)
o.soru6(GunSayisi: 30)
o.soru6(GunSayisi: 55)
o.soru7(Kota: 50.6)
o.soru7(Kota: 100)
o.soru7(Kota: 45)





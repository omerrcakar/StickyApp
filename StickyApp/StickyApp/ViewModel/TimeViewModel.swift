//
//  TimeViewModel.swift
//  StickyApp
//
//  Created by ÖMER  on 25.03.2025.
//

import Foundation
import Combine

// currentTime değişkenini her saniye güncelleyerek InfoView'a saati aktarmak.
// Foundation: DateFormatter ve Timer gibi temel sistem araçlarını içerir.
// Combine: @Published değişkenlerin otomatik olarak değişiklikleri View’a iletilmesini sağlar.


// ObservableObject: SwiftUI içinde @Published ile işaretlenmiş değişkenleri izlenebilir hale getirir.
// ObservableObject: @Published değişkenleri gözlemlenebilir hale getirir. View'lar bu değişiklikleri algılayıp kendini güncelleyebilir.

// @Published var currentTime: Bu değişken, anlık saat bilgisini içerir.
// Her güncellendiğinde InfoView otomatik olarak kendini yeniden çizer.


// private var timer: AnyCancellable?:
// Zamanlayıcı (Timer) kullanarak saati her saniye güncellemek için Combine'ın AnyCancellable özelliğini kullanıyoruz.
class TimeViewModel: ObservableObject {
    @Published var currentTime: String = ""
    private var timer: AnyCancellable?
    
    init(){
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink{ [weak self] _ in
                self?.updateTime()
                
            }
        updateTime()
    }
    
    // DateFormatter kullanarak Date()'den aldığı zamanı h:mm a formatında (12:45 PM gibi) biçimlendirir.
    
    // currentTime değişkeni güncellenir ve bu sayede InfoView içindeki Text(timerViewModel.currentTime) otomatik olarak yenilenir.
    private func updateTime(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a" // 12-hour format 
        currentTime = dateFormatter.string(from: Date())
    }
    
    
}


// Veri akışı şu şekilde gerçekleşir:
// InfoView açıldığında, TimeViewModel nesnesi oluşturulur.
// TimeViewModel içindeki Timer, her saniye updateTime() fonksiyonunu çalıştırır ve currentTime değişkenini günceller.
// @Published var currentTime değiştiğinde, SwiftUI otomatik olarak InfoView'ı günceller ve ekrandaki saat yenilenir.


// SwiftUI'da View’lar kendileri için saklanan özel bir State alanına sahipler.
// @StateObject, bu özel State alanında nesnenin referansını saklar.
// View yeniden oluşturulsa bile, saklanan StateObject aynı kalır.
// Ancak, @ObservedObject kullanırsanız, her seferinde yeni bir nesne oluşturulur.

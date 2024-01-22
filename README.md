# Push Notifications SwiftUI
![Swift](https://img.shields.io/badge/Swift-5.9%20%7C%205.8%20%7C%205.7-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS-red.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

SwitUI ile Push Notifications Console üzerinden bildirim göndermek için aşağıdaki 5 adımı takip edebilirsiniz.

## 1. Cihazın Token Bilgisini Öğrenmek

```swift
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // her bir byte'ı iki haneli onaltılık formata dönüştürür ve bu değerleri birleştirerek bir tek string'e çevirir.
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("Device Token: \(token)")
    }
}
```
## 2. UNUserNotificationCenter ile Kullanıcı Bildirim İzni

```swift
let center = UNUserNotificationCenter.current()

do {
    let success = try await center.requestAuthorization(options: [.alert, .badge, .sound])
    if success {
        UIApplication.shared.registerForRemoteNotifications()
        print("Push notification allowed by user")
    } else {
        print("Push notification not allowed by user")
    }
} catch {
    print("Error")
}
```

## 3. Xcode Push Notifications Capabilities
Xcode içerisinden, Push Notifications özelliğinin etkinleştirilmesi.

## 4. Certificates, IDs & Profiles Konfigürasyonu
Apple Developer Portal üzerinde development ve production ortamları için APN's oluşturulması.

## 5. CloudKit -> Push Notifications Console
CloudKit Dashboard üzerinde uygulamanızın bundle id’sini seçip bildirim mesajınızı token bilgisine göre cihaza gönderilmesi.

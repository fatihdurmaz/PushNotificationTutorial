//
//  ContentView.swift
//  PushNotificationTutorial
//
//  Created by Fatih Durmaz on 18.01.2024.
//

import SwiftUI
import Lottie
import StepperView

struct ContentView: View {
    let steps = [ Text("DeviceToken Üretmek").font(.title3),
                  Text("Kullanıcı İzni Almak").font(.title3),
                  Text("Xcode Push Notifications Capabilities").font(.title3),
                  Text("Sertifika Üretmek").font(.title3),
                  Text("Push Notifications Console ile Bildirim Göndermek").font(.title3)
    ]
    
    let indicationTypes: [StepperIndicationType] = [
        .custom(NumberedCircleView(text: "1", color: .black)),
        .custom(NumberedCircleView(text: "2", color: .black)),
        .custom(NumberedCircleView(text: "3", color: .black)),
        .custom(NumberedCircleView(text: "4", color: .black)),
        .custom(NumberedCircleView(text: "5", color: .black))
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                LottieView(animation: .named("push"))
                    .looping()
                Divider()
                StepperView()
                    .addSteps(steps)
                    .indicators(indicationTypes)
                    .stepIndicatorMode(StepperMode.vertical)
                    .lineOptions(StepperLineOptions.custom(1, Colors.black.rawValue))
                
                    .spacing(30)
                    .italic()
            }
            .onAppear{
                
                Task {
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
                }

            }
            .padding()
            .navigationTitle("Push Notifications")
        }
    }
}

#Preview {
    ContentView()
}

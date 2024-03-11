//
//  ContentView.swift
//  Survey
//
//  Created by 양문경 on 3/10/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("나를 맞춰봐")
                        .font(Font.custom("Jalnan2TTF", size: 50, relativeTo: .largeTitle))
                        .foregroundColor(.blue)
                    
                    Spacer()
                        .frame(height: 300)
                    
                    NavigationLink(destination: SurveyFisrt()) {
                        Text("시작하기")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}



#Preview {
    ContentView()
}

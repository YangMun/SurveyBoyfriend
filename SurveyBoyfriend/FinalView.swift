//
//  FinalView.swift
//  Survey
//
//  Created by 양문경 on 3/10/24.
//

import SwiftUI

struct FinalView: View {
    @State private var textFieldInput: String = ""

    var body: some View {
        ZStack{
            VStack {
                Text("Question 6")
                    .font(Font.custom("Jalnan2TTF", size: 30, relativeTo: .largeTitle))
                    .foregroundColor(.black) // 글자 색상 변경
                    .padding(50)
                
                TextField("지금까지 나왔던 문자들을 올바른 순서대로 나열", text: $textFieldInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .foregroundColor(.black)
                    .font(Font.custom("Jalnan2TTF", size: 15))
                    .background(Color.gray)
                
                // TextField 입력이 변경되었을 때, 특정 문자열이 입력되었는지 확인하고 해당 문자열이 있으면 (❤️) 표시
                if textFieldInput.contains("나의 세상을 아름답게 만들어 주어서 고마워요") {
                    Text("(❤️)")
                        .font(Font.custom("Jalnan2TTF", size: 50, relativeTo: .largeTitle))
                }
                
                Spacer()
                
                
                Button("감쟈합니다 이상입니다.") {
                    moveToNewScreen()
                }
                .font(Font.custom("Jalnan2TTF", size: 30, relativeTo: .largeTitle))
            }
        }
    }
}

func moveToNewScreen() {
    // SurveyTwo로 이동하는 코드 추가
    // NavigationLink를 통해 이동하는 방식을 사용할 수 있습니다
    // 여기서는 NavigationLink를 사용하지 않고, 대신 환경 객체를 통해 이동할 수 있는 방법을 사용하겠습니다.
    let surveyTwoView = ContentView()
    let surveyTwoHostingController = UIHostingController(rootView: surveyTwoView)
    UIApplication.shared.windows.first?.rootViewController = surveyTwoHostingController
    UIApplication.shared.windows.first?.makeKeyAndVisible()
}

#Preview {
    FinalView()
}

//
//  Survey.swift
//  Survey
//
//  Created by 양문경 on 3/10/24.
//

import SwiftUI

struct SurveySix: View {
    let Question_one = ["1살!", "3만살", "할 수 있겠죠..?", "31살"]
    
    @State private var selectedAnswerIndex: Int? = nil
    @State private var buttonBackgroundColors: [Color] = Array(repeating: .gray.opacity(0.2), count: 4)
    @State private var showAlert: Bool = false
    @State private var isCorrectAnswer: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Question 6")
                    .font(Font.custom("Jalnan2TTF", size: 30, relativeTo: .largeTitle))
                    .foregroundColor(.black) // 글자 색상 변경
                    .padding(50)
                Text("몇살에 결혼하고 싶을까요?")
                    .font(Font.custom("Jalnan2TTF", size: 30, relativeTo:.headline))
                    .foregroundColor(.black) // 글자 색상 변경
                    
                Spacer()
            }
            VStack {
                // for문으로 버튼 4개 생성
                ForEach(Question_one.indices, id: \.self) { index in
                    Button(action: {
                        self.selectedAnswerIndex = index
                        self.updateButtonBackgroundColors(index)
                        
                        // 버튼 클릭 후 1초 후에 정답 여부를 판단하는 팝업 창을 표시
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.showAlert = true
                            self.isCorrectAnswer = (self.Question_one[index] == "31살")
                            
                            // 오답이면 선택한 답 초기화
                            if !self.isCorrectAnswer {
                                self.resetSelectedAnswer()
                            }
                        }
                    }) {
                        Text(Question_one[index])
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity) // 너비를 최소 0, 최대 무한대로 설정하여 TextField와 같은 너비로 만듦
                            .background(self.buttonBackgroundColors[index])
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    }
                    .disabled(self.selectedAnswerIndex != nil && self.selectedAnswerIndex != index) // 선택된 경우 또는 이미 선택된 버튼을 비활성화
                    .opacity(self.selectedAnswerIndex == nil || self.selectedAnswerIndex == index ? 1 : 0.5) // 선택된 경우 투명도 조절
                }
            }
        }
        .alert(isPresented: $showAlert) {
            // 정답일 경우
            if isCorrectAnswer {
                return Alert(title: Text("정답"), message: Text("주어서"), dismissButton: .default(Text("확인"), action: {
                    // 확인 버튼을 누르면 새로운 UI로 이동
                    self.showAlert = false // 팝업창 닫기
                    // 이동할 새로운 UI 화면으로 네비게이션
                    self.moveToNewScreen()
                }))
            } else {
                return Alert(title: Text("오답"), message: Text("다른 것을 선택했어요!"), dismissButton: .default(Text("확인")))
            }

        }
    }
    
    func updateButtonBackgroundColors(_ index: Int) {
        self.buttonBackgroundColors = Array(repeating: .gray.opacity(0.2), count: 4) // 모든 버튼의 배경색을 초기화
        
        if Question_one[index] == "31살" {
            self.buttonBackgroundColors[index] = Color.green.opacity(0.5) // 경이 버튼의 배경색을 연두색으로 설정
        } else {
            self.buttonBackgroundColors[index] = Color.red.opacity(0.5) // 다른 버튼은 빨간색으로 설정
        }
    }
    
    func resetSelectedAnswer() {
        self.selectedAnswerIndex = nil
    }
    
    func moveToNewScreen() {
        // SurveyTwo로 이동하는 코드 추가
        // NavigationLink를 통해 이동하는 방식을 사용할 수 있습니다
        // 여기서는 NavigationLink를 사용하지 않고, 대신 환경 객체를 통해 이동할 수 있는 방법을 사용하겠습니다.
        let surveyTwoView = FinalView()
        let surveyTwoHostingController = UIHostingController(rootView: surveyTwoView)
        UIApplication.shared.windows.first?.rootViewController = surveyTwoHostingController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }

}



#Preview {
    SurveySix()
}

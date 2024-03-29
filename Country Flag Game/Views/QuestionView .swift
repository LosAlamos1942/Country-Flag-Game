//
//  QuestionView .swift
//  Country Flag Game
//
//  Created by Induran Aderinto  on 1/19/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizManager : QuizManager
    var body: some View {
        if quizManager.playingGame {
            VStack(spacing: 20) {
                HStack {
                    Text("Country Flag Game")
                        .foregroundColor(.yellow)
                        .fontWeight(.heavy)
                    Spacer()
                    Text("\(quizManager.index) out of \(quizManager.questions.count)")
                        .foregroundColor(.yellow)
                }
                ProgressBar(progress: quizManager.progress)
                VStack(spacing: 10) {
                    Text("Which Country Is This?")
                    Image(quizManager.country)
                        .resizable()
                        .frame(width: 300, height: 200)
                    ForEach(quizManager.answerChoices) { answer in
                        AnswerRow(answer: answer)
                            .environmentObject(quizManager)
                    }
                }
                Button {
                    quizManager.goToNextQuestion()
                } label: {
                    CustomButton(text: "Next Question", background: quizManager.answerSelected ? .yellow : .gray)
                }
                .disabled(!quizManager.answerSelected)
                Spacer()
            }
            .padding()
            .background(.cyan)
        }
        else {
            VStack(spacing: 20) {
                Text("Country Flag Game")
                    .font(.title)
                Text ("Congratulations! You have completed the quiz.")
                Text( "You scored \(quizManager.score) out of \(quizManager.questions.count)")
                Button {
                    quizManager.reset()
                } label: {
                    CustomButton(text: "Play Again")
                }
            }
            .foregroundColor(.yellow)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.cyan)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView().environmentObject(QuizManager())
    }
}

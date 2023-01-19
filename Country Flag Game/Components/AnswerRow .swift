//
//  AnswerRow .swift
//  Country Flag Game
//
//  Created by Induran Aderinto  on 1/19/23.
//

import SwiftUI

struct AnswerRow_: View {
    var answer: Answer
    @State private var isSelected = false
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.text)
            if isSelected {
                Spacer()
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? .green : .red)
                    .font(.title)
            }
        }
        .padding()
        .frame(width: 300, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? .green : .red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            isSelected = true
        }
    }
}
    
    struct AnswerRow__Previews: PreviewProvider {
        static var previews: some View {
            AnswerRow_(answer: Answer(text: "Test", isCorrect: true))
        }
    }


//
//  MessageRow.swift
//  GroupWorks
//
//  Created by 大島大和 on 2024/01/13.
//

import SwiftUI

struct MessageRow: View {
    var body: some View {
        HStack(alignment: .top) {
            userThumb
            messageText
            messageState
            Spacer()
        }
        .padding(.bottom)
    }
    
    private var formattedDataString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.string(from: Date())
        return formatter.string(from: Date())
    }
}

#Preview {
    MessageRow()
        .background(.cyan)
}


extension MessageRow {
    private var userThumb: some View {
        Image("user01")
            .resizable()//画像を変更可能にする
            .frame(width: 48, height: 48)//Imageのサイズを指定
            .clipShape(Circle())//円形にする
    }
    
    private var messageText: some View {
        Text("こんにちは")
            .padding()
            .background(.white)
            .cornerRadius(30)
    }
    
    private var messageState: some View {
        VStack(alignment: .trailing) {
            Spacer()
            Text("既読")
            Text(formattedDataString)
        }
        .foregroundColor(.secondary)
        .font(.footnote)
    }
}

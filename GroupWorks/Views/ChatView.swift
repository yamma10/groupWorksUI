//
//  ChatView.swift
//  GroupWorks
//
//  Created by 大島大和 on 2024/01/13.
//

import SwiftUI

struct ChatView: View {
    @State private var textFieldText: String = ""
    
    let vm: ChatViewModel = ChatViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            //メッセージをスクロールするのでscroll view を使う
            messageArea
            .overlay(
                navigationArea
                , alignment: .top //一番上に配置
            ) //scrollに覆い被さるようなレイアウト
            
            inputArea
        }
    }
}

#Preview {
    ChatView()
}


extension ChatView {
    
    private var messageArea: some View {
        
        
        return ScrollView {
            VStack(spacing: 0) {
                ForEach(vm.messages) { message in
                    MessageRow()
                }
            }
            .padding(.horizontal) //水平方向の間をあける
            .padding(.top, 72)
            
        }
        .background(.cyan)
    }
    
    private var inputArea: some View {
        HStack {
            HStack {
                Image(systemName: "plus")
                Image(systemName: "camera")
                Image(systemName: "photo")
            }
            .font(.title2)
            TextField("Aa", text: $textFieldText)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(Capsule())//角を丸くする
                .overlay(
                    Image(systemName: "face.smiling")
                        .font(.title2)
                        .padding()
                    , alignment: .trailing
                )
            Image(systemName: "mic")
                .font(.title2)
        }
        .padding()
        .background(.white)
    }
    
    private var navigationArea: some View {
        HStack {
            Image(systemName: "chevron.backward")
                .font(.title2)
            Text("Title")
                .font(.title2.bold())
            Spacer()//いっぱいに広げる
            HStack(spacing:16   ) {
                Image(systemName: "text.magnifyingglass")
                Image(systemName: "phone")
                Image(systemName: "line.3.horizontal")
            }
            .font(.title2)
        }
        .padding()
        .background(.cyan.opacity(0.9))
    }
}

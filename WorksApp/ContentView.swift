//
//  ContentView.swift
//  WorksApp
//
//  Created by 大島大和 on 2023/12/11.
//

import SwiftUI

struct ContentView: View {
    let screenSize = UIScreen.main.bounds.size
    @State private var employeeCode: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenSize.width * 0.8)//画面幅の80%
                .offset(x:0, y: -40)
            
            VStack {
                TextField("担当者コード", text: $employeeCode)
                    .frame(width: screenSize.width * 0.8,height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)//自動大文字入力　オフにする
                    .disableAutocorrection(true)
            }.padding(.vertical, 10)
            
            VStack {
                SecureField("パスワード", text: $password)
                    .frame(width: screenSize.width * 0.8, height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)//自動大文字入力　オフにする
                    .disableAutocorrection(true)
            }.padding(.vertical, 10)
            
            
            
                
            Button(action: {
                if employeeCode.isEmpty || password.isEmpty {
                    showAlert = true
                } else {
                    //ログイン処理
                }
            }) {
                Text("ログイン")
                    .frame(width: screenSize.width * 0.8)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding([.top], 30)
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("エラー"),
                message: Text("必要項目を入力してください"))
            }
        }
        
        
            
            
            
    }
}

#Preview {
    ContentView()
}

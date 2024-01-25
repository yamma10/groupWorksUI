import SwiftUI

struct TitleView: View {
    let screenSize = UIScreen.main.bounds.size
    @State private var account: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var showLoading = false
    
    
    
    var body: some View {
        
        var vm:TitleViewModel = TitleViewModel()
        
        ZStack {
            Color("Titlebackground").ignoresSafeArea(.all)
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenSize.width * 0.8)//画面幅の80%
                    .offset(x: 0, y: -40)
                
                TextField("アカウント名", text: $account)
                    .frame(width: screenSize.width * 0.8, height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .cornerRadius(4.0)
                
                SecureField("パスワード", text: $password)
                    .frame(width: screenSize.width * 0.8, height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .keyboardType(.numberPad)
                
                Button(action: {
                    if account.isEmpty || password.isEmpty {
                        showAlert = true
                    } else {
                        // ログイン処理
                        vm.login(account: account, password: password)
                        
                    }
                }) {
                    Text("ログイン")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: screenSize.width * 0.8)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("エラー"),
                          message: Text("必要項目を入力してください"))
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
#endif

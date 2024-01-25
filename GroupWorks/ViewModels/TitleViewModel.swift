//
//  TitleViewModel.swift
//  WorksApp
//
//  Created by 大島大和 on 2024/01/05.
//

import Foundation

class TitleViewModel: ObservableObject {
    func login(account: String, password: String) {
        
        guard let pass = Int(password) else {
//            responseMessage = "パスワードは数字で入力してください"
            return
        }
        // MARK: - json作る
        print("DEBUG code: \(account)")
        print("DEBUG password: \(password)")
        struct AuthInfo: Codable {
            let account: String
            let password: Int
        }
        
        let info = AuthInfo(account: account, password: pass)
        
        // MARK: - URLの作成
        
        guard let path = Bundle.main.path(forResource: "Settings", ofType: "plist") else {
            return
        }
        
        guard let settings = NSDictionary(contentsOfFile: path) as? [String: Any] else {
            return
        }
        
        guard let url = settings["url"] as? String else {
            return
        }
        
        //connectURLは共通のAPI通信先のURL
        let apiURL = url + "/users/login"
        
        print("DEBUG: \(apiURL)")
        //apiURLをURl型に変換する
        guard let url = URL(string: apiURL) else { return }
        //URLRequest型に変換
        var request = URLRequest(url: url)
        
        request.httpMethod = "Post"
        
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        
        
        // jsonDicをDataに変換
        do {
            request.httpBody = try JSONEncoder().encode(info)
        } catch {
            print("無効なデータ")
            print("DEBUG: \(info)")
        }
        
        print("ok")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print(error)
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse else {
                print("データがありません")
                return
            }
            
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    decoder.dataDecodingStrategy = .deferredToData
                    let json = try decoder.decode(User.self, from: data)
                } catch {
                    print(error)
                }
            }
            
        }
        task.resume()
    }
}

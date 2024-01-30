//
//  ChatViewModel.swift
//  GroupWorks
//
//  Created by 大島大和 on 2024/01/30.
//

import Foundation

class ChatViewModel {
    
    var chatData: [Chat] = []
    var messages: [Message] = []
    
    init() {
        chatData = fetchChatData()
        messages = chatData[0].messages
        
        print(messages)
    }
    
    // テスト
    private func fetchChatData() -> [Chat] {
        let fileName = "chatData.json"
        let data: Data
        
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: nil)  else {
            fatalError("\(fileName)が見つかりませんでした")
        }
        
        //tryが必要な場合、do catchで囲む必要がある
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            fatalError("\(fileName)のロードに失敗しました")
        }
        
        do {
            //JSONDecoderはJSONデータをデコードする際に使用する
            return try JSONDecoder().decode([Chat].self, from: data)
        } catch {
            fatalError("\(fileName)を\(Chat.self)に変換することに失敗しました")
        }
        
    }
}

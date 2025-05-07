//
//  GetMyInfoService.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/7/25.
//

import UIKit

 class GetMyInfoService {
    static let shared = GetMyInfoService()
     private init() {}
     
     func makeRequest(userId: Int) -> URLRequest? {
         var urlString = "http://api.atsopt-seminar4.site/api/v1/users/me"
         
         guard let url = URL(string: urlString) else { return nil }
         var request = URLRequest(url: url)
         request.httpMethod = "GET"
         request.setValue(String(userId), forHTTPHeaderField: "userId")
         return request
     }
     
     func fetchNickname(userId: Int) async throws -> String {
         guard let request = makeRequest(userId: userId) else {
             throw NetworkError.requestEncodingError
         }
         
         let (data, response) = try await URLSession.shared.data(for: request)
         dump(response)
         
         guard let httpResponse = response as? HTTPURLResponse, (200...209).contains(httpResponse.statusCode) else {
             throw NetworkError.responseError
         }
         
         do {
             let decoded = try JSONDecoder().decode(MyNicknameResponseWrapper.self, from: data)
             return decoded.data.nickname
         } catch {
             print("디코딩 실패:", error)
             throw NetworkError.responseDecodingError
         }
     }
}

//
//  GetInfoService.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/3/25.
//

import UIKit

final class GetInfoService {
    static let shared = GetInfoService()
    private init() {}
    
    func makeRequest(keyword: String?) -> URLRequest? {
        var urlString = "\(BASE_URL)v1/users"
        
        if let keyword = keyword, !keyword.isEmpty,
           let encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString += "?keyword=\(encoded)"
        }
        
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // optional
        return request
    }
    
    func fetchNicknameList(keyword: String?) async throws -> [String] {
        guard let request = makeRequest(keyword: keyword) else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        dump(response)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...209).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode(NicknameResponseWrapper.self, from: data)
            return decoded.data.nicknameList
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }
}

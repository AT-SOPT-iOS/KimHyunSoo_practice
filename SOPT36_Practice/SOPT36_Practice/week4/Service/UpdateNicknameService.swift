//
//  UpdateNicknameService.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/7/25.
//

import UIKit

class UpdateNicknameService {
    static let shared = UpdateNicknameService()
    private init() {}
    
    func makeRequestBody(nickname: String) -> Data? {
        do {
            let data = UpdateNicknameRequestBody(nickname: nickname)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(userId: Int, body: Data?) -> URLRequest? {
        let url = URL(string: "http://api.atsopt-seminar4.site/api/v1/users")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(userId), forHTTPHeaderField: "userId")
        
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
    
    func UpdateNicknameData(userId: Int, nickname: String) async throws -> UpdateNicknameResponseBody {
        guard let body = makeRequestBody(nickname: nickname) else {
            throw NetworkError.requestEncodingError
        }
        
        guard let request = makeRequest(userId: userId, body: body) else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        dump(response)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        dump(response)
        
        guard (200...209).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(UpdateNicknameResponseBody.self, from: data)
            return decoded
        } catch {
            throw error
        }
        
        func configureHTTPError(errorCode: Int) -> Error {
            return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
        }
    }
}

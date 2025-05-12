//
//  RegisterService.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/3/25.
//

import UIKit

class RegisterService {
    static let shared = RegisterService()
    private init() {}
    
    func makeRequestBody(loginId: String,
                         password: String,
                         nickname: String
    ) -> Data? {
        do {
            let data = RegisterRequestBody(
                loginId: loginId,
                password: password,
                nickname: nickname
            )
            let jsonEncoder = JSONEncoder()
            let reuqestBody = try jsonEncoder.encode(data)
            return reuqestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "\(BASE_URL)v1/auth/signup")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        return request
    }
    
    func PostRegisterData(loginId: String, password: String, nickname: String) async throws -> RegisterResponseBody {
        
        guard let body = makeRequestBody(loginId: loginId, password: password, nickname: nickname) else {
            throw NetworkError.responseError
        }
        
        let request = self.makeRequest(body: body)
        let (data, response) = try await URLSession.shared.data(for: request)
        dump(request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        dump(response)
        
        guard (200...209).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(RegisterResponseWrapper.self, from: data)
            return decoded.data
        } catch {
            throw error
        }
        
        func configureHTTPError(errorCode: Int) -> Error {
            return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
        }
    }
}

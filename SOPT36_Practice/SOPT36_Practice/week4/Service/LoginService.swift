//
//  LoginService.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/7/25.
//

import UIKit

class LoginService {
    static let shared = LoginService()
    private init() {}
    
    func makeRequestBody(loginId: String,
                         password: String
    ) -> Data? {
        do {
            let data = LoginRequestBody(
                loginId: loginId,
                password: password
            )
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "\(BASE_URL)v1/auth/signin")!
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
    
    func PostLoginData(loginId: String, password: String) async throws -> LoginResponseBody {
        guard let body = makeRequestBody(loginId: loginId, password: password) else {
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
            let decoded = try JSONDecoder().decode(LoginResponseWrapper.self, from: data)
            return decoded.data
        } catch {
            throw error
        }
        
        func configureHTTPError(errorCode: Int) -> Error {
            return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
        }
    }
}

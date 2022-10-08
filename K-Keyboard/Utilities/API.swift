//
//  API.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import Foundation

//TODO: 키보드 앱의 첫 화면이 원하는 듯한 "API 호출은 없으나 실제 API 호출을 한 것처럼 로직과 ui갱신을 타게 하기" 위해 dummy 값 처리
enum API {
    case weatherData(cityWeather)
    
    enum cityWeather {
        case cityName(name: String)
        case cityCoordination(lat: Double, lon: Double)
    }
    
    var urlComponets: URLComponents? {
        switch self {
        case .weatherData(_):
            var baseURLSet = baseURLSet
            baseURLSet?.queryItems = [appIDSet, langSet, unitSet] + getMethodQuerySet
            return baseURLSet
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .weatherData(.cityName(_)):
            return HTTPMethod.GET
        case .weatherData(.cityCoordination(_, _)):
            return HTTPMethod.GET
        }
    }
    
    private var baseURLSet: URLComponents? {
        get {
            return URLComponents(string: "https://api.openweathermap.org/data/2.5/weather")
        }
    }
    
    private var appIDSet: URLQueryItem {
        return URLQueryItem(name: "appid", value: "7f1a9a7368d6f22c077f8bef8d7a5200")
    }
    
    private var langSet: URLQueryItem {
        return URLQueryItem(name: "lang", value: "kr")
    }
    
    private var unitSet: URLQueryItem {
        return URLQueryItem(name: "units", value: "metric")
    }
    
    private var getMethodQuerySet: [URLQueryItem] {
        switch self {
        case .weatherData(.cityName(let name)):
            return [URLQueryItem(name: "q", value: name)]
        case .weatherData(.cityCoordination(lat: let lat, lon: let lon)):
            let latQuery = [URLQueryItem(name: "lat", value: String(lat))]
            let lonQuery = [URLQueryItem(name: "lon", value: String(lon))]
            return latQuery + lonQuery
        }
    }
}

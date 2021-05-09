//
//  UrlExtension.swift
//  iosUrlQuery
//
//  Created by chun yip wong on 9/5/2021.
//

import Foundation

public extension URL {
    var _protocol: String { get { return self.scheme != nil ? "\(self.scheme!):" : "" } }
    
    var _username: String { get { return self.user ?? "" } }
    
    var _password: String { get { return self.password ?? "" } }
    
    var _host: String { get {
            return "\(self.host ?? "")\(self.port != nil ? ":\(self.port!)" : "")"
    } }
    
    var _hostname: String { get { return self.host ?? "" } }
    
    var _port: String { get { return self.port != nil ? "\(self.port!)" : "" } }
    
    var _origin: String { get {
        return "\(self._protocol)//\(self._host)"
        }
    }
        
    var _pathname: String { get { return self.path } }
    
    var _search: String { get { return self.query ?? "" } }
    
    var _hash: String { get { return self.fragment != nil ? "#\(self.fragment!)" : "" } }
    
    var _href: String { get { return self.absoluteString } }
    
    func edit() -> UrlBuilder {
        return UrlBuilder(self)
    }
}

//
//  SHPartnerProtocol.swift
//  SHPartner
//
//  Created by Alexander v. Below on 04.04.18.
//  Copyright © 2018 Deutsche Telekom AG. All rights reserved.
//

import Foundation

protocol SHPartnerProtocol where Self:NSObject {
}

public class SHPartnerBase : NSObject, SHPartnerProtocol {
    
    @objc func supportedLanguages () -> [String] {
        
        var languages = [String]()
        
        let mybundle = Bundle(for: type(of: self))
        
        if let urls = mybundle.urls(forResourcesWithExtension: "lproj", subdirectory: nil) {
            for url in urls {
                let name = url.deletingPathExtension().lastPathComponent
                languages.append(name)
            }
        }
        // Add the default
        if languages.contains("en") == false {
            languages.append("en"   )
        }
        return languages
    }
}

//
//  NetworkController.swift
//  Codable_Demo
//
//  Created by Appinventiv on 22/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

class NetworkController {
    
    func getDetails( sucess: @escaping (codableStruct)->Void,failure: @escaping (String)->Void)
    {

        let headers = [
            "Cache-Control": "no-cache",
            "Postman-Token": "7087fabb-e8aa-4f6e-978d-c8e33dc9dcb1"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
       URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
       guard let data = data else { return }
        do {
            let decoder = JSONDecoder()
            let getData = try decoder.decode(codableStruct.self, from: data)
            

            print("in NC")
//            print(Detail)
            sucess(getData)
           }
        catch let err
           {
            print("Err", err)
            failure("\(err)")
           }
        }).resume()
    }

}

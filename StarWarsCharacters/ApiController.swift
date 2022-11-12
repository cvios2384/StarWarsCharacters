//
//  ApiController.swift
//  StarWarsCharacters
//
//  Created by user228909 on 11/11/22.
//

import Foundation
 

/*
 used to make call to get characters
 from star wars api
 arguments are the url and the page number
 */
func getDataFromAPI( page:Int, completionHandler: @escaping ([SWCharacter]) -> Void ){
   
    guard let url = URL(string: "https://swapi.dev/api/people/") else {
              return 
          }
          //GET request
          var request = URLRequest(url: url)
          request.httpMethod = "GET"
          
          let task = URLSession.shared.dataTask(with: request) {
              data, response, error in
              
              if let data = data {
                  //let str = String(data: data, encoding: .utf8)
                  let decoder = JSONDecoder()
                  
                  let respStr = NSString(data:data, encoding:NSASCIIStringEncoding)
                  print(respStr)
                  
                  do {
                      let parsedData =  try! decoder.decode(Result.self, from: data)
                     // print("Parsed Data :, \(parsedData)")
                      //self.albums = parsedData!
                       completionHandler(parsedData.results!)
                      completionHandler(parsedData.results! as! [SWCharacter])
                      
                  }catch {
                      print(error.localizedDescription)
                  }
                  
                  //print(str)
              }
              
          }
          
          task.resume()
    
   }

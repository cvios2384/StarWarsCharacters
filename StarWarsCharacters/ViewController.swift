//
//  ViewController.swift
//  StarWarsCharacters
//
//  Created by user228909 on 11/11/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{

    
    
    // holds the number of characters in the current page, usually ten
    var cellCount:Int = 10
    // holds the total number of records
    var totalCount: Int?
    
    
    // collection of star wars characters
    var characters:[SWCharacter] = []

    // table view for displaying star wars characters
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.dataSource = self
        tblView.delegate = self
         // make initial request for characters
        
        
      //  self.tblView.register(CharacterCell.self, forCellReuseIdentifier: "cell")
  //      DispatchQueue.main.async{
        getDataFromAPI(page: 0){
              swchars   in
            self.characters = swchars 
            DispatchQueue.main.async{
                self.tblView.reloadData()
            }
          
        }
       
        
        
        // change the height
        self.tblView.rowHeight = UITableView.automaticDimension
        self.tblView.estimatedRowHeight = 140
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get the right character for the index
        
      
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterCell
        if indexPath.row >= self.characters.count{
            return cell
        }
        let swCharacter = characters[indexPath.row]
        cell.lblName2!.text = swCharacter.name
        cell.lblEyeColor2!.text = swCharacter.eye_color

        
        return cell
        
    }
    

}


//
//  ViewController.swift
//  StarWarsCharacters
//
//  Created by user228909 on 11/11/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource{

    
    
    // holds the number of characters in the current page, usually ten
    var cellCount:Int = 0
    // holds the total number of records
    var totalCount: Int?
    
    
    // collection of star wars characters
    var characters:[ SWCharacter] = []

    // table view for displaying star wars characters
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.dataSource = self
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get the right character for the index
        let swCharacter = characters[indexPath.row]
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: <#T##IndexPath#>) as! CharacterCell
        cell.lblName.text = swCharacter.name
        cell.lblEyeColor.text = swCharacter.eyeColor
        cell.lblHairColor.text = swCharacter.hairColor
        
        // todo make api call to get homeworld from url
        cell.lblHomeworld.text = "tatooine"
        
        return cell
        <#code#>
    }
    

}


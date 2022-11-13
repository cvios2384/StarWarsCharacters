//
//  SWCharacterFilms.swift
//  StarWarsCharacters
//
//  Created by user228909 on 11/12/22.
//

import UIKit

class SWCharacterFilms: UIViewController {

    var character: SWCharacter?
    
    @IBOutlet weak var lblEyeColor: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblHairColor: UILabel!
    @IBOutlet weak var lblHomeworld: UILabel!
    @IBOutlet weak var lblFilms: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // initialize the views controls
        
        print(self.character!.name)
        
        // Setup the UI
        self.lblName.text = character?.name
        self.lblEyeColor.text = character?.eye_color
        self.lblHairColor.text = character?.hair_color
        self.lblHomeworld.text = character?.homeworld
        var films_str = formatFilms(films: self.character!.films!)
        self.lblFilms.text = formatFilms(films: self.character!.films!)
    }
    
    // output the films list as a string with linebreaks
    func formatFilms( films:[String]) -> String{
        var res = ""
        
        for film in films{
            res.append(film)
            res.append("\n")
            
        }
        return res
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  SearchRecipe
//
//  Created by user252925 on 3/26/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblRecipeName: UILabel!
    
    @IBOutlet weak var lblRecipeServing: UILabel!
    
    @IBOutlet weak var lblRecipeIngredients: UILabel!
    
    @IBOutlet weak var lblRecipeMethod: UILabel!
    
    @IBOutlet weak var lblRecipeRegion: UILabel!
    
    @IBOutlet weak var lblRecipeLength: UILabel!
    
    @IBOutlet weak var imgRecipeImage: UIImageView!
    
    @IBOutlet weak var swFav: UISwitch!
    
    @IBOutlet weak var scAreaOne: UIScrollView!
    
    @IBOutlet weak var scAreaTwo: UIScrollView!
    
    @IBOutlet weak var scAreaThree: UIScrollView!
    
    var segueRecipe = Recipe()
    
    var RecipeObjectArray = [Recipe()]
    
    var player: AVAudioPlayer!
    
    
    @IBAction func swFavValueChange(_ sender: Any) {
        if(swFav.isOn){
            UserDefaults.standard.set(lblRecipeName.text, forKey: "favorite")
        }
        else {
            UserDefaults.standard.set("", forKey: "favorite")
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        imgRecipeImage.alpha = 0
        lblRecipeIngredients.alpha = 0
        lblRecipeMethod.alpha = 0
        scAreaOne.alpha = 0
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        UIView.animate(withDuration: 3, animations: {
            self.imgRecipeImage.alpha = 1
            self.lblRecipeIngredients.alpha = 1
            self.lblRecipeMethod.alpha = 1
            self.scAreaOne.alpha = 1
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        populateArray()
        SetChicken()
        SetPasta()
        SetBeef()
        SetPork()
        SetRice()
    }
    
    func populateArray(){
        let r0 = Recipe()
        r0.RecipeFood = "Chicken"
        r0.RecipeName = "Parmesan Crusted Chicken"
        r0.RecipeServing = "4 people"
        r0.RecipeLength = "30 min"
        r0.RecipeIngredients = "4 half sliced chicken breast \n 1/4 cup of All-Purpose Flour \n 2 eggs \n 1/3 cup grated Parmesan cheese \n 2/3 cup Italian seasoned breadcrumb \n salt and pepper for seasoning \n 2 Tbls vegetable oil"
        r0.RecipeMethod = "1) Season the chicken breast with salt and pepper. \n 2) Using three separate bowls, one bowl has the flour, the second bowl has the beaten eggs, and the third bowl has the parmesan cheese and seasoned breadcrumbs. 3) For each chicken breast, dip them first on the flour and shaking excess flour off before dipping it into the beaten eggs. After shaking off excess eggs, place them on top of the breadcrumbs and coat them while pressing down on them hard to make the breadcrumbs stick. \n 4) Heat the vegetable oil on a flat pan on medium/high heat. \n 5) Place breaded chicken on the pan and let the chicken cook for about 3 minutes or until the first side is golden brown. Flip the chicken and cook until golden brown on the other side. \n 6) Check if chicken is cooked and serve with favorite side dishes."
        r0.RecipeImage = "parmchicken.jpeg"
        r0.RecipeRegion = "American/Italian"
        RecipeObjectArray.append(r0)
        
        let r1 = Recipe()
        r1.RecipeFood = "Pasta"
        r1.RecipeName = "Cacio e Pepe"
        r1.RecipeServing = "4 people"
        r1.RecipeLength = "30 min"
        r1.RecipeIngredients = "1 pound of pasta \n 1/2 cup reserved pasta water \n 1 stick unsalted butter \n 1 Tbls freshly cracked black pepper \n 4 oz grated Parmesan cheese or Pecorino Romano"
        r1.RecipeMethod = "1) In a large pot, bring 8 cups of water to a boil and season with 1 1/4 teaspoon of water. Place pasta in the water and cook until done, about 8-10 minutes. Reserved 1/2 cup of the pasta water for the sauce. \n 2) In a medium pot, melt butter and toast the black pepper until fragrant. \n 3) Add the reserved pasta water and let it simmer for a few minutes. \n 4) Add the cooked pasta in the pot and add the cheese. \n 5) Mix pasta until everything is corporated and season to taste with cheese, pepper, and salt. \n 6) Serve and enjoy."
        r1.RecipeImage = "cacioepepe.jpeg"
        r1.RecipeRegion = "Italy"
        RecipeObjectArray.append(r1)
        
        let r2 = Recipe()
        r2.RecipeFood = "Beef"
        r2.RecipeName = "Korean BBQ Beef"
        r2.RecipeServing = "4 people"
        r2.RecipeLength = "15 min"
        r2.RecipeIngredients = "1 1/2 pound sliced beef ribeye \n 1 head romaine lettuce \n 2 Tbls toasted sesame oil \n 1 tsp salt and pepper"
        r2.RecipeMethod = "1) To prep the romaine lettuce, cut the root end of the head off the lettuce. Remove the leaves one by one and wash them thoroughly to take out the dirt. Dry them by patting with paper towel. \n 2) In a medium pan, heat up vegetable oil and add the beef. Cook until fully cooked and desired crispiness. \n 3) On a small saucer, add the sesame oil, salt, and pepper. \n 4) To serve, dip the beef in sesame oil mixture, place it on top of romaine leaf, and enjoy."
        r2.RecipeImage = "kbbq.jpeg"
        r2.RecipeRegion = "South Korea"
        RecipeObjectArray.append(r2)
        
        let r3 = Recipe()
        r3.RecipeFood = "Pork"
        r3.RecipeName = "Pork Katsu"
        r3.RecipeServing = "4 people"
        r3.RecipeLength = "20 min"
        r3.RecipeIngredients = "4 pork loin filets \n 1/4 cup All-purpose flour \n 2 eggs \n 1/2 cup Japanese breadcrumbs \n as needed Kewpie Mayo \n as needed Katsu sauce \n 1 cup cooked rice"
        r3.RecipeMethod = "1) With a fork, punch holes onto the pork loins and season them with salt and pepper. \n 2) To bread them, dip them on the flour first, shake off excess and dip them on the egg. After shaking excess egg off, place on Japanese breadcrumbs and coat while pressing hard to make the breadcrumbs stick better. \n 3) On a medium sized pan, place enough oil to cover 1/3 of the pan and heat up on medium heat. \n 4) Once oil is heated, place the breaded pork loins in the oil and cook until golden brown, about 4-5 minutes. \n 5) Once golden brown, flip them and cook until fully cooked and golden brown. \n 6) To serve, cut pork katsu to slice, place on plate with a side of rice, and drizzle with mayo and katsu sauce."
        r3.RecipeImage = "tonkatsu.jpeg"
        r3.RecipeRegion = "Japan"
        RecipeObjectArray.append(r3)
        
        let r4 = Recipe()
        r4.RecipeFood = "Rice"
        r4.RecipeName = "Fried Rice"
        r4.RecipeServing = "4 people"
        r4.RecipeLength = "5 min"
        r4.RecipeIngredients = "2 cups day old rice \n 2 egg \n 1 1/2 Tbls soy sauce"
        r4.RecipeMethod = "1) On a medium sized pan, heat up 1 Tbls of vegetable oil. \n 2) Add the eggs and season with salt and pepper. Continously mix the egg until cooked. \n 3) Add the rice and cook until it is hot and toasty. \n 4) Pour in the soy sauce and cook until the smell of the soy sauce goes away. \n 5) Serve while hot."
        r4.RecipeImage = "friedrice.jpeg"
        r4.RecipeRegion = "Japan"
        RecipeObjectArray.append(r4)
    }
    
    @IBAction func btnChicken(_ sender: Any) {
        SetChicken()
        playSound()
        fadeIn()
    }
    
    @IBAction func btnPasta(_ sender: Any) {
        SetPasta()
        playSound()
        fadeIn()
    }
    
    
    @IBAction func btnBeef(_ sender: Any) {
        SetBeef()
        playSound()
        fadeIn()
    }
    
    
    @IBAction func btnPork(_ sender: Any) {
        SetPork()
        playSound()
        fadeIn()
    }
    
    
    @IBAction func btnRice(_ sender: Any) {
        SetRice()
        playSound()
        fadeIn()
    }
    
    func fadeIn(){
        imgRecipeImage.alpha = 0
        lblRecipeIngredients.alpha = 0
        lblRecipeMethod.alpha = 0
        scAreaOne.alpha = 0
            
        UIView.animate(withDuration: 3, animations: {
            self.imgRecipeImage.alpha = 1
            self.lblRecipeIngredients.alpha = 1
            self.lblRecipeMethod.alpha = 1
            self.scAreaOne.alpha = 1
        })
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "ping-82822", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
        
    }
    var rr = Recipe()
    
    func SetChicken(){
        
        var ChickenRecipe = RecipeObjectArray[1]
        ChickenRecipe = segueRecipe
        lblRecipeName.text = ChickenRecipe.RecipeName
        lblRecipeServing.text = ChickenRecipe.RecipeServing
        lblRecipeLength.text = ChickenRecipe.RecipeLength
        lblRecipeIngredients.text = ChickenRecipe.RecipeIngredients
        lblRecipeMethod.text = ChickenRecipe.RecipeMethod
        lblRecipeRegion.text = ChickenRecipe.RecipeRegion
        
        imgRecipeImage.image = UIImage(named: ChickenRecipe.RecipeImage)
        imgRecipeImage.layer.cornerRadius = 15
        imgRecipeImage.layer.borderColor = UIColor.darkGray.cgColor
        imgRecipeImage.contentMode = .scaleAspectFill
        
        // scAreaOne.layer.cornerRadius = 15
        // scAreaOne.layer.borderColor = UIColor.darkGray.cgColor
        // scAreaOne.layer.borderWidth = 5
        
        scAreaTwo.layer.cornerRadius = 15
        scAreaTwo.layer.borderColor = UIColor.darkGray.cgColor
        scAreaTwo.layer.borderWidth = 3
        
        scAreaThree.layer.cornerRadius = 15
        scAreaThree.layer.borderColor = UIColor.darkGray.cgColor
        scAreaThree.layer.borderWidth = 3
        
    }
    
    func SetPasta(){
        
        var PastaRecipe = RecipeObjectArray[2]
        PastaRecipe = segueRecipe
        lblRecipeName.text = PastaRecipe.RecipeName
        lblRecipeServing.text = PastaRecipe.RecipeServing
        lblRecipeLength.text = PastaRecipe.RecipeLength
        lblRecipeIngredients.text = PastaRecipe.RecipeIngredients
        lblRecipeMethod.text = PastaRecipe.RecipeMethod
        lblRecipeRegion.text = PastaRecipe.RecipeRegion
        
        imgRecipeImage.image = UIImage(named: PastaRecipe.RecipeImage)
        imgRecipeImage.layer.cornerRadius = 15
        imgRecipeImage.layer.borderColor = UIColor.darkGray.cgColor
        imgRecipeImage.contentMode = .scaleAspectFill
        
        // scAreaOne.layer.cornerRadius = 15
        // scAreaOne.layer.borderColor = UIColor.darkGray.cgColor
        // scAreaOne.layer.borderWidth = 5
        
        scAreaTwo.layer.cornerRadius = 15
        scAreaTwo.layer.borderColor = UIColor.darkGray.cgColor
        scAreaTwo.layer.borderWidth = 3
        
        scAreaThree.layer.cornerRadius = 15
        scAreaThree.layer.borderColor = UIColor.darkGray.cgColor
        scAreaThree.layer.borderWidth = 3
    }
    
    func SetBeef(){
        
        var BeefRecipe = RecipeObjectArray[3]
        BeefRecipe = segueRecipe
        lblRecipeName.text = BeefRecipe.RecipeName
        lblRecipeServing.text = BeefRecipe.RecipeServing
        lblRecipeLength.text = BeefRecipe.RecipeLength
        lblRecipeIngredients.text = BeefRecipe.RecipeIngredients
        lblRecipeMethod.text = BeefRecipe.RecipeMethod
        lblRecipeRegion.text = BeefRecipe.RecipeRegion
        
        imgRecipeImage.image = UIImage(named: BeefRecipe.RecipeImage)
        imgRecipeImage.layer.cornerRadius = 15
        imgRecipeImage.layer.borderColor = UIColor.darkGray.cgColor
        imgRecipeImage.contentMode = .scaleAspectFill
        
        // scAreaOne.layer.cornerRadius = 15
        //scAreaOne.layer.borderColor = UIColor.darkGray.cgColor
        //scAreaOne.layer.borderWidth = 5
        
        scAreaTwo.layer.cornerRadius = 15
        scAreaTwo.layer.borderColor = UIColor.darkGray.cgColor
        scAreaTwo.layer.borderWidth = 3
        
        scAreaThree.layer.cornerRadius = 15
        scAreaThree.layer.borderColor = UIColor.darkGray.cgColor
        scAreaThree.layer.borderWidth = 3
        
    }
    func SetPork(){
        
        var PorkRecipe = RecipeObjectArray[4]
        PorkRecipe = segueRecipe
        lblRecipeName.text = PorkRecipe.RecipeName
        lblRecipeServing.text = PorkRecipe.RecipeServing
        lblRecipeLength.text = PorkRecipe.RecipeLength
        lblRecipeIngredients.text = PorkRecipe.RecipeIngredients
        lblRecipeMethod.text = PorkRecipe.RecipeMethod
        lblRecipeRegion.text = PorkRecipe.RecipeRegion
        
        imgRecipeImage.image = UIImage(named: PorkRecipe.RecipeImage)
        imgRecipeImage.layer.cornerRadius = 15
        imgRecipeImage.layer.borderColor = UIColor.darkGray.cgColor
        imgRecipeImage.contentMode = .scaleAspectFill
        
        // scAreaOne.layer.cornerRadius = 15
        // scAreaOne.layer.borderColor = UIColor.darkGray.cgColor
        // scAreaOne.layer.borderWidth = 5
        
        scAreaTwo.layer.cornerRadius = 15
        scAreaTwo.layer.borderColor = UIColor.darkGray.cgColor
        scAreaTwo.layer.borderWidth = 3
        
        scAreaThree.layer.cornerRadius = 15
        scAreaThree.layer.borderColor = UIColor.darkGray.cgColor
        scAreaThree.layer.borderWidth = 3
    }
    
    func SetRice(){
        
        var RiceRecipe = RecipeObjectArray[5]
        RiceRecipe = segueRecipe
        lblRecipeName.text = RiceRecipe.RecipeName
        lblRecipeServing.text = RiceRecipe.RecipeServing
        lblRecipeLength.text = RiceRecipe.RecipeLength
        lblRecipeIngredients.text = RiceRecipe.RecipeIngredients
        lblRecipeMethod.text = RiceRecipe.RecipeMethod
        lblRecipeRegion.text = RiceRecipe.RecipeRegion
        
        imgRecipeImage.image = UIImage(named: RiceRecipe.RecipeImage)
        imgRecipeImage.layer.cornerRadius = 15
        imgRecipeImage.layer.borderColor = UIColor.darkGray.cgColor
        imgRecipeImage.contentMode = .scaleAspectFill
        
        // scAreaOne.layer.cornerRadius = 15
        // scAreaOne.layer.borderColor = UIColor.darkGray.cgColor
        // scAreaOne.layer.borderWidth = 5
        
        scAreaTwo.layer.cornerRadius = 15
        scAreaTwo.layer.borderColor = UIColor.darkGray.cgColor
        scAreaTwo.layer.borderWidth = 3
        
        scAreaThree.layer.cornerRadius = 15
        scAreaThree.layer.borderColor = UIColor.darkGray.cgColor
        scAreaThree.layer.borderWidth = 3
        
    }
    
}


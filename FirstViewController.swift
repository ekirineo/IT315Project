//
//  FirstViewController.swift
//  SearchRecipe
//
//  Created by user252925 on 5/2/24.
//

import Foundation
import UIKit

class FirstViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateArray()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var index = tableView.indexPathForSelectedRow
        var RecipeRow = RecipeObjectArray[index!.row]
        
        var destinationController = segue.destination as! ViewController
        
        destinationController.segueRecipe = RecipeRow
            

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return RecipeObjectArray.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let cellIndex = indexPath.row
        
        var RecipeRow = RecipeObjectArray[cellIndex]
        
        cell!.textLabel!.text = RecipeRow.RecipeFood
        
        
        return cell!
    }
    
    
    
    var RecipeObjectArray = [Recipe()]
    
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
}

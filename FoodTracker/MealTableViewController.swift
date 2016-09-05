//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by 钟 on 16/9/5.
//  Copyright © 2016年 Sean. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    //MARK: Properties
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load the sample data.
        loadSampleMeals()
    }
    
    func loadSampleMeals() {
        let photo1 = UIImage.init(named: "meal1")!
        let meal1 = Meal.init(name: "Caprese Salad", photo: photo1, rating: 4)!
        
        let photo2 = UIImage.init(named: "meal2")!
        let meal2 = Meal.init(name: "Chicken and Potatoes", photo: photo2, rating: 5)!
        
        let photo3 = UIImage.init(named: "meal3")!
        let meal3 = Meal.init(name: "Pasta with Meatballs", photo: photo3, rating: 3)!
        
        meals += [meal1, meal2, meal3]
    }
    
    //UITableViewDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MealTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceController = sender.sourceViewController as? MealViewController, meal = sourceController.meal {//if：1.向下转化，2.并且解包meal是否为nil
            // Add a new meal.
            let newIndexPath = NSIndexPath.init(forRow: meals.count, inSection: 0)
            //1.添加数据 2.插入cell
            meals.append(meal)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            
        }
    }

}

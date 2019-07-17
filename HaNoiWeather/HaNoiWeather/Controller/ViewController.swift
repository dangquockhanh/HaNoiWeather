//
//  ViewController.swift
//  HaNoiWeather
//
//  Created by Đặng Khánh  on 7/17/19.
//  Copyright © 2019 Đặng Khánh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var listWeather: HNWeather?

    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        setDataFromAPI()
    }
    
    func assignbackground(){
        let background = UIImage(named: "1")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }

    
    func setDataFromAPI() {
        DataService.sharedIntance.getWeather(completedHandle: {data in
            self.listWeather = data
            print(self.listWeather!)
            self.displayName()
            self.tableView.reloadData()
        })
    }
    
    func displayName() {
        nameLabel.text = (listWeather?.city.name)!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listWeather?.list.count == nil {
            return 0
        } else {
            return (listWeather?.list.count)!
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        //cell.dtLabel.text = String(Int((listWeather?.list[indexPath.row].dt.getDaysOfWeek())!))
        cell.dtLabel.text = listWeather?.list[indexPath.row].dt.getDaysOfWeek()
        //cell.mainLabel.text = listWeather?.list[indexPath.row].weather[0].main
        
        cell.mainLabel.text = listWeather?.list[indexPath.row].weather[0].main
        
        cell.descriptionLabel.text = listWeather?.list[indexPath.row].weather[0].description
        cell.minLabel.text = String(Int((listWeather?.list[indexPath.row].temp.min)!))
        cell.maxLabel.text = String(Int((listWeather?.list[indexPath.row].temp.max)!))
        
        return cell
    }

}


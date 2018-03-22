//
//  ViewController.swift
//  Codable_Demo
//
//  Created by Appinventiv on 22/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Detaillabel: UILabel!
    @IBOutlet weak var ActorDetailTableView: UITableView!
    var detailArray:codableStruct!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.subView()
       Detaillabel.layer.cornerRadius = 6
        Detaillabel.clipsToBounds = true
        
        NetworkController().getDetails(sucess: {
            (detail) in
            self.detailArray = detail
            DispatchQueue.main.async {
                self.ActorDetailTableView.reloadData()
            }
        })
           { (error) in
            print(error)
           }
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func subView()
    {
        ActorDetailTableView.delegate = self
        ActorDetailTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
     {
        return 120
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {  if(detailArray == nil){
        return 0
    }
        else {
        return (detailArray.actors!.count)
        
        }
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ActorDetailTableView.dequeueReusableCell(withIdentifier: "ActorDetailCell") as! ActorDetailCell
        
        cell.NameLabel.text = detailArray.actors![indexPath.row].name
        cell.CountryLabel.text = detailArray.actors![indexPath.row].country
        cell.DOBLabel.text = detailArray.actors![indexPath.row].dob

        if let url = self.detailArray.actors![indexPath.row].imageUrl
        {
            if let data = NSData(contentsOf: url as URL)
            {
                if let image = UIImage(data: data as Data)
                {
                    cell.ActorImageView.image = image
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row % 2 == 0 )
               {
                cell.backgroundColor = UIColor.white
                
               }
        else   {
                  cell.backgroundColor = UIColor.init(red: 84/255, green: 168/255, blue: 169/255, alpha: 1)
               }
        
        let transform  = CATransform3DTranslate(CATransform3DIdentity, -200, 10 ,2)
        cell.layer.transform = transform
        
        cell.alpha = 0.0
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
        cell.layer.shadowOpacity = 0.5

        UIView.animate(withDuration: 2.0) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
            
        }
    }
    
    
}

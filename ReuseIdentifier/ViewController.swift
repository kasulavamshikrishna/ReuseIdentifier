//
//  ViewController.swift
//  ReuseIdentifier
//
//  Created by Vamshi Krishna Kasula on 11/10/18.
//  Copyright © 2018 vamshios@yahoo.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var itemArray = [Model]()

    @IBAction func addButtonPressed(_ sender: Any) {

        var tf = UITextField()

        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)

        alert.addTextField { (alertTF) in

            alertTF.placeholder = "type item name here.."
            tf = alertTF

        }

        let action = UIAlertAction(title: "Add", style: .default) { (action) in

            let model = Model()
            model.title = tf.text!
            self.itemArray.append(model)
            self.tableView.reloadData()
        }

        alert.addAction(action)

        present(alert, animated: true, completion: nil)


    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let model = UIDevice.current.model
        var msg: String = ""
        msg = model == "iPhone" ?  "iphone is safe" : "ipad is safe"

        print(msg)

//        if model == "iPhone"{
//            print("you are running iphone device")
//        }else{
//            print("you are running ipad device")
//        }
//

        if #available(iOS 20, *){

            print("ios 20 is available now")

        }
        else{

            print("ios 20 is not yet available")

        }
//        var a = 5
//        let b = 20
//
//        repeat{
//            print("running while loop")
//            a += 1
//        }while a < b
//
//
//
//        let str = "hello world"
//        print("this string has \(str.count) characters..")




    }
    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return itemArray.count

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TVC", for: indexPath)

        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()

    }

}
//MARK: - Give outlets for tableviewcell
class TVC: UITableViewCell {
    
}

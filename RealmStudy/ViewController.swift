//
//  ViewController.swift
//  RealmStudy
//
//  Created by 中野翔太 on 2022/01/14.
//

import UIKit
import RealmSwift
class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        let UserDate = realm.objects(User.self)
        print("全てのデータ\(UserDate)")

    }
    @IBAction func didTapButton(_ sender: Any) {
        let user = User()
        try! realm.write({
            user.name = textField1.text ?? ""
            user.age = Int(textField2.text ?? "") ?? 0
            realm.add(user)
        })
        print(user)
        textField1.text = ""
        textField2.text = ""
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userDate = realm.objects(User.self)
        return userDate.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let userDate = realm.objects(User.self)
        cell.textLabel?.text = "\(userDate[indexPath.row].name)さん"
        cell.detailTextLabel?.text = "\(userDate[indexPath.row].age)歳"
        return cell
    }
    
}

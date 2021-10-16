//
//  AddUserView.swift
//  Calendar
//
//  Created by Daniil on 16.10.2021.
//

import UIKit

class AddUserView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var lastName = UITextField() // фамилия
    var name = UITextField() // имя
    var patronymic = UITextField() // отчество
    var birthDay = UITextField() //
    var attentionTableView = UITableView()
    let idCell = "attentionCell"
    let attentionLabel = UILabel()
    let done = UIButton()
    
    var scrollView = UIScrollView()
    let datePicker = UIDatePicker()
    
    let listAttention = [ "Беременность и период грудного вскармливания",
                         "Прогрессирующие заболевания нервной системы",
                         "Тяжелые формы аллергических реакций на аминогликозиды",
                          "Анафилактические реакции на яичный белок (кроме краснушной вакцины)",
                          "Аллергическая реакция на пекарские дрожжи",
                          "Тяжелые аллергические реакции в прошлом",
                          "Возраст до 18 лет",
                          "Системные заболевания соединительной ткани",
                          "Перенесенный бруцеллез в анамнезе",
                          "Беременность и период грудного вскармливания",
                          "Наличии злокачественных новообразований",
                          "Острая инфекция",
                         "Прогрессирующие иммунные",
                          "Расстройства любого типа",
                          "Продолжающаяся тяжелая форма заболевания" ]
    
    var sendToModel: [Int: String] = [Int : String]()
    @objc func setDate(_ sender: UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        birthDay.text = formatter.string(from: datePicker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        title = "Новый пользователь"
        navigationController?.navigationBar.backgroundColor = .white
        scrollView.frame = view.frame
        scrollView.backgroundColor = .systemGray5
        
        lastName.frame = CGRect(x: 10, y:  navigationController!.navigationBar.frame.height, width: self.view.frame.width - 20, height: self.view.frame.height / 10)
        lastName.layer.cornerRadius = lastName.frame.height / 10
        lastName.placeholder = "Фамилия"
        lastName.textAlignment = .center
        lastName.backgroundColor = .white
        
        name.frame = CGRect(x: 10, y: lastName.frame.height + lastName.frame.origin.y + lastName.frame.height / 4, width: lastName.frame.width, height: lastName.frame.height)
        name.layer.cornerRadius = lastName.layer.cornerRadius
        name.placeholder = "Имя"
        name.textAlignment = .center
        name.backgroundColor = .white
        
        patronymic.frame = CGRect(x: 10, y: name.frame.height + name.frame.origin.y + name.frame.height / 4, width: name.frame.width, height: name.frame.height)
        patronymic.layer.cornerRadius = name.layer.cornerRadius
        patronymic.placeholder = "Отчество"
        patronymic.textAlignment = .center
        patronymic.backgroundColor = .white
        
        birthDay.frame = CGRect(x: 10, y: patronymic.frame.height + patronymic.frame.origin.y + patronymic.frame.height / 4, width: patronymic.frame.width, height: patronymic.frame.height)
        birthDay.layer.cornerRadius = patronymic.layer.cornerRadius
        birthDay.placeholder = "Дата рождения"
        birthDay.textAlignment = .center
        birthDay.inputView = datePicker
        birthDay.backgroundColor = .white
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(setDate(_:)), for: .valueChanged)
        
        
        attentionLabel.frame = CGRect(x: 10, y: birthDay.frame.height + birthDay.frame.origin.y + birthDay.frame.height / 4, width: birthDay.frame.width, height: birthDay.frame.height)
        attentionLabel.text = "Примечания"
        attentionLabel.backgroundColor = .systemGray5
        attentionLabel.textColor = .black
        attentionLabel.textAlignment = .center
        //        attentionLabel.layer.borderWidth = 10
        //        attentionLabel.layer.borderColor = CGColor(red: 5, green: 5, blue: 5, alpha: 1)
        attentionLabel.layer.cornerRadius = birthDay.layer.cornerRadius
        
        attentionTableView.delegate = self
        attentionTableView.dataSource = self
        attentionTableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        //        attention = UITableView(frame: view.frame, style: .insetGrouped)
        attentionTableView.frame = CGRect(x: 10, y: attentionLabel.frame.height + attentionLabel.frame.origin.y + attentionLabel.frame.height / 4, width: attentionLabel.frame.width, height: attentionLabel.frame.height * 3)
        attentionTableView.backgroundColor = .systemGray5
        
        
        done.frame = CGRect(x: 10, y: attentionTableView.frame.height + attentionTableView.frame.origin.y + attentionTableView.frame.height / 4, width: attentionTableView.frame.width, height: attentionTableView.frame.height / 3)
        done.setTitle("Добавить пользователя", for: .normal)
        done.backgroundColor = .systemBlue
        done.titleLabel?.textAlignment = .center
        
        
        
        
        
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: lastName.frame.height * 20)
        
        scrollView.addSubview(lastName)
        scrollView.addSubview(name)
        scrollView.addSubview(patronymic)
        scrollView.addSubview(birthDay)
        scrollView.addSubview(attentionLabel)
        scrollView.addSubview(attentionTableView)
        scrollView.addSubview(done)
        
        view.addSubview(scrollView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listAttention.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        cell.textLabel?.text = listAttention[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        
        
//        if cell.backgroundColor == .systemGreen
//        {
//            cell.backgroundColor = .systemGreen
//        }
//        else
//        {
//            cell.backgroundColor = .white
//        }
        
        if sendToModel.keys.contains(indexPath.row)
        {
            cell.backgroundColor = .systemGreen
        }
        else
        {
            cell.backgroundColor = .white
        }
        
        //        cell.layer.cornerRadius = cell.frame.height / 10
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.backgroundColor == .white
        {
            cell?.backgroundColor = .systemGreen
            sendToModel[indexPath.row] = cell?.textLabel?.text
        }
        else
        {
            cell?.backgroundColor = .white
            sendToModel.removeValue(forKey: indexPath.row)
        }
    }
}

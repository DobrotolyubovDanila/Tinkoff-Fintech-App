//
//  ConversationsListViewController.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 30.09.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

class ConversationsListViewController: UITableViewController {
    
    var cellsOnline: [ConversationCellModel] = []
    var cellsOffline:[ConversationCellModel] = []
    
    var conversationCells: [ConversationCellModel] = [
        ConversationCellModel(name: "Igor", message: "GO v fifu", date: Date(timeIntervalSinceNow: -900), isOnline: true, hasUnreadMessage: false),
        ConversationCellModel(name: "Арья Старк", message: "Я никто", date: Date(timeIntervalSinceNow: -90), isOnline: false, hasUnreadMessage: false),
        ConversationCellModel(name: "Джон сноу", message: "Зима близко", date: Date(timeIntervalSinceNow: 0), isOnline: true, hasUnreadMessage: true),
        ConversationCellModel(name: "Анна Ивановна", message: "Выучи уроки, дружок, иначе я тебя исключу из школы", date: Date(timeIntervalSinceNow: -780900), isOnline: false, hasUnreadMessage: true),
        ConversationCellModel(name: "Роб Старк", message: "Как ваше ничего ?", date: Date(timeIntervalSinceNow: -70), isOnline: true, hasUnreadMessage: true),
        ConversationCellModel(name: "Тони старк", message: "Я – Железный Человек", date: Date(timeIntervalSinceNow: -489900), isOnline: true, hasUnreadMessage: false),
        ConversationCellModel(name: "Тони Рамбола", message: "Барабан сломал", date: Date(timeIntervalSinceNow: -200), isOnline: false, hasUnreadMessage: true),
        ConversationCellModel(name: "Сергей Шнуров", message: nil, date: Date(timeIntervalSinceNow: -800), isOnline: true, hasUnreadMessage: false),
        ConversationCellModel(name: "Арагорн из Араторна", message: "Поднять Щиты!", date: Date(timeIntervalSinceNow: -9000), isOnline: false, hasUnreadMessage: false),
        ConversationCellModel(name: "Пикабу Фан", message: "ДУра оНа ТуПАЯ", date: Date(timeIntervalSinceNow: -4), isOnline: true, hasUnreadMessage: false),
        ConversationCellModel(name: "Даня Иванов", message: "Дай списать", date: Date(timeIntervalSinceNow: -600), isOnline: false, hasUnreadMessage: false),
        ConversationCellModel(name: "Рома Игорев", message: "Есть идея по бизнесу", date: Date(timeIntervalSinceNow: -100000), isOnline: true, hasUnreadMessage: true),
        ConversationCellModel(name: "Иван Гордеев", message: "Идешь гулять?", date: Date(timeIntervalSinceNow: 0), isOnline: true, hasUnreadMessage: true),
        ConversationCellModel(name: "Олег Тиньков", message: "Верни деньги!", date: Date(timeIntervalSinceNow: 0), isOnline: true, hasUnreadMessage: true),
        ConversationCellModel(name: "Оксана", message: nil, date: Date(timeIntervalSinceNow: -1000), isOnline: true, hasUnreadMessage: false),
        ConversationCellModel(name: "Google", message: nil, date: Date(timeIntervalSinceNow: -100), isOnline: false, hasUnreadMessage: false),
        ConversationCellModel(name: "Ремонт", message: nil, date: Date(timeIntervalSinceNow: -900), isOnline: false, hasUnreadMessage: true),
        ConversationCellModel(name: "Юля", message: "NOW OR NEWER", date: Date(timeIntervalSinceNow: -10050), isOnline: false, hasUnreadMessage: false),
        ConversationCellModel(name: "Оксана", message: "Hi!", date: Date(timeIntervalSinceNow: -10100), isOnline: false, hasUnreadMessage: false),
        ConversationCellModel(name: "Joom", message: nil, date: Date(timeIntervalSinceNow: -10100), isOnline: false, hasUnreadMessage: false)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conversationCells.sort { (item1, item2) -> Bool in
            item1.date > item2.date
        }
        
        cellsOnline = conversationCells.filter { $0.isOnline }
        cellsOffline = conversationCells.filter { !$0.isOnline }
        
//        profileButton.image = profileImage
        
    }
    
    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return cellsOnline.count
        }
        if section == 1 {
            return cellsOffline.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 { return "Online" }
        if section == 1 { return "History" }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatOnlineCell", for: indexPath) as! ChatDescriptionCell
            
            let isToday = calendar.isDateInToday(cellsOnline[indexPath.row].date)
            dateFormatter.dateFormat = isToday ? "HH:mm ›" : "dd.MMM ›"
            
            let dateString = dateFormatter.string(from: cellsOnline[indexPath.row].date)
            
            cell.nameLabel.text = cellsOnline[indexPath.row].name
            cell.messageLabel.text = cellsOnline[indexPath.row].message ?? "No messages yet"
            cell.dateLabel.text = dateString
            cell.avatarImageView.layer.cornerRadius = cell.avatarImageView.frame.height/2
            
            if cellsOnline[indexPath.row].hasUnreadMessage {
                cell.messageLabel.font = UIFont(name: "HelveticaNeue-Medium", size: cell.messageLabel.font.pointSize)
            } else {
                cell.messageLabel.font = UIFont(name: "HelveticaNeue", size: cell.messageLabel.font.pointSize)
            }
            
            cell.backgroundColor = #colorLiteral(red: 0.8905867934, green: 0.9076064229, blue: 0.1654500663, alpha: 0.06264378834)
            
            
            
            return cell
        }
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatOfflineCell", for: indexPath) as! ChatDescriptionCell
            
            let isToday = calendar.isDateInToday(cellsOffline[indexPath.row].date)
            dateFormatter.dateFormat = isToday ? "HH:mm ›" : "dd.MMM ›"
            
            let dateString = dateFormatter.string(from: cellsOffline[indexPath.row].date)
            
            
            cell.nameLabel.text = cellsOffline[indexPath.row].name
            cell.messageLabel.text = cellsOffline[indexPath.row].message ?? "No messages yet"
            cell.dateLabel.text = dateString
            cell.avatarImageView.layer.cornerRadius = cell.avatarImageView.frame.height/2
            
            if cellsOffline[indexPath.row].hasUnreadMessage {
                cell.messageLabel.font = UIFont(name: "HelveticaNeue-Medium", size: cell.messageLabel.font.pointSize)
            } else {
                cell.messageLabel.font = UIFont(name: "HelveticaNeue", size: cell.messageLabel.font.pointSize)
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    @IBAction func profileButtonTapped(_ sender: UIBarButtonItem) {
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let nProfileController: UINavigationController = profileStoryboard.instantiateViewController(withIdentifier: "profileNC") as! UINavigationController
        
        self.present(nProfileController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let title = (tableView.cellForRow(at: indexPath) as! ChatDescriptionCell).nameLabel.text
        
        let storyboard = UIStoryboard(name: "ConversationStoryboard", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "conversationNC") as! UINavigationController
        let conversationViewController = navigationController.topViewController as! ConversationViewController
        
        self.navigationController?.pushViewController(conversationViewController, animated: true)
        
        conversationViewController.title = title
        
        if let message = (tableView.cellForRow(at: indexPath) as! ChatDescriptionCell).messageLabel.text  {
            if message != "No messages yet"{
            conversationViewController.testArray.append(MessageCellMode(text: message, isIncoming: true))
            }
        }
    }
    
    @IBAction func  unwindFromProfileVC(_ sender: UIStoryboardSegue){
        // метод для передачи данных между vc в будущем.
    }
    
}

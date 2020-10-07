//
//  ConversationsListViewController.swift
//  Tinkoff Fintech App
//
//  Created by Данила on 30.09.2020.
//  Copyright © 2020 Dobrotolyubov Danila. All rights reserved.
//

import UIKit

class ConversationsListViewController: UITableViewController {
    
    var profileImage: UIImage?
    
    @IBOutlet weak var profileAvatarView: ProfileAvatarView!
    
    var conversationCellsContent: [ConversationCellModel] = [
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
        
        profileAvatarView.setImage(image: profileImage)
        
        conversationCellsContent.sort { (item1, item2) -> Bool in
            return item1.date > item2.date
        }
        
        conversationCellsContent = conversationCellsContent.filter { $0.isOnline } + conversationCellsContent.filter { !$0.isOnline }
        
        updateInterfaceWithoutReloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        profileAvatarView.setCornerRadius(cornerRadius: profileAvatarView.frame.height/2)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversationCellsContent.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if conversationCellsContent[indexPath.row].isOnline {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatOnlineCell", for: indexPath) as! ChatOnlineCell
            
            cell.configCellContent(conversationCellsContent[indexPath.row])
            cell.configOnlineIndicator()
            cell.configWithTheme()
            
            return cell
        }
        
        if !conversationCellsContent[indexPath.row].isOnline {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatOfflineCell", for: indexPath) as! ChatOfflineCell
            
            cell.configCellContent(conversationCellsContent[indexPath.row])
            cell.configColorTheme()
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var title = (tableView.cellForRow(at: indexPath) as? ChatOnlineCell)?.nameLabel.text
        
        if title == nil {
            title = (tableView.cellForRow(at: indexPath) as? ChatOfflineCell)?.nameLabel.text
        }
        
        let storyboard = UIStoryboard(name: "ConversationStoryboard", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "conversationNC") as! UINavigationController
        let conversationViewController = navigationController.topViewController as! ConversationViewController
        
        self.navigationController?.pushViewController(conversationViewController, animated: true)
        
        conversationViewController.title = title
        
        if let message = (tableView.cellForRow(at: indexPath) as? ChatOnlineCell)?.messageLabel.text,
           message != "No messages yet" {
            conversationViewController.testArray.append(MessageCellMode(text: message, isIncoming: true))
        }
        
        if let message = (tableView.cellForRow(at: indexPath) as? ChatOfflineCell)?.messageLabel.text,
           message != "No messages yet" {
            conversationViewController.testArray.append(MessageCellMode(text: message, isIncoming: true))
        }
    }
    
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let nProfileController: UINavigationController = profileStoryboard.instantiateViewController(withIdentifier: "profileNC") as! UINavigationController
        if let pvc = nProfileController.topViewController as? ProfileViewController {
            if let image = profileAvatarView.profileImageView.image {
                pvc.profileImage = image
            }
            pvc.profileImageDelegate = self
        }
        self.present(nProfileController, animated: true, completion: nil)
    }
    
    
    @IBAction func  unwindFromProfileVC(_ sender: UIStoryboardSegue){
        
        if let pvc = sender.source as? ProfileViewController, let _ = sender.destination as? ConversationsListViewController {
            
            if let image = pvc.profileAvatarView.profileImageView.image {
                
                profileAvatarView.setImage(image: image)
            }
        }
    }
    
    
    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "ThemesViewController", bundle: nil)
        
        let navigationVC = storyboard.instantiateViewController(withIdentifier: "navigationVC") as! UINavigationController
        
        let themesViewController = navigationVC.topViewController as! ThemesViewController
        
        self.navigationController?.pushViewController(themesViewController, animated: true)
        themesViewController.title = "Settings"
        themesViewController.conversationListDelegate = self
        
        // MARK: - Closure
        // Повторил код обновления интерфейса вручную для наглядности
        themesViewController.closure = { [weak self] in
            self?.tableView.backgroundColor = ThemeManager.shared.current.backgroundColor
            
            self?.navigationController?.navigationBar.tintColor = ThemeManager.shared.current.tintColor
            self?.navigationController?.navigationBar.barTintColor = ThemeManager.shared.current.backgroundColor
            
            self?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeManager.shared.current.mainTextColor]
            self?.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeManager.shared.current.mainTextColor]
            self?.tableView.reloadData()
        }
    }
}

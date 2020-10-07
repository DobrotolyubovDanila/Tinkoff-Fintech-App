
import UIKit
    

class ConversationViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var testArray:[MessageCellMode] = [
        MessageCellMode(text: "Алло! Добрый день, Ник. Как наши дела?", isIncoming: false),
        MessageCellMode(text: "Вроде бы все по плану… Материалы по Навальному готовы. Будут переданы в администрацию канцлера. Ожидаем ее заявления.", isIncoming: true),
        MessageCellMode(text: "Отравление подтверждается точно?", isIncoming: false),
        MessageCellMode(text: "Послушай, Майк, в данном случае это не так важно… Идет война… А во время войны всякие методы хороши.", isIncoming: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.keyboardDismissMode = .interactive
        tableView.allowsSelection = false
        
        tableView.backgroundColor = ThemeManager.shared.current.backgroundColor
    }
}

extension ConversationViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if testArray[indexPath.row].isIncoming == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "receivedMessageCell") as! ConversationCell
            
            cell.label.text = testArray[indexPath.row].text
            cell.view.layer.cornerRadius = 20
            cell.view.backgroundColor = ThemeManager.shared.current.incomeMessagesBackgroundColor
            cell.backgroundColor = ThemeManager.shared.current.backgroundColor
            cell.label.textColor = ThemeManager.shared.current.incomeMessagesTextColor
            
            return cell
        }
        
        if testArray[indexPath.row].isIncoming == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sendMessegesCell") as! ConversationCell
            
            cell.label.text = testArray[indexPath.row].text
            cell.view.layer.cornerRadius = 20
            cell.view.backgroundColor = ThemeManager.shared.current.sendedMessagesBackgroundColor
            cell.backgroundColor = ThemeManager.shared.current.backgroundColor
            cell.label.textColor = ThemeManager.shared.current.sendedMessagesTextColor
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

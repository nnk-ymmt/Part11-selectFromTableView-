//
//  SelectionViewController.swift
//  Part11-selectFromTableView-
//
//  Created by 山本ののか on 2020/12/10.
//

import UIKit

final class SelectionViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: "TableViewCell")
            tableView.isHidden = true
        }
    }

    private let prefectures = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県",
                           "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県",
                           "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府",
                           "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県",
                           "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県",
                           "鹿児島県", "沖縄県"]
    private(set) var selectedPrefecture: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        tableView.isHidden = false
    }
}

extension SelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.configure(title: prefectures[indexPath.row])
        return cell
    }
}

extension SelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPrefecture = prefectures[indexPath.row]
        performSegue(withIdentifier: "exit", sender: nil)
    }
}



// 改善点

// dismissはその画面を表示した親VCが行うべき、もしくはunwind segueを使う
// 根拠 https://developer.apple.com/documentation/uikit/uiviewcontroller/1621505-dismiss
// もしくは閉じるボタンの挙動をクロージャで注入する事もある
// 画面遷移がModalからPushに変わっても、遷移先の画面のコードを一切変更しなくて済むのがメリット
//class FirstViewController: UIViewController {
//    @IBAction func didTap() {
//        let secondVC = SecondViewController(
//            closeButtonHandler: { [weak self] in
//                self?.dismiss(animated: true, completion: nil)
//            }
//        )
//        present(secondVC, animated: true, completion: nil)
//    }
//}
//
//class SecondViewController: UIViewController {
//    private let closeButtonHandler: () -> Void
//    init(closeButtonHandler: @escaping () -> Void) {
//        self.closeButtonHandler = closeButtonHandler
//        super.init(nibName: nil, bundle: nil)
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    @IBAction func didTapCloseButton() {
//        closeButtonHandler()
//    }
//}
//
//class FirstViewController: UIViewController {
//    @IBAction func didTap() {
//        let secondVC = SecondViewController(
//            closeButtonHandler: { [weak self] in
//                self?.navigationController?.popViewController(animated: true)
//            }
//        )
//        navigationController?.pushViewController(secondVC, animated: true)
//    }
//}

// 解答例

//struct Prefecture {
//    private let prefectureDatas = ["北海道", "青森県", "岩手県", "宮城県", "秋田県","山形県", "福島県", "茨城県", "栃木県", "群馬県","埼玉県", "千葉県", "東京都", "神奈川県","新潟県","富山県", "石川県", "福井県", "山梨県", "長野県","岐阜県", "静岡県", "愛知県", "三重県","滋賀県","京都府", "大阪府", "兵庫県", "奈良県", "和歌山県","鳥取県", "島根県", "岡山県", "広島県", "山口県","徳島県", "香川県", "愛媛県", "高知県", "福岡県","佐賀県", "長崎県", "熊本県", "大分県", "宮崎県","鹿児島県", "沖縄県"]
//    var prefectureCount: Int {
//        prefectureDatas.count
//    }
//    func getPrefectureName(indexPath: IndexPath) -> String {
//        prefectureDatas[indexPath.row]
//    }
//}

// TableViewCellで
//static let reuseIdentifier = "TableViewCell"
//static func loadNib() -> UINib {
//    return UINib(nibName: reuseIdentifier, bundle: nil)
//}

// SelectionVCで
//private let segueIdentifier = "exit"
//
//@IBOutlet weak var tableView: UITableView! {
//    didSet {
//        tableView.register(TableViewCell.loadNib(), forCellReuseIdentifier: TableViewCell.reuseIdentifier)
//    }
//}
//
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else {
//        return UITableViewCell()
//    }
//    cell.configure(name: prefectures[indexPath.row])
//    return cell
//}
//
//func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    tableView.deselectRow(at: indexPath, animated: true) // 選択解除
//    selectedPrefecture = prefectures[indexPath.row]
//    performSegue(withIdentifier: segueIdentifier, sender: nil)
//}

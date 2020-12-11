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

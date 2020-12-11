//
//  ViewController.swift
//  Part11-selectFromTableView-
//
//  Created by 山本ののか on 2020/12/10.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var prefectureLabel: UILabel!

    @IBAction private func exit(segue: UIStoryboardSegue) {
        guard let selectionVC = segue.source as? SelectionViewController else { return }
        prefectureLabel.text = selectionVC.selectedPrefecture ?? "未選択"
    }

    @IBAction private func exitByCancel(segue: UIStoryboardSegue) {
    }
}

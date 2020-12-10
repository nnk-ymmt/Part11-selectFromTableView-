//
//  TableViewCell.swift
//  Part11-selectFromTableView-
//
//  Created by 山本ののか on 2020/12/10.
//

import UIKit

final class TableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }

    func configure(title: String) {
        titleLabel.text = title
    }
}

//
//  CategoryView.swift
//  Memo
//
//  Created by mincheol on 2022/12/24.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit

final class CategoryView: UIView {
    
    // MARK: UIProperties
    
    private let container = UIView().then {
        let color: CGFloat = 245 / 255
        $0.backgroundColor = .init(red: color, green: color, blue: color, alpha: 1)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "분류"
        $0.font = .systemFont(ofSize: 12)
    }
    
    private let button = UIButton()
    
    private let imageView = UIImageView().then {
        $0.image = UIImage.init(named: "right_arrow")
    }
    
    private let contentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.text = "책"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureUI()
        self.setUpConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.addSubview(self.container)
        [
            self.titleLabel,
            self.button
        ]
            .forEach {
                self.container.addSubview($0)
            }
        
        [
            self.imageView,
            self.contentLabel
        ]
            .forEach {
                self.button.addSubview($0)
            }
    }
    
    private func setUpConstraints() {
        self.container.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(50)
        }
        self.titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
        }
        self.button.snp.makeConstraints {
            $0.top.right.bottom.equalToSuperview()
            $0.left.equalTo(titleLabel.snp.right).offset(30)
        }
        self.imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(20)
            $0.size.equalTo(12)
        }
        self.contentLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(self.imageView.snp.left).offset(-10)
        }
    }
}

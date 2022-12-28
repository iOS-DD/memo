//
//  AuthorView.swift
//  Memo
//
//  Created by mincheol on 2022/12/24.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit

final class AuthorView: UIView {
    
    // MARK: UIProperties
    
    private let container = UIView().then {
        let color: CGFloat = 245 / 255
        $0.backgroundColor = .init(red: color, green: color, blue: color, alpha: 1)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "저자"
        $0.font = .systemFont(ofSize: 12)
    }
    
    private let textField = UITextField().then {
        $0.placeholder = "인물명을 입력해주세요."
        $0.font = .systemFont(ofSize: 12)
        $0.textAlignment = .right
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
            self.textField
        ]
            .forEach {
                self.container.addSubview($0)
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
        self.textField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.equalToSuperview().inset(20)
            $0.left.equalTo(self.titleLabel.snp.right).offset(10)
        }
    }
}


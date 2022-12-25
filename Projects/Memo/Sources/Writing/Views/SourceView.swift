//
//  SourceView.swift
//  Memo
//
//  Created by mincheol on 2022/12/24.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit

final class SourceView: UIView {
    
    // MARK: UIProperties
    
    private let container = UIView().then {
        let color: CGFloat = 245 / 255
        $0.backgroundColor = .init(red: color, green: color, blue: color, alpha: 1)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "출처"
        $0.font = .systemFont(ofSize: 12)
    }
    
    private let searchButton = UIButton().then {
        let image = UIImage.init(systemName: "magnifyingglass")
        $0.setImage(image, for: .normal)
        $0.tintColor = .black
    }
    
    private let textField = UITextField().then {
        $0.placeholder = "책 제목을 입력해주세요."
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
            titleLabel,
            searchButton,
            textField
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
        self.searchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(20)
            $0.size.equalTo(16)
        }
        self.textField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.equalTo(self.searchButton.snp.left).offset(-20)
            $0.left.equalTo(self.titleLabel.snp.right).offset(10)
        }
    }
}


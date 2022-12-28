//
//  TopBar.swift
//  Memo
//
//  Created by mincheol on 2022/12/24.
//  Copyright © 2022 Memo. All rights reserved.
//

import UIKit
import Then
import SnapKit
import RxSwift

final class TopBar: UIView {
    
    // MARK: Constants
    enum Constants {
        static let leftButtonSize = 30
        static let rightButtonSize = 50
    }
    
    var titleLabelText: String? {
        didSet {
            self.titleLabel.text = titleLabelText
        }
    }
    
    var leftButtonImage: UIImage? {
        didSet {
            self.leftButton.setImage(
                self.leftButtonImage,
                for: .normal
            )
        }
    }

    // MARK: UIProperties
    
    private let container = UIView()
    private let leftButton = UIButton().then {
        $0.tintColor = .black
    }
    private let titleLabel = UILabel()
    private let rightButton = UIButton().then {
        $0.layer.cornerRadius = 12
        $0.titleLabel?.font = .systemFont(ofSize: 12)
        $0.setTitle("등록", for: .normal)
        $0.backgroundColor = .black
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
        let color: CGFloat = 245 / 255
        self.backgroundColor = .init(red: color, green: color, blue: color, alpha: 1)
        self.addSubview(container)
        
        [
            self.leftButton,
            self.titleLabel,
            self.rightButton
        ].forEach {
            self.container.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        self.container.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        self.leftButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(20)
            $0.size.equalTo(Constants.leftButtonSize)
        }
        
        self.titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        self.rightButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(Constants.rightButtonSize)
        }
        
    }
    
}

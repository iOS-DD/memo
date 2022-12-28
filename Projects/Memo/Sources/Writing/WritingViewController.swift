//
//  WritingViewController.swift
//  Memo
//
//  Created by mincheol on 2022/12/24.
//  Copyright © 2022 Memo. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import Then

protocol WritingPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class WritingViewController: UIViewController, WritingPresentable, WritingViewControllable {
    
    weak var listener: WritingPresentableListener?
    
    
    // MARK: UI Properties
    
    private let topBar = TopBar().then {
        $0.titleLabelText = "글 담기"
        $0.leftButtonImage = UIImage.init(systemName: "xmark")
    }
    
    private let textView = UITextView().then {
        $0.textAlignment = .center
        $0.text = "글을 작성해주세요."
        $0.textColor = UIColor.lightGray
    }
    
    private lazy var stackView = UIStackView(
        arrangedSubviews: [
            self.categoryView,
            self.sourceView,
            self.authorView,
            self.pageView
        ]).then {
            $0.axis = .vertical
            $0.distribution = .fillEqually
        }
    private let categoryView = CategoryView()
    private let sourceView = SourceView()
    private let authorView = AuthorView()
    private let pageView = PageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
        self.setUpConstraints()
    }
    
    private func configureUI() {
        let color: CGFloat = 245 / 255
        self.view.backgroundColor = .init(red: color, green: color, blue: color, alpha: 1)
        self.textView.delegate = self
        [
            self.topBar,
            self.textView,
            self.stackView
        ]
            .forEach {
                self.view.addSubview($0)
            }
    }
    
    private func setUpConstraints() {
        self.topBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
        }
        self.textView.snp.makeConstraints {
            $0.top.equalTo(self.topBar.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(400)
        }
        self.stackView.snp.makeConstraints {
            $0.top.equalTo(self.textView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(50 * 4)
        }
    }
}

extension WritingViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if !textView.text.isEmpty {
            textView.text = nil // 텍스트를 날려줌
            textView.textColor = UIColor.black
        }
        
    }
    // UITextView의 placeholder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "글을 작성해주세요."
            textView.textColor = UIColor.lightGray
        }
    }
    
}

//
//  FeelingQuestionController.swift
//  Mohae
//
//  Created by 이주영 on 2019/10/30.
//  Copyright © 2019 권혁준. All rights reserved.
//

import UIKit
import SnapKit
// 5. 현재 기분은 어떤가요? -> 행복, 슬픔, 차분, 흥분 등 => 4 개 이상
class FeelingQuestionController: UIViewController {
    var feelingQuestionView: FeelingQuestionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(goBack))
        feelingQuestionView = FeelingQuestionView()
        setView()
    }
    
    @objc func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func setView() {
        if let feelingQuestion = feelingQuestionView {
            let surveyBoard = feelingQuestion.surveyScreen
            let questionLabel = feelingQuestion.questionLabel
            let happyButton = feelingQuestion.happyButton
            let sadButton = feelingQuestion.sadButton
            let calmButton = feelingQuestion.calmButton
            let excitingButton = feelingQuestion.excitingButton
            
            feelingQuestion.delegate = self
            
            if let board = surveyBoard, let question = questionLabel, let happyBtn = happyButton, let sadBtn = sadButton, let calmBtn = calmButton, let excitingBtn = excitingButton {
                view.addSubview(board)
                
                board.snp.makeConstraints { (make) in
                    make.centerX.equalTo(view.snp.centerX)
                    make.centerY.equalTo(view.snp.centerY)
                    make.width.equalTo(view.snp.width)
                    make.height.equalTo(view.snp.height)
                }
                
                question.snp.makeConstraints { (make) in
                    make.centerX.equalTo(board.snp.centerX)
                    make.centerY.equalTo(board.snp.centerY)
                }
                
                happyBtn.snp.makeConstraints { (make) in
                    make.top.equalTo(question.snp.bottom).offset(50)
                    make.centerX.equalTo(board.snp.centerX)
                }
                
                sadBtn.snp.makeConstraints { (make) in
                    make.top.equalTo(happyBtn.snp.bottom).offset(20)
                    make.centerX.equalTo(board.snp.centerX)
                }
                
                calmBtn.snp.makeConstraints { (make) in
                    make.top.equalTo(sadBtn.snp.bottom).offset(20)
                    make.centerX.equalTo(board.snp.centerX)
                }
                
                excitingBtn.snp.makeConstraints { (make) in
                    make.top.equalTo(calmBtn.snp.bottom).offset(20)
                    make.centerX.equalTo(board.snp.centerX)
                }
            }
        }
    }
}

extension FeelingQuestionController: FeelingQuestionButtonDelegate {
    func touchHappy() {
        print("I'm So Happy")
    }
    
    func touchSad() {
        print("ㅠㅠ")
    }
    
    func touchCalm() {
        print("Keep Calm")
    }
    
    func touchExciting() {
        print("SOOOOOOO Exciting")
    }
}

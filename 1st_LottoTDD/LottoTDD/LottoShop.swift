//
//  LottoShop.swift
//  LottoTDD
//
//  Created by Hyunah on 18/03/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

//* 기능 요구사항
// - 로또 구입 금액을 입력하면 구입 금액에 해당하는 로또를 발급해야 한다.
// - 로또 1장의 가격은 1000원이다.
// - 당첨 번호를 입력해 당첨 결과를 출력해야 한다.
// - 수익률을 계산해 출력해야 한다.
//
//* 로또 규칙
// - 로또는 1부터 45까지의 숫자 중 6개의 번호를 임의로 선택하는데 이 번호를 맞추면 된다.
// - 6개의 번호 중 6개를 모두 맞히면 1등, 5개는 3등, 4개는 4등, 3개는 5등이다.
// - 2등은 5개의 번호가 일치하고 1개의 보너스볼이 일치하면 된다.

// Goal: 현재 테스트코드가 돌아가기에 충분하 코드만! 작성한다.

import Foundation

typealias Lotto = Set<Int>

class LottoShop {
    
 
    init(money: Int) {
        self.inputMoney = money
        print("\(self.numberOfLottos)개를 구매했습니다.")
    }
    
    // MARK: - properties
    private let lottoPrice = 1000
    private var inputMoney: Int
    private var numberOfLottos: Int {
        return inputMoney / lottoPrice
    }
    
    // MARK: - functions
    // feedback: side effect가 없는 함수는 명사구로 읽어야 한다.
    func lottoBundle() -> [Lotto] {
        guard numberOfLottos > 0 else { return [] }
        var result = [Lotto]()
        defer {
            print("lottos:", result)
        }
        for _ in 0..<numberOfLottos {
            result.append(publishedLotto())
        }
        return result
    }
    
    // 순서는 상관없고 멤버가 유일함을 보장하고, 교집합을 찾아내야한다는 점에서 Set을 사용함.
    func publishedLotto() -> Lotto {
        var result: Lotto = []
        while(result.count < 6) {
            let number = Int.random(in: 1...45)
            result.insert(number)
        }
        return result
    }
} 

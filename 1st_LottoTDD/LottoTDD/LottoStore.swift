//
//  LottoStore.swift
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

class LottoStore {
    typealias Lotto = Set<Int>
    let luckyNumber = (basic: Set(arrayLiteral: 16, 20, 24, 28, 36, 39), bonus: 5)
    
    init(money: Int) {
        self.inputMoney = money
        print("\(inputMoney)개를 구매했습니다.")
    }
    
    // MARK: - properties
    let lottoPrice = 1000
    var inputMoney: Int
    var numberOfLotto: Int {
        return inputMoney / lottoPrice
    }
    
    var lottos: [Lotto] {
        return getLottos()
    }
    
    // MARK: - functions
    func getLottos() -> [Lotto] {
        guard numberOfLotto > 0 else { return [] }
        var result = [Lotto]()
        defer {
            print("lottos:", result)
        }
        for _ in 0..<numberOfLotto {
            result.append(getOneLotto())
        }
        return result
    }
    
    // 순서는 상관없고 멤버가 유일함을 보장하고, 교집합을 찾아내야한다는 점에서 Set을 사용함.
    func getOneLotto() -> Lotto {
        var result: Lotto = []
        for _ in 0...5 {
            var number: Int = 0
            while(number == 0 || result.contains(number)){
                number = Int(arc4random_uniform(46))
            }
           result.insert(number)
        }
        return result
    }
    
    func getRank(lotto: Lotto) -> (same: Int, prize: Int, rank: Int?) {
        let sameNumber = lotto.intersection(self.luckyNumber.basic)
        switch sameNumber.count {
        case 0...2:
            return (same: sameNumber.count , prize: 0, rank: nil)
        case 3:
             return (same: sameNumber.count , prize: 5000, rank: 5)
        case 4:
            if lotto.contains(self.luckyNumber.bonus) {
                return (same: sameNumber.count , prize: 30000000, rank: 2)
            }
            return (same: sameNumber.count , prize: 50000, rank: 4)
        case 5:
            return (same: sameNumber.count , prize: 1500000, rank: 3)
        case 6:
            return (same: sameNumber.count , prize: 0, rank: 1)
        default:
            return (same: 0, prize: 0, rank: nil)
        }
    }
    
    // index ==  등수, indexValue == 해당 등수의 count
    // 직관적이기 위해서 index 0은 고려하지 않는다.
    func getTotalRank(lottos: [Lotto]) -> [Int] {
        var result = [Int](repeating: 0, count: 6)
        defer {
            print("당첨통계")
            print("-----")
            for (rank, count) in result.enumerated() {
                guard rank != 0 else { continue }
                print("\(rank)등 총 \(count) 개 당첨")
            }
        }
        for lotto in lottos {
            if let rank = self.getRank(lotto: lotto).rank {
                result[rank] += 1
            }
        }
        return result
    }
} 

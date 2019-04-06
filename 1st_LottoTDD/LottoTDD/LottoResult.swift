//
//  LottoResult.swift
//  LottoTDD
//
//  Created by Hyunah on 06/04/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import Foundation

struct LottoResult {
    static let luckyNumber = (basic: Set(arrayLiteral: 16, 20, 24, 28, 36, 39), bonus: 5)

    static func rankOfLotto(lotto: Lotto) -> (same: Int, prize: Int, rank: Int?) {
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
    // Tip: @discardableResult을 달아주면 return값을 사용하지 않아도 warning이 뜨는걸 막아준다
    @discardableResult
    static func totalRankOfLotto(lottos: [Lotto]) -> [Int] {
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
            if let rank = LottoResult.rankOfLotto(lotto: lotto).rank {
                result[rank] += 1
            }
        }
        return result
    }

}

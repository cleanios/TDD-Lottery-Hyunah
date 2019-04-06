//
//  LottoResultTests.swift
//  LottoTDDTests
//
//  Created by Hyunah on 06/04/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import XCTest
@testable import LottoTDD

class LottoResultTests: XCTestCase {
    // ** 당첨숫자  16, 20, 24, 28, 36, 39 , bonus: 5
    func testrankOfLottoShoulReturnNumberOfSameNumberAndPrizes_for5thWinner() {
        //Given
        let testLotto = Set(arrayLiteral: 16, 20, 24, 4, 1, 9)
        //When
        let result = LottoResult.rankOfLotto(lotto: testLotto)
        //Then
        let parallel = (same: 3, prize: 5000, rank: 5)
        XCTAssertEqual(result.rank, parallel.rank)
        XCTAssertEqual(result.prize, parallel.prize)
    }
    
    func testrankOfLottoShoulReturnNumberOfSameNumberAndPrizes_for2ndWinner() {
        //Given
        let testLotto = Set(arrayLiteral: 16, 20, 24, 4, 36, 5)
        //When
        let result = LottoResult.rankOfLotto(lotto: testLotto)
        //Then
        let parallel = (same: 5, prize: 30000000, rank: 2)
        XCTAssertEqual(result.rank, parallel.rank)
        XCTAssertEqual(result.prize, parallel.prize)
    }
    
    func testrankOfLottoShoulReturnNumberOfSameNumberAndPrizes_for4thWinner() {
        //Given
        let testLotto = Set(arrayLiteral: 16, 20, 24, 4, 36, 1)
        //When
        let result = LottoResult.rankOfLotto(lotto: testLotto)
        //Then
        let parallel = (same: 4, prize: 50000, rank: 4)
        XCTAssertEqual(result.rank, parallel.rank)
        XCTAssertEqual(result.prize, parallel.prize)
    }
    
    func testtotalRankOfLotto() {
        //Given
        let firstLotto = Set(arrayLiteral: 16, 20, 24, 4, 36, 1)
        let secondeLotto = Set(arrayLiteral: 39, 20, 24, 4, 36, 1)
        //When
        let result = LottoResult.totalRankOfLotto(lottos: [firstLotto, secondeLotto])
        //Then
        XCTAssertEqual(result[4], 2)
        XCTAssertEqual(result[5], 0)
    }
    
    func testtotalRankOfLotto_containSameLotto() {
        //Given
        let firstLotto = Set(arrayLiteral: 16, 20, 24, 4, 36, 1)
        //When
        let result = LottoResult.totalRankOfLotto(lottos: [firstLotto, firstLotto,firstLotto])
        //Then
        XCTAssertEqual(result[4], 3)
    }
}

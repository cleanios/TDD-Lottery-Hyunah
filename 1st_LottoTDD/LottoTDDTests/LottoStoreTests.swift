//
//  LottoStoreTests.swift
//  LottoTDDTests
//
//  Created by Hyunah on 18/03/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import XCTest
@testable import LottoTDD

class LottoStoreTests: XCTestCase {
    var lottoStore: LottoStore!
    
    override func setUp() {
        lottoStore = LottoStore(money: 4000)
    }

    /**
     store를 초기화 할 때,
     돈을 입력하면 해당하는 갯수의 lotto들이 생성된다.
     */
    func testInitShouldTakeNumberOfGame() {
        //Given
        let lottoStore = LottoStore(money: 100000)
        //When
        let NumberOflotto = lottoStore.lottos.count
        //Then
        XCTAssertEqual(NumberOflotto, 100)
    }
    func testInitShouldTakeNumberOfGame_WithMinusMoney() {
        //Given
        let lottoStore = LottoStore(money: -2000)
        //When
        let NumberOflotto = lottoStore.lottos.count
        //Then
        XCTAssertEqual(NumberOflotto, 0)
    }

    
    func testGetLottos() {
        //Given
        let lottoStore = LottoStore(money: 4000)
        //When
        let lottos = lottoStore.getLottos()
        //Then
        XCTAssertEqual(lottos.count, 4)
    }

    func testGetOneLotto() {
        //Given
        let lottoStore = LottoStore(money: 4000)
        //When
        let result = lottoStore.getOneLotto().count
        //Then
        XCTAssertEqual(result, 6)
    }
    
    func testGetOneLotto_ShouldNotHaveZero() {
        //Given
        let lottoStore = LottoStore(money: 4000)
        //When
        let result = lottoStore.getOneLotto()
        //Then
        XCTAssertFalse(result.contains(0), "Lotto should not have zero")
    }
    
    // ** 당첨숫자  16, 20, 24, 28, 36, 39 , bonus: 5
    func testGetRankShoulReturnNumberOfSameNumberAndPrizes_for5thWinner() {
        //Given
        let testLotto = Set(arrayLiteral: 16, 20, 24, 4, 1, 9)
        //When
        let result = self.lottoStore.getRank(lotto: testLotto)
        //Then
        let parallel = (same: 3, prize: 5000, rank: 5)
        XCTAssertEqual(result.rank, parallel.rank)
        XCTAssertEqual(result.prize, parallel.prize)
    }
    
    func testGetRankShoulReturnNumberOfSameNumberAndPrizes_for2ndWinner() {
        //Given
        let testLotto = Set(arrayLiteral: 16, 20, 24, 4, 36, 5)
        //When
        let result = self.lottoStore.getRank(lotto: testLotto)
        //Then
        let parallel = (same: 5, prize: 30000000, rank: 2)
        XCTAssertEqual(result.rank, parallel.rank)
        XCTAssertEqual(result.prize, parallel.prize)
    }
    
    func testGetRankShoulReturnNumberOfSameNumberAndPrizes_for4thWinner() {
        //Given
        let testLotto = Set(arrayLiteral: 16, 20, 24, 4, 36, 1)
        //When
        let result = self.lottoStore.getRank(lotto: testLotto)
        //Then
        let parallel = (same: 4, prize: 50000, rank: 4)
        XCTAssertEqual(result.rank, parallel.rank)
        XCTAssertEqual(result.prize, parallel.prize)
    }
    
    func testGetTotalRank() {
        //Given
        let firstLotto = Set(arrayLiteral: 16, 20, 24, 4, 36, 1)
        let secondeLotto = Set(arrayLiteral: 39, 20, 24, 4, 36, 1)
        //When
        let result = self.lottoStore.getTotalRank(lottos: Set(arrayLiteral: firstLotto, secondeLotto))
        //Then
        XCTAssertEqual(result[4], 2)
        XCTAssertEqual(result[5], 0)
    }
    
    func testGetTotalRank_containSameLotto() {
        //Given
        let firstLotto = Set(arrayLiteral: 16, 20, 24, 4, 36, 1)
        //When
        let result = self.lottoStore.getTotalRank(lottos: Set(arrayLiteral: firstLotto, firstLotto,firstLotto))
        //Then
        XCTAssertEqual(result[4], 3)
    }
}

//
//  LottoShopTests.swift
//  LottoTDDTests
//
//  Created by Hyunah on 18/03/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import XCTest
@testable import LottoTDD

class LottoShopTests: XCTestCase {
    var lottoShop: LottoShop!
    
    override func setUp() {
        lottoShop = LottoShop(money: 4000)
    }

    /**
     store를 초기화 할 때,
     돈을 입력하면 해당하는 갯수의 lotto들이 생성된다.
     */
    func testInitShouldTakeNumberOfGame() {
        //Given
        let lottoShop = LottoShop(money: 100000)
        //When
        let NumberOflotto = lottoShop.lottoBundle().count
        //Then
        XCTAssertEqual(NumberOflotto, 100)
    }
    func testInitShouldTakeNumberOfGame_WithMinusMoney() {
        //Given
        let lottoShop = LottoShop(money: -2000)
        //When
        let NumberOflotto = lottoShop.lottoBundle().count
        //Then
        XCTAssertEqual(NumberOflotto, 0)
    }

    
    func testGetLottos() {
        //Given
        let lottoShop = LottoShop(money: 4000)
        //When
        let lottos = lottoShop.lottoBundle()
        //Then
        XCTAssertEqual(lottos.count, 4)
    }

    func testpublishedLotto() {
        //Given
        let lottoShop = LottoShop(money: 4000)
        //When
        let result = lottoShop.publishedLotto().count
        //Then
        XCTAssertEqual(result, 6)
    }
    
    func testpublishedLotto_ShouldNotHaveZero() {
        //Given
        let lottoShop = LottoShop(money: 4000)
        //When
        let result = lottoShop.publishedLotto()
        //Then
        XCTAssertFalse(result.contains(0), "Lotto should not have zero")
    }
}

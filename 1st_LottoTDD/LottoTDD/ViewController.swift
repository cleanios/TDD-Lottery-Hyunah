//
//  ViewController.swift
//  LottoTDD
//
//  Created by Hyunah on 17/03/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let lottoShop = LottoShop(money: 5000)

    override func viewDidLoad() {
        super.viewDidLoad()
        let lottos = lottoShop.lottoBundle()
        LottoResult.totalRankOfLotto(lottos: lottos)
    }
}


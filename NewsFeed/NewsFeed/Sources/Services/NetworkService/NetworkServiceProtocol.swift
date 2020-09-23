//
//  NetworkServiceProtocol.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import RxSwift

protocol NetworkServiceProtocol {

    func data<T: Decodable>(for request: Request) -> Single<T>
    func data(for request: Request) -> Single<Data>

}

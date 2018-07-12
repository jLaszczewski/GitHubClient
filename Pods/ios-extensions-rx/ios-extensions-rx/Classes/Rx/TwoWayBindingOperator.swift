//
//  TwoWayBindingOperator.swift
//  ios-extensions-rx
//
//  Created by Mateusz Tylman on 26.01.2017.
//  Copyright © 2017 Appchance. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

infix operator <->

public func <-> <T>(property: ControlProperty<T>, variable: Variable<T>) -> Disposable {
    let bindToUIDisposable = variable.asObservable().bindTo(property)
    let bindToVariable = property.subscribe(onNext: { n in
        variable.value = n
    }, onCompleted: {
        bindToUIDisposable.dispose()
    })
    
    return Disposables.create(bindToUIDisposable, bindToVariable)
}

public func <-> <T>(left: Variable<T>, right: Variable<T>) -> Disposable {
    let leftToRight = left.asObservable()
        .bindTo(right)
    
    let rightToLeft = right.asObservable()
        .bindTo(left)
    
     return Disposables.create(leftToRight, rightToLeft)
}

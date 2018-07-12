//
//  UIScrollView+Rx.swift
//  ios-extensions-rx
//
//  Created by Mateusz Tylman on 07.12.2016.
//  Copyright © 2016 Appchance. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIScrollView {
    public func rxReachedBottom(offset: CGFloat = 0.0) -> Observable<Void> {
        return contentOffset
            .flatMap { contentOffset -> Observable<Void> in
                let scrollView = self.base
                let visibleHeight = scrollView.frame.height - scrollView.contentInset.top - scrollView.contentInset.bottom
                let y = contentOffset.y + scrollView.contentInset.top
                let threshold = max(0.0, scrollView.contentSize.height - visibleHeight - offset)
                
                return y > threshold ? Observable.just(()) : Observable.empty()
        }
    }
}

extension Reactive where Base: UIScrollView {
    public func rxReachedTop(offset: CGFloat = 0.0) -> Observable<Void> {
        return contentOffset
            .flatMap { contentOffset -> Observable<Void> in
                let scrollView = self.base
                
                let y = contentOffset.y + scrollView.contentInset.top + offset
                let threshold: CGFloat = 10
                
                return y <= threshold ? Observable<Void>.just(()) : Observable<Void>.empty()
            }
    }
}

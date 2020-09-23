//
//  UIView.swift
//  NewsFeed
//
//  Created by o.sinev on 12.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import UIKit

extension UIView {

    /**
     Добавляет тень для вью с возможностью оптимизации производительности.

     - Important:
     Если вью имеет простой контур - прямоугольник со скругленными краями или без,
     рекомендуется использовать данную функцию.
     Во избежание потери производительности при отрисовки тени,
     необходимо установить параметр shouldSetPath = true.

     Не подходит для вью с layer.masksToBounds = true

     - Parameter shouldSetPath: флаг, отвечающий за генерацию shadowPath, используя view.bounds
     - Parameter radius: радиус blur'a тени
     - Parameter opacity: непрозрачность
     - Parameter offset: смещение
     - Parameter color: цвет, по умолчанию UIColor.black (НЕ инвертируется под разные темы)
     */
    func addShadow(shouldSetPath: Bool, radius: CGFloat, opacity: Float, offset: CGSize = .zero, color: CGColor? = nil) {
        if shouldSetPath {
            layer.shadowPath = layer.cornerRadius > 0 ?
                UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath :
                UIBezierPath(rect: bounds).cgPath
        }
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        color.map { layer.shadowColor = $0 }
        layer.masksToBounds = false
    }

}

//
//  UIView+Pin.swift
//  seminar2
//
//  Created by seif on 2023-09-22.
//

import UIKit

extension UIView{
    enum ConstraintMode{
        case equal // ==
        case grOE // >=
        case lsOE // <=
    }
    // MARK: - Pin left
    @discardableResult
    func pinLeft(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, leadingAnchor, otherView.leadingAnchor, constant: -const)
    }
    
    @discardableResult
    func pinLeft(
        to anchor: NSLayoutXAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, leadingAnchor, anchor, constant: -const)
    }
    
    // MARK: - Pin right
    func pinRight(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, trailingAnchor, otherView.trailingAnchor, constant: -const)
    }

    @discardableResult
    func pinRight(
        to anchor: NSLayoutXAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, trailingAnchor, anchor, constant: -const)
    }
    
    // MARK: - Pin top
    @discardableResult
    func pinTop(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, topAnchor, otherView.topAnchor, constant: -const)
    }

    @discardableResult
    func pinTop(
        to anchor: NSLayoutYAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, topAnchor, anchor, constant: -const)
    }
    
    // MARK: - Pin bottom
    @discardableResult
    func pinBottom(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, bottomAnchor, otherView.bottomAnchor, constant: -const)
    }

    @discardableResult
    func pinBottom(
        to anchor: NSLayoutYAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, bottomAnchor, anchor, constant: -const)
    }
    
    // MARK: - Pin center
    @discardableResult
    func pinCenter(
        to otherView: UIView,
        _ offsetX: Double = 0,
        _ offsetY: Double = 0
    ) -> [NSLayoutConstraint] {
        let centerXConstraint = centerXAnchor.constraint(equalTo: otherView.centerXAnchor, constant: CGFloat(offsetX))
        let centerYConstraint = centerYAnchor.constraint(equalTo: otherView.centerYAnchor, constant: CGFloat(offsetY))
        
        centerXConstraint.isActive = true
        centerYConstraint.isActive = true
        
        return [centerXConstraint, centerYConstraint]
    }
    
    // MARK: - Pin width
    @discardableResult
    func pinWidth(
        to otherView: UIView,
        _ multiplier: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, widthAnchor, otherView.widthAnchor, multiplier: multiplier)
    }

    @discardableResult
    func pinWidth(
        to constant: Double,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinDimension(mode: mode, widthAnchor, constant: constant)
    }
    // MARK: - Pin height
    @discardableResult
    func pinHeight(
        to otherView: UIView,
        _ multiplier: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, heightAnchor, otherView.heightAnchor, multiplier: multiplier)
    }

    @discardableResult
    func pinHeight(
        to constant: Double,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinDimension(mode: mode, heightAnchor, constant: constant)
    }
    
    // MARK: - Set width
    @discardableResult
    func setWidth(_ constant: Double) -> NSLayoutConstraint {
        return pinDimension(.equal, widthAnchor, constant: constant)
    }
    // MARK: - Set height
    @discardableResult
    func setHeight(_ constant: Double) -> NSLayoutConstraint {
        return pinDimension(.equal, heightAnchor, constant: constant)
    }
    // MARK: - Private methods
    @discardableResult
    private func pinConstraint<Axis: AnyObject, AnyAnchor: NSLayoutAnchor<Axis>>(
        mode: ConstraintMode,
        _ firstConstraint: AnyAnchor,
        _ secondConstraint: AnyAnchor,
        constant: Double = 0
    ) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode {
        case .equal:
            result = firstConstraint.constraint(equalTo: secondConstraint, constant: const)
        case .grOE:
            result = firstConstraint.constraint(greaterThanOrEqualTo: secondConstraint, constant: const)
        case .lsOE:
            result = firstConstraint.constraint(lessThanOrEqualTo: secondConstraint, constant: const)
        }
        
        result.isActive = true
        return result
    }
    
    @discardableResult
    private func pinConstraint(
        mode: ConstraintMode,
        _ firstConstraint: NSLayoutDimension,
        _ secondConstraint: NSLayoutDimension,
        multiplier: Double = 0
    ) -> NSLayoutConstraint {
        let mult = CGFloat(multiplier)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode {
        case .equal:
            result = firstConstraint.constraint(equalTo: secondConstraint, multiplier: mult)
        case .grOE:
            result = firstConstraint.constraint(greaterThanOrEqualTo: secondConstraint, multiplier: mult)
        case .lsOE:
            result = firstConstraint.constraint(lessThanOrEqualTo: secondConstraint, multiplier: mult)
        }
        
        result.isActive = true
        return result
    }
    
    @discardableResult
    private func pinDimension(
        mode: ConstraintMode,
        _ dimension: NSLayoutDimension,
        constant: Double = 0
    ) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch mode {
        case .equal:
            result = dimension.constraint(equalToConstant: const)
        case .grOE:
            result = dimension.constraint(greaterThanOrEqualToConstant: const)
        case .lsOE:
            result = dimension.constraint(lessThanOrEqualToConstant: const)
        }
        
        result.isActive = true
        return result
    }
}

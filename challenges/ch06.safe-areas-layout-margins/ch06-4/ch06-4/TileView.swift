//
//  TileView.swift
//  ch06-4
//
//  Created by Matt Brown on 7/17/19.
//  Copyright © 2019 Matt Brown. All rights reserved.
//

import UIKit

class TileView: UIView {
    
    private enum ViewMetrics {
        static let backgroundColor: UIColor = .green
        static let spacing: CGFloat = 25.0
    }
    
    private let blueView = UIView.makeView(color: .blue)
    private let redView = UIView.makeView(color: .red)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = ViewMetrics.backgroundColor
        preservesSuperviewLayoutMargins = true
        
        [blueView, redView].forEach({ addSubview($0) })
        
        NSLayoutConstraint.activate([
            blueView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            redView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: ViewMetrics.spacing),
            layoutMarginsGuide.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            redView.widthAnchor.constraint(equalTo: blueView.widthAnchor),
            
            blueView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            layoutMarginsGuide.bottomAnchor.constraint(equalTo: blueView.bottomAnchor),
            redView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            layoutMarginsGuide.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            ])
    }
}

private extension UIView {
    static func makeView(color: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }
}

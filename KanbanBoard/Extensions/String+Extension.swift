//
//  File.swift
//  KanbanBoard
//
//  Created by Полина Истомина on 31.07.2021.
//

import UIKit

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintFrame = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintFrame,
                                       options: .usesLineFragmentOrigin,
                                       attributes: [.font : font],
                                       context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintFrame = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintFrame,
                                       options: .usesLineFragmentOrigin,
                                       attributes: [.font : font],
                                       context: nil)
        
        return ceil(boundingBox.width)
    }
}


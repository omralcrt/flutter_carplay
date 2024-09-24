//
//  FCPPointOfInterestTemplate.swift
//  flutter_carplay
//
//  Created by Olaf Schneider on 15.02.22.
//

import CarPlay

@available(iOS 14.0, *)
class FCPPointOfInterestTemplate {
    private(set) var _super: CPPointOfInterestTemplate?
    private(set) var elementId: String
    private var title: String
    private var systemIcon: String
    private var showsTabBadge: Bool = false
    private var poi: [FCPPointOfInterest]
    
    init(obj: [String : Any]) {
        self.elementId = obj["_elementId"] as! String
        self.title = obj["title"] as! String
        self.systemIcon = obj["systemIcon"] as! String
        self.showsTabBadge = obj["showsTabBadge"] as! Bool
        self.poi = (obj["poi"] as! Array<[String : Any]>).map {
            FCPPointOfInterest(obj: $0)
        }
    }
    
    var get: CPPointOfInterestTemplate {
        var pois: [CPPointOfInterest] = []
        
        for p in poi{
            pois.append(p.get);
        }
        
        let pointOfInterestTemplate = CPPointOfInterestTemplate.init(title: self.title,pointsOfInterest: pois, selectedIndex: NSNotFound)
        pointOfInterestTemplate.showsTabBadge = showsTabBadge
        pointOfInterestTemplate.tabImage = UIImage(systemName: systemIcon)
        self._super = pointOfInterestTemplate
        return pointOfInterestTemplate
    }
}

@available(iOS 14.0, *)
extension FCPPointOfInterestTemplate: FCPRootTemplate { }

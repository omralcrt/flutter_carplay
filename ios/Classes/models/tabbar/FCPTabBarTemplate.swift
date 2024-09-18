//
//  FCPTabBarTemplate.swift
//  flutter_carplay
//
//  Created by Oğuzhan Atalay on 21.08.2021.
//

import CarPlay

@available(iOS 14.0, *)
class FCPTabBarTemplate {
  private(set) var elementId: String
  private var title: String?
  private var templates: [CPTemplate]
  private var objcTemplates: [FCPRootTemplate]
  
  init(obj: [String : Any]) {
    self.elementId = obj["_elementId"] as! String
    self.title = obj["title"] as? String
    var types = (obj["runtimeTypes"] as! Array<String>)
    self.objcTemplates = (obj["templates"] as! Array<[String: Any]>).enumerated().map { (index, element) in
        switch types[index] {
          case String(describing: FCPGridTemplate.self):
            return FCPGridTemplate(obj: element)
          case String(describing: FCPInformationTemplate.self):
            return FCPInformationTemplate(obj: element)
          case String(describing: FCPPointOfInterestTemplate.self):
            return FCPPointOfInterestTemplate(obj: element)
          case String(describing: FCPListTemplate.self):
            return FCPListTemplate(obj: element, templateType: FCPListTemplateTypes.PART_OF_GRID_TEMPLATE)
          default:
            fatalError("Unexpected value")
        }
    }
    self.templates = self.objcTemplates.map {
      switch $0 {
        case is FCPGridTemplate:
          return ($0 as! FCPGridTemplate).get
        case is FCPInformationTemplate:
          return ($0 as! FCPInformationTemplate).get
        case is FCPPointOfInterestTemplate:
          return ($0 as! FCPPointOfInterestTemplate).get
        case is FCPListTemplate:
          return ($0 as! FCPListTemplate).get
        default:
          fatalError("Unexpected value")
      }
    }
  }
  
  var get: CPTabBarTemplate {
    let tabBarTemplate = CPTabBarTemplate.init(templates: templates)
    tabBarTemplate.tabTitle = title
    return tabBarTemplate
  }
  
  public func getTemplates() -> [FCPRootTemplate] {
    return objcTemplates
  }
}

@available(iOS 14.0, *)
extension FCPTabBarTemplate: FCPRootTemplate { }

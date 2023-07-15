import Orion
import SwiftyFlexyC
import UIKit
import SwiftHooker


class MetadataHook : ClassHook<FLEXMetadataSection> {
    func menuItemsForRow(_ row: NSInteger, sender: UIViewController) -> [UIMenuElement] {
        var items = orig.menuItemsForRow(row, sender: sender)
        if target.metadataKind == FLEXMetadataKind.ivars {
            let reflectionAction = UIAction.init(title: "Swifty Flex Reflect") { action in
            // swift so stupid i have to go back to Ancient ObjC
            let ivarName = getIvarName(self.target.explorer.ivars, row)
            let reflection = SwiftHooker.GetNamedIvarDescriptor(self.target.explorer.object, ivarName) as? Mirror.Child
            sender.navigationController?.pushViewController(
                getExplorerFor(reflection?.value ?? "Null Ivar, or can't find")!,
                animated: true)
            }
            items.append(reflectionAction)
        }
        return items
    }
}
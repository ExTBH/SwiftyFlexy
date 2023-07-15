#include "Tweak.h"
#import <Orion/Orion.h>
#include <objc/runtime.h>
#include <UIKit/UIKit.h>

@implementation FLEXIvar
@end

@implementation FLEXObjectExplorer
@end


UIViewController* _Nonnull getExplorerFor(id object) {
    Class FLEXObjectExplorerFactory_c = objc_getClass("FLEXObjectExplorerFactory");
    return [FLEXObjectExplorerFactory_c explorerViewControllerForObject:object];
}

NSString* _Nonnull getIvarName(NSArray<FLEXIvar*> * _Nonnull ivars, NSInteger index) {
    return ivars[index].name;
}

__attribute__((constructor)) static void init() {
    // Initialize Orion - do not remove this line.
    orion_init();
    // Custom initialization code goes here.
}

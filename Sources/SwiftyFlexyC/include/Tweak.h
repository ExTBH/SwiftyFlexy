#import <UIKit/UIKit.h>



typedef NS_ENUM(NSUInteger, FLEXMetadataKind) {
    FLEXMetadataKindProperties = 1,
    FLEXMetadataKindClassProperties,
    FLEXMetadataKindIvars,
    FLEXMetadataKindMethods,
    FLEXMetadataKindClassMethods,
    FLEXMetadataKindClassHierarchy,
    FLEXMetadataKindProtocols,
    FLEXMetadataKindOther
};

@interface FLEXIvar : NSObject
@property (nonatomic, readonly) NSString* _Nonnull name;
@end

@interface FLEXObjectExplorer : NSObject
@property (nonatomic, readonly) _Nonnull id object;
@property (nonatomic, readonly) NSArray<FLEXIvar * > * _Nonnull ivars;
@end

@interface FLEXMetadataSection : NSObject
@property (nonatomic, readonly) FLEXObjectExplorer * _Nonnull explorer;
@property (nonatomic, readonly) FLEXMetadataKind metadataKind;
- (nullable NSArray<UIMenuElement *> *)menuItemsForRow:(NSInteger)row sender:(UIViewController * _Nonnull)sender;
@end


@interface FLEXObjectExplorerFactory : NSObject
+ (nullable __kindof UIViewController *)explorerViewControllerForObject:(nullable id)object;
@end

__kindof UIViewController* _Nullable getExplorerFor(_Nonnull id object);


NSString* _Nonnull getIvarName(NSArray<FLEXIvar*> * _Nonnull ivars, NSInteger index);
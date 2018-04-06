# FrameworkTest

## Update

This is actually a manifestation of the Swift Bug [SR-2250](https://bugs.swift.org/browse/SR-2250)

## Steps to Reproduce

Build the _WatchTest_ Sample.

I am getting the issue

```While building module 'SHPartner' imported from /Users/below/dev/DTAG/Samples/Test/WatchTest Extension/InterfaceController.m:10:
In file included from <module-includes>:1:
/Users/below/Library/Developer/Xcode/DerivedData/Test-emvjswrpztpgvcbytkvxbfjkbfuw/Build/Products/Debug-watchsimulator/SHPartner.framework/Headers/SHPartner-Swift.h:187:4: error: expected a type
- (NSArray<NSString *> * _Nonnull)supportedLanguages SWIFT_WARN_UNUSED_RESULT;
   ^
1 error generated.
/Users/below/dev/DTAG/Samples/Test/WatchTest Extension/InterfaceController.m:10:9: fatal error: could not build module 'SHPartner'
@import SHPartner;
 ~~~~~~~^~~~~~~~~
2 errors generated.`

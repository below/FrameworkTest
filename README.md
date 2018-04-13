# FrameworkTest

## Lastest Update, New Question: Today Extension

Now my problem is loading the library from a Today Extension. Everything compiles, however, when I link the Framework with the **Required** setting, the Extension crashes on launch. When I set it to **Optional**, it loads but I can not [instantiate an object](https://github.com/below/FrameworkTest/blob/077b6595bea6ee9607bfaf5b9e8792475ed7b88e/ExtensionTest/TodayViewController.m#L38) of class `SHPartner`.

What am I doing wrong?

## Update & Workaround

This is actually a manifestation of the Swift Bug [SR-2250](https://bugs.swift.org/browse/SR-2250)

As stated there, the bug appears if only bridged classes (like `String`) are used, and not the explicit Foundation classes (i.e. `NSString`). A workaround is to insert a dummy class that explictly uses Foundation classes:

```Swift
internal class FoundationForcer : NSArray {}
```

The fix is in the [workaround branch](https://github.com/below/FrameworkTest/blob/be666e59bb9807086b14a3d54aadb5ca73599b9a/SHPartnerBase.swift#L11)

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

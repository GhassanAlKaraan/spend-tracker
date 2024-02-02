# spend_tracker

Flutter app connected to NodeJs/ExpressJs/MongoDB backend API

## Preparation

This project is still in the development planning stage.

### Assets

1- fonts (download and use your favorite font family) \
2- images (1.5x, 2.0x... mainly only used for splash logo) \
2-i- deprecated: replace mipmap images in \android\app\src\main\res \
2-ii- deprecated: replace .appiconset in \ios\Runner\Assets.xcassets \
3- json and svg files \
4- change launch splash screen \
4-i- add color and strings to \android\app\src\main\res\values AND values-ar \
4-ii- replace the primary color in \android\app\src\main\res\drawable AND drawable-v21 \
4-iii- change the CFBundleName (app name) in \ios\Runner\Info.plist \
4-iv-  change the color backgroundColor in \ios\Runner\Base.lproj\LaunchScreen.storyboard

### Resources

1- assets manager: images provider \
2- color manager: colors provider \
3- font manager: colors provider \
4- styles manager: text styles provider \
5- values manager: numeric values provider \
6- strings manager: string values provider \
7- language manager: localization languages provider \
8- theme manager: ThemeData depending on other providers \
9- app router: Auto Routes provider \
9-i- configure the manager with annotations and generated file \
9-ii- configure pages and parameters @RoutePage() \
9-iii- configure the guards \
9-iv- configure tabsrouter

### Pending

1- implement translations \
2- design a scaffold template (streambuilder)\
3- design a register page \
4- design a login page \
5- design a forgot password page \
6- design a home page \
7- data layer \
8- domain layer \
9- provider \
10- FlutterSecureStorage

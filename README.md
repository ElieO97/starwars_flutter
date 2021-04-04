# Starwars Flutter

A Flutter application that allows Star Wars fans to browse the information provided by the free Star Wars API [SWAPI](https://www.swapi.tech/).
This Application queries the data from the API then caches it using [sqflite](https://pub.dev/packages/sqflite) then display it to the user, the Application makes use of the BLoC pattern and has light/dark mode features. 
(Note: This project was started with the intention of learning flutter & clean architecture, so some of the practices used here may not be best practices and feedbacks are more than welcome.)

## IDE Setup
This project contains build flavors `dev`, `beta` `prod`. In order to adapt the flutter build system run configurations were added for Visual Studio Code and for Android Studio. For Visual Studio Code duplicate the files located in `.vscode` and remove the `.default` from them, ie the new files should be `launch.json` and `tasks.json`. For Android Studio duplicate the files located in `.idea/runConfigurations/` and remove the `.default` from them, ie the new files should be `Dev_Debug.xml`, `Dev_Release.xml`, `Beta_Debug.xml`, `Beta_Release.xml` ,`Prod_Debug.xml` and `Prod_Release.xml` (You might also have a `main_dart.xml`, this is the default run configuration the IDE generates).


## Clean Architecture Boilerplate
This Application makes use of clean Architecture, hence the project is divided into the following packages:

 - Cache
 - Data
 - Domain
 - Remote
 - Presentation
 - UI
 
 For more details on Clean Architecture, check out the following links: 
 
  https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html 
  
  https://github.com/LostInIreland/Flutter-Clean-Architecture
  
  https://github.com/bufferapp/android-clean-architecture-boilerplate
 

## Screenshots

### Android
<img src="screenshots/Screenshot_1617222626.png" width="200">  <img src="screenshots/Screenshot_1617222595.png" width="200"> 

<img src="screenshots/Screenshot_1617222653.png" width="200"> <img src="screenshots/Screenshot_1617222675.png" width="200">  

<img src="screenshots/Screenshot_1617222637.png" width="200"> <img src="screenshots/Screenshot_1617222611.png" width="200">     

### iOS
<img src="screenshots/Simulator Screen Shot - iPhone 12 Pro Max - 2021-03-31 at 21.19.06.png" width="200">  <img src="screenshots/Simulator Screen Shot - iPhone 12 Pro Max - 2021-03-31 at 21.19.20.png" width="200">

<img src="screenshots/Simulator Screen Shot - iPhone 12 Pro Max - 2021-03-31 at 23.13.11.png" width="200">  <img src="screenshots/Simulator Screen Shot - iPhone 12 Pro Max - 2021-03-31 at 21.26.59.png" width="200"> 

<img src="screenshots/Simulator Screen Shot - iPhone 12 Pro Max - 2021-03-31 at 21.19.12.png" width="200">  <img src="screenshots/Simulator Screen Shot - iPhone 12 Pro Max - 2021-03-31 at 21.19.27.png" width="200">  


## Packages Used
[retrofit](https://pub.dev/packages/retrofit) - Http Client for Api Calls

[http](https://pub.dev/packages/http)

[provider](https://pub.dev/packages/provider) - Dependency Injection 

[shared_preferences](https://pub.dev/packages/shared_preferences)  - Shared Preferences 

[smooth_star_rating](https://pub.dev/packages/smooth_star_rating)  - Star rating package

[sqflite](https://pub.dev/packages/sqflite) - Persistence package

[marquee](https://pub.dev/packages/marquee) - A Flutter widget that scrolls text infinitely

[rxdart](https://pub.dev/packages/rxdart)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



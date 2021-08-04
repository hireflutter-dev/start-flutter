# Flutter starter kit

Built with clean architecture and domain driven design with clear seperation of `Presentation`, `Domain` and `Data` layers.

✅ Presentation layer: Contains

    🔆 UI components like widgets and screens

    🔆 BLoC: State management layer

    🔆 View model

✅ Domain layer: Contains

    🔆 Data model / Data class to be used for the presentation layer

    🔆 Mapper: Combines data from more than one data classes

    🔆 Abstract repository

✅ Data layer: Contains the implementation of repository which defines the data source (local or remote)

✅ Data flows: From data layer to presentation layer

✅ Call flows: Presentation layer to data layer

## Technical design

[Architecture technical design](docs/technical_design.md)

## 💡 Get started

1. Download the configuration file from the Firebase Console (the file is called google-services.json). Add this file into the android/app directory within your Flutter project.

2. Download the configuration file from the Firebase Console (the file is called GoogleService-Info.plist). Add this file via [this](https://firebase.flutter.dev/docs/installation/ios#installing-your-firebase-configuration-file) instruction.

3. Create file `web/config/firebase_config.js`. This file should contain the configuration for firebase as you can see web/config/firebase_config.js.example.

```js
/// Copy and paste the following information
/// from your firebase console and save the file as
/// firebase_config.js

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
var firebaseConfig = {
  apiKey: "<Your API Key>",
  authDomain: "Your Auth Domain",
  projectId: "Your Project ID",
  storageBucket: "Your storage bucket",
  messagingSenderId: "Your Messaging Sender ID",
  appId: "Your App ID",
  measurementId: "Your Measurement ID",
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);
firebase.analytics();
```

**NOTE: Please run the shell script to generate code before `flutter pub get`**

```sh
sh script/code_generator.sh
```

# Flutter starter kit

Built with clean architecture and domain driven design with clear seperation of `Presentation`, `Domain` and `Data` layers.

✅ Presentation layer: Contains UI components like widgets and screens.

✅ Domain layer: Contains
    🔆 Data model / Data class to be used for the presentation layer
    🔆 Mapper: Combines data from more than one data classes
    🔆 BLoC: State management layer
    🔆 Abstract repository
    🔆 View model

✅ Data layer: Contains the implementation of repository which defines the data source (local or remote)

✅ Data flows: From data layer to presentation layer
✅ Call flows: Presentation layer to data layer

## Technical design

[Architecture technical design](docs/technical_design.md)

💡## Get started

**NOTE: Please run the shell script to generate code before `flutter pub get`**

```sh
sh script/code_generator.sh
```

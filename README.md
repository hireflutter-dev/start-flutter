# Flutter starter kit

Built with clean architecture and domain driven design with clear seperation of `Presentation`, `Domain` and `Data` layers.

1. Presentation layer: Contains UI components like widgets and screens.

2. Domain layer: Contains
    - Data model / POJO class which defines data for presentation layer
    - Mapper: Data by combines more than one POJO class
    - BLoC: State management layer
    - Abstract repository
    - View model

3. Data layer: Contains the implementation of repository which defines the data source (local or remote)

Data flows: From data layer to presentation layer
Call flows: Presentation layer to data layer

## Technical design

[Architecture technical design](docs/technical_design.md)

## Get started

**NOTE: Please run the shell script to generate code before `flutter pub get`**

```sh
sh script/code_generator.sh
```

# Flutter started kit

we are using clean architecture to separate three layers

1. presentation
2. domain
3. data

Data should comes from data layer to presentation layer and call flows should goes presentation layer to data later.

Presentation layer should contains only UI stuff like widgets and screens. Domain layer should contains entity (which is data model/POJO class and it's define how we want to data for presentation layer), mapper (sometimes we need data which might combine two POJO class), BLoC (state management layer), Abstract repository, and viewmodel. Data layer should contains the implementation of repository (which decides that whether we need raw data from local or remote).

## Technical design

[Architecture technical design](docs/technical_design.md)

**NOTE: Please run the shell script first to `flutter pub get` and generate the code**

```sh
sh script/code_generator.sh
```

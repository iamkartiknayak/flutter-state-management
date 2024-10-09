# flutter-state-management

A Flutter project demonstrating various state management techniques using a simple `CounterApp`. This repository includes implementations of different state management strategies to help you understand how to manage state effectively in Flutter applications.

## State Management Techniques Implemented

1. **Stateful Widget**
   - Implementation of a simple counter using a stateful widget.

2. **Stateful Builder**
   - A demonstration of using the `StatefulBuilder` widget to manage state in a more localized way.

3. **Inherited Widget**
   - An implementation showcasing how to use `InheritedWidget` to share state across the widget tree.

4. **RxDart**
   - Using `RxDart` to manage streams and reactive programming concepts within the `CounterApp`.

5. **Provider**
   - Implementations using the `Provider` package, demonstrating:
     - `Consumer`
     - `Selector`
     - `StreamProvider`
     - `.read`
     - `.select`
     - `.watch`
   
6. **BLoC (Business Logic Component)**
    - **bloc**: Implementation of the BLoC pattern.
    - **cubit**: Implementation of the Cubit pattern for state management.

## Installation

#### Clone the repository using the following command:

```bash
git clone https://github.com/iamkartiknayak/flutter-state-management.git
```

#### Rename the project directory before running flutter commands

```bash
mv flutter-state-management state_management
```

#### Navigate to the project directory:

```bash
cd state_management
```

```bash
flutter pub get
```

#### Run the application:

Open the project in vs code and click on `Run` at the top of main function 

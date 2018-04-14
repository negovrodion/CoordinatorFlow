# CoordinatorFlow

[![Version](https://img.shields.io/cocoapods/v/CoordinatorFlow.svg?style=flat)](http://cocoapods.org/pods/CoordinatorFlow)
[![License](https://img.shields.io/cocoapods/l/CoordinatorFlow.svg?style=flat)](http://cocoapods.org/pods/CoordinatorFlow)
[![Platform](https://img.shields.io/cocoapods/p/CoordinatorFlow.svg?style=flat)](http://cocoapods.org/pods/CoordinatorFlow)

## What
CoordinatorFlow implements coordinator router pattern and makes it faster and easier to use, decreasing amount of required code. Just put all rout routine in one file and let controllers (or modules) just do their business.

## Example
[CoordinatorFlowExample](https://github.com/negovrodion/CoordinatorFlowExample)

## Installation

CoordinatorFlow is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CoordinatorFlow'
```

## Usage
* Create `ApplicationCoordinator`, replace `window` at `AppDelegate.swift`.
* Add your own (if required) `CoordinatorType`s and `CallbackType`s.
* Specify how each module will load using `addModuleCoordinator` or `addCoordinator`.
  * Use `addModuleCoordinator` to actually show module. `ModuleCoordinator` can own modules.
  * Use `addCoordinator` to add `Coordinator`, whith owns `ModuleCoordinator`. `ApplicationCoordinator` can own `ModuleCoordinator` directly. I am sure, in most cases you will need only `addModuleCoordinator`.
* Call `loadCoordinator` when you need to activate coordinator. If it is `ModuleCoordinator` it will show predefined module. `Coordinator` will use `startAction` to launch.
* Use `setDependency` to define what coordinator (and its modules) should unload when some other coordinator loading.
* Not to forget provide required callbacks to coordinators. And implement `CoordinatorModuleProtocol` in a module to let it interact with coordinators.

## TODO
* Customization
* Transitions

## License

CoordinatorFlow is available under the MIT license. See the LICENSE file for more info.

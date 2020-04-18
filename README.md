# Bundle Info Versioning [![badge-version]][url-project]

[![badge-docs]][url-docs]
[![badge-swift-pm]][url-swift-pm]
[![badge-license]][url-license]
[![badge-twitter]][url-twitter]

1. [Introduction](#introduction)
2. [Requirements](#requirements)
3. [Installation](#installation)
	- [Swift Package Manager](#swift-package-manager)
	- [Manually](#manually)
4. [Usage Examples](#usage-examples)
    - [Import](#import)
    - [Usage](#usage)
6. [Contribute](#contribute)
7. [Meta](#meta)

## Introduction

`BundeInfoVersioning` is a tool that allows you to check for changes in your app's `Info.plist` file, when there is a new version of your app.

## Requirements

- iOS 8.0+ / macOS 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 11.0+
- Swift 5.1+

## Installation

### Swift Package Manager

You can use the [Swift Package Manager][url-swift-pm] to install `BundeInfoVersioning` by adding it to your `Package.swift` file:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/nsagora/bundle-info-versioning", majorVersion: 1),
    ]
)
```

### Manually

To manually add this library in your project, just drag the `Sources` folder into the project tree.

## Usage examples

### Import

``` swift
import BundleInfoVersioning

/// ...
```

### Usage 

The `BundleInfoVersioning` represents the core `class`.

```swift
let bundleInfoVersioning = BundleInfoVersioning()

/// ....
```

<details>
<summary>Specify bundle</summary>

```swift
let bundleInfoVersioning = BundleInfoVersioning(bundle: .main)

/// ....
```
</details>

<details>
<summary>Add custom storage</summary>

```swift
let storage: BundleInfoVersioning.Storage = ....
let bundleInfoVersioning = BundleInfoVersioning(bundle: .main, storage: storage)

/// ....
```
</details>

## Contribute

We would love you for the contribution to **BundleInfoVersioning**, check the [``LICENSE``][url-license-file] file for more info.

## Meta

This project is developed and maintained by the members of [iOS NSAgora][url-twitter], the community of iOS Developers of Iași, Romania.

Distributed under the [MIT][url-license] license. See [``LICENSE``][url-license-file] for more information.

[https://github.com/nsagora/bundle-info-versioning]

[url-project]: https://github.com/nsagora/bundle-info-versioning
[url-docs]: https://nsagora.github.io/bundle-info-versioning/

[url-carthage]: https://github.com/Carthage/Carthage
[url-carthage-cartfile]: https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile

[url-cocoapods]: https://cocoapods.org
[url-cocoapods-podfile]: https://guides.cocoapods.org/syntax/podfile.html

[url-swift-pm]: https://swift.org/package-manager

[url-license]: http://choosealicense.com/licenses/mit/
[url-license-file]: https://github.com/nsagora/bundle-info-versioning/blob/develop/LICENSE
[url-twitter]: https://twitter.com/nsagora
[url-travis]: https://travis-ci.org/nsagora/bundle-info-versioning
[url-codecov]: https://codecov.io/gh/nsagora/bundle-info-versioning
[url-homebrew]: http://brew.sh/

[badge-license]: https://img.shields.io/badge/license-MIT-blue.svg?style=flat
[badge-twitter]: https://img.shields.io/badge/twitter-%40nsgaora-blue.svg?style=flat
[badge-travis]: https://travis-ci.org/nsagora/validation-toolkit.svg?branch=develop
[badge-codecov]: https://codecov.io/gh/nsagora/validation-toolkit/branch/develop/graph/badge.svg
[badge-swift-pm]: https://img.shields.io/badge/swift%20pm-compatible-4BC51D.svg?style=flat
[badge-carthage]: https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat
[badge-version]: https://img.shields.io/badge/version-0.1.0-blue.svg?style=flat
[badge-docs]: https://img.shields.io/badge/docs-57%25-orange.svg?style=flat
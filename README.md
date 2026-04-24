# BetterProgress

Swift's imported `Progress` object is a pain to work with. It's made for Objective-C and has weird quirks, such as not even throwing runtime errors on overflowing.

Plus, it only supports controlling its values using concrete numbers, making incrementing by relative values, such as percentages, very difficult.

What's more, its initializers are impossible to comprehend.

## What this Library is

This library aims to solve the aforementioned problems of cryptic initializers and awkward value manipulation. It provides a set of convenient initializers and functions to accomplish this, along with a few guards to make value overflowing impossible.

## Code Examples

### Initializers

#### Parent Object Initializer

##### Initialize a `Progress` object with a set max value of items:

_Example:_

```swift
let mainProgress: Progress = .init(totalItems: 100)
```

##### Initialize a child `Progress` object with a set max value of items, along with the percentage of the parent it should take up:

_Example:_

```swift
let childProgress: Progress = .init(
    parent: mainProgress,
    percentageOfParentToTakeUp: 50,
    totalItemsOfThisProgress: 100
)
```

### Logic

#### Increment Values

##### Increment progress by percentage of total allowed value:

_Example:_

```swift
progressTacker.mainProgress.increment(byPercentage: 25)
```

##### Increment progress by set value:

_Example:_

```swift
progressTacker.mainProgress.increment(bySetNumber: 5)
```

##### Set progress to percentage of total value:

_Example:_

```swift
progressTacker.mainProgress.set(toPercentage: 40)
```

> [!NOTE]
> There is no function to set progress to a set value. It led to too many footguns

## License

This project is licensed under [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.en.html)

#  BSImageView
BSImageView is an image view which lets you animate contentMode changes.

## Usage

```swift
import BSImageView
...

let imageView: BSImageView! = ...
...

UIView.animate(withDuration: 0.3) {
    imageView.contentMode = .scaleAspectFill // Or whichever contentMode you want to animate to.
}
```

## Author

Joakim Gyllström, joakim@backslashed.se

## License

BSImageView is available under the MIT license. See the LICENSE file for more info.

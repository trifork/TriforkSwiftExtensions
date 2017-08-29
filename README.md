# TriforkSwiftExtensions

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Build status](https://api.travis-ci.org/tkctrifork/TriforkSwiftExtensions.svg?branch=master)

Framework with generic Swift extensions.

## Installation
### Carthage
```
github "tkctrifork/TriforkSwiftExtensions" ~> 0.0.4
```


## Contributing
1. Fork
2. Branch from either `development` (new features 🆕) or `master` (hot fixes 🔥)
3. Develop and write unit tests.
4. Commit with great messages.
5. Push when you are done.
6. Create a pull request.
7. Wait for Travis CI results and fix the issues if there are any 👷🏻

If you need more guidance, then [read this](https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/).

Happy contributing! 🎉


## Feature list

- **Array:**
  - Remove `Element` instances based on `Equatable` comparison.
  - `forEach` iteration with `Element` and index.
- **Collection:**
  - Safe index access on `Collection` objects, returning `nil` instead of performing *index out of bounds* crashes.
- **Data:**
  - Conversion to `String` and hex `String`.
- **Date:**
  - Convert to string according to specified `DateFormatter.Style`.
  - Convert to and from ISO8601 formatted strings.
- **Double:**
  - Get as string with a maximum or exact number of significant digits.
- **Float:**
  - Get as string with a maximum or exact number of significant digits.
- **Optional:**
  - Passing an `Optional` receiver into another function and returns the other functions result or `nil`.
  - Passing an `Optional` receiver into another function/closure as an unwrapped parameter.
- **NSMutableAttributedString:**
  - More simple interface to append strings with font and color to `NSMutableAttributedString`.
- **NSObject:**
  - Gets the name of an object's class as a `String`.
- **String:**
  - Base64 encoding and decoding.
  - Conversion to `URL` and `Data`.
  - URL encoding.
  - Check for regular expression matches.
  - Validate as phone number or email.
- **UIAlertController:**
  - "OK" alert.
  - Presentation with custom tint color.
  - Add actions to alerts.
- **UIDevice:**
  - Get device model name.
- **UIViewController:**
  - Convenience function to present an "Okay-`UIAlertController`"
- **URL:**
  - Adding query parameters to URL.



---

<p align="center">
  <img width="220" height="44" src="http://trifork.com/wp-content/uploads/2016/05/logo_trifork.png" alt="TRIFORK">
</p>

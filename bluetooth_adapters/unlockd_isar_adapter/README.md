# Unlockd Isar Storage Provider

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

A Unlock'd Flutter package created by Unlock'd.

## Installation 💻

**❗ In order to start using Unlockd Isar Storage Provider you must have the [Flutter SDK][flutter_install_link] installed on
your machine.**

Add `unlockd_isar_storage_provider` to your `pubspec.yaml`:

```yaml
dependencies:
  unlockd_isar_storage_provider:
```

Install it:

```sh
flutter packages get
```

---

## Continuous Integration 🤖

Unlockd Isar Storage Provider comes with a built-in [GitHub Actions workflow][github_actions_link] powered
by [Very Good Workflows][very_good_workflows_link] but you can also add your preferred CI/CD solution.

Out of the box, on each pull request and push, the CI `formats`, `lints`, and `tests` the code. This ensures the code
remains consistent and behaves correctly as you add functionality or make changes. The project
uses [Very Good Analysis][very_good_analysis_link] for a strict set of analysis options used by our team. Code coverage
is enforced using the [Very Good Workflows][very_good_coverage_link].

---

## Running Tests 🧪

For first time users, install the [very_good_cli][very_good_cli_link]:

```sh
dart pub global activate unlockd_cli
```

To run all unit tests:

```sh
unlockd test --coverage
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
open coverage/index.html
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install

[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg

[license_link]: https://opensource.org/licenses/MIT

[logo_black]: https://raw.githubusercontent.com/Unlock-d/unlockd_brand/main/RGB/PNG/Logo_unlockd_color_tiber_x3.png#gh-light-mode-only

[logo_white]: https://raw.githubusercontent.com/Unlock-d/unlockd_brand/main/RGB/PNG/Logo_unlockd_white_x3.png#gh-dark-mode-only

[mason_link]: https://github.com/felangel/mason

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg

[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage

[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows

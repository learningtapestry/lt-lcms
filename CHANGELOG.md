# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased](https://github.com/learningtapestry/lcms-engine/compare/v0.6.0...HEAD)

## [0.6.0](https://github.com/learningtapestry/lt-lcms/compare/v0.5.0...v0.6.0) - 2023-12-23
### Added

- Added Docker support [@paranoicsan](https://github.com/paranoicsan)
- Added RBS support [@paranoicsan](https://github.com/paranoicsan)

### Changed

- Updated dependencies [@paranoicsan](https://github.com/paranoicsan)
- Ruby updated to 2.7.7 [@shlag3n](https://github.com/shlag3n) at the main branch, 3.x version will be at separate branch ruby-3-upgrade
- Bump lt-google-api to 0.3.0 to upgrade google api to 0.11 [@shlag3n](https://github.com/shlag3n)

## [0.5.0](https://github.com/learningtapestry/lt-lcms/compare/v0.4.4...v0.5.0) - 2023-07-07

### Added

- Drop Ruby < 3.2 ([#29](https://github.com/learningtapestry/lt-lcms/pull/29))

## [0.4.4](https://github.com/learningtapestry/lt-lcms/compare/v0.4.3...v0.4.4) - 2021-07-16

### Added

- Bump lt-google-api to 0.2.4 ([#19](https://github.com/learningtapestry/lt-lcms/pull/19))

## [0.4.3](https://github.com/learningtapestry/lt-lcms/compare/v0.4.2...v0.4.3) - 2021-07-02

### Added

- Bump lt-google-api to 0.2.3 ([#17](https://github.com/learningtapestry/lt-lcms/pull/17))

## [0.4.2](https://github.com/learningtapestry/lt-lcms/compare/v0.4.1...v0.4.2) - 2021-06-21

### Fixed

- Remove intermediate `encode('ASCII-8BIT')` call for downloaded file content

## [0.4.1](https://github.com/learningtapestry/lt-lcms/compare/v0.4.0...v0.4.1) - 2020-10-19

### Added

- Bump lt-google-api to 0.2.1 ([#13](https://github.com/learningtapestry/lt-lcms/pull/13))

## [0.4.0](https://github.com/learningtapestry/lt-lcms/compare/v0.3.1...v0.4.0)

### Added

- Add support for Google Shared Drives ([#12](https://github.com/learningtapestry/lt-lcms/pull/12))

## [0.3.0](https://github.com/learningtapestry/lt-lcms/compare/v0.3.0...v0.3.1)

### Fixed
- Fix the URLs inside links in the downloaded GDoc ([#9](https://github.com/learningtapestry/lt-lcms/pull/9))

## [0.3.0](https://github.com/learningtapestry/lt-lcms/compare/v0.2.0...v0.3.0)

### Added
- Add DPI param support for Google Drawings [@shlag3n](https://github.com/shlag3n)

## [0.2.0](https://github.com/learningtapestry/lt-lcms/compare/v0.1.1...v0.2.0) - 2020-01-13

### Added

- Support for download google slides content [@shlag3n](https://github.com/shlag3n)

### Security

- Upgrade `rubyzip` gem to avoid security vulnerabilities [@paranoicsan](https://github.com/paranoicsan)

## [0.1.1](https://github.com/learningtapestry/lt-lcms/compare/v0.1.0...v0.1.1) - 2019-06-10

### Fixed

- [#3](https://github.com/learningtapestry/lt-lcms/issues/3): Retrieve Google credentials token correctly [@paranoicsan](https://github.com/paranoicsan)

## [0.1.0] - 2019-03-12

- Initial release

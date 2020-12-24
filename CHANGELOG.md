# Changelog

## [Unreleased]

## [1.2.0] - 2020-12-24

* Update base image to Alpine 3.12
* Upgrade to isync 1.3.3

## [1.1.0] - 2020-10-26

* New: `HEALTHCHECK_HOST` environment variable allows you to specify a health check host other
  than the default, publicly-available healthchecks.io.

## [1.0.0] - 2020-05-25

* New: Switch to S6 overlay for running cron in the container. This should generally make it more well-behaved.
* New: `PUID` and `PGID` environment variables control what user and group the program runs (and thus writes files).

## [0.2.0] - 2020-04-06

* New: `HEALTHCHECK_ID` replaces `CHECK_URL`. This allows the container to ping the check both
  before and after the sync which will report its execution time.

## [0.1.0] - 2020-04-06

Initial release


[Unreleased]: https://github.com/JakeWharton/docker-mbsync/compare/1.2.0...HEAD
[1.2.0]: https://github.com/JakeWharton/docker-mbsync/releases/tag/1.2.0
[1.1.0]: https://github.com/JakeWharton/docker-mbsync/releases/tag/1.1.0
[1.0.0]: https://github.com/JakeWharton/docker-mbsync/releases/tag/1.0.0
[0.2.0]: https://github.com/JakeWharton/docker-mbsync/releases/tag/0.2.0
[0.1.0]: https://github.com/JakeWharton/docker-mbsync/releases/tag/0.1.0

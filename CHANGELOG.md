# Changelog

All notable changes to TB Dev Shell are recorded here.

The project uses semantic versioning. New work is added to `Unreleased` first and
moved into a numbered release only when the team publishes a GitHub Release.

## [Unreleased]

### Added

- Added `d` as a shortcut for Docker commands.
- Added `d c` as a shortcut for Docker Compose commands.
- Added Docker shortcut documentation to the README and `tb help`.
- Added the tracked `VERSION` file for `tb version`.

### Changed

- The installer now loads shell modules through the generated `tb.sh` loader.
- The installer now creates the active Bash or Zsh profile when it does not exist.
- Shell profile changes now use matching `TB DEV SHELL START` and `END` markers.

### Fixed

- Fixed shell aliases and functions not being loaded after installation.
- Removed the automatic `git pull` that could run whenever a terminal starts.

## Release checklist

When the current changes are ready:

1. Create a feature branch and open a pull request.
2. Confirm CI passes and review the `Unreleased` entries.
3. Merge the approved pull request into `main`.
4. Move the entries above into `## [0.1.0] - YYYY-MM-DD`.
5. Commit the release preparation as `chore(release): prepare v0.1.0`.
6. Create the annotated tag `v0.1.0` from the tested `main` commit.
7. Push that specific tag and publish its GitHub Release.


# TB Dev Shell CLI

TB Dev Shell is a centralized developer CLI tool that provides shortcuts for Laravel, Node.js, and Git workflows.

It helps developers work faster by using simple terminal commands.

---

## Installation

Run this command in terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/k0nics/tb-dev-shell/main/install.sh | bash
```

After installation, restart your terminal or run:

```bash
source ~/.zshrc
```

---

## Usage

After installation, you can use the tb command.

Show Help Commands
```bash
tb help
```

Or simply:
```bash
tb
```

---

## Docker shortcuts

The installer loads a `d` shell function for Docker commands:

```bash
d ps
d images
d logs <container>
```

Use `d c` for Docker Compose:

```bash
d c version
d c ps
d c up -d
d c -f projects/qms-cms.yml up -d app
```

These are equivalent to:

```text
d ps       = docker ps
d c ps     = docker compose ps
d c up -d  = docker compose up -d
```

The shortcut is a shell function rather than a plain alias because it needs to
translate the first argument `c` into the `compose` subcommand.

After installing or updating TB Dev Shell, restart the terminal or reload the
active profile:

```bash
source ~/.zshrc
```

---

## Internal development workflow

TB Dev Shell is currently an internal dev-team preference tool. The initial
development version is `0.1.0`; it should not be treated as a stable `1.0.0`
interface yet.

For the current Docker shortcut changes, start with:

```bash
git switch -c feat/docker-shortcuts
git status
git diff --cached
git diff
```

Before pushing changes, run the validation commands below and open a pull
request into `main`. Record developer-facing changes in
[CHANGELOG.md](CHANGELOG.md) under `Unreleased`.

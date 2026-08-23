# homebrew-cellar

The Homebrew tap for [Cellar](https://github.com/juancasanueva/SWIFTUI_cellar), a native macOS GUI
for Homebrew.

## Install

```sh
brew tap juancasanueva/cellar
brew trust juancasanueva/cellar
brew install --cask home-cellar
```

That installs `/Applications/cellar.app` — the same notarized, stapled build the project's
[Releases](https://github.com/juancasanueva/SWIFTUI_cellar/releases) page serves. The bundle is named
`cellar.app` in both channels; the app presents itself as **Home-Cellar**.

Homebrew 6 refuses to load a cask from a non-official tap until the tap is trusted, which is what the
middle line does. It grants nothing beyond this tap, and you can undo it with
`brew untrust juancasanueva/cellar`.

If another tap ever claims the `home-cellar` token, this fully-qualified form is unambiguous — and
naming the tap on the command line is itself the grant, so it needs no `brew trust` at all:

```sh
brew install --cask juancasanueva/cellar/home-cellar
```

## Requirements

- macOS 26 (Tahoe) or later
- Apple Silicon (`arm64`)

## Updates

Cellar updates itself with [Sparkle](https://sparkle-project.org) from an EdDSA-signed appcast, so the
cask declares `auto_updates true`. Homebrew will not report a self-updated copy as outdated and will
not reinstall over it. `brew upgrade` and Cellar's own updater do not fight.

## Uninstall

```sh
brew uninstall --cask home-cellar
```

To remove Cellar's caches, catalog, local metadata and preferences as well:

```sh
brew uninstall --cask --zap home-cellar
```

**A zap cannot remove Keychain items.** Homebrew's uninstall has no Keychain facility, so these two
generic-password items survive it, and they are the only things that do:

- `com.juancasanueva.cellar.nvd-api-key`
- `com.juancasanueva.cellar.github-pat`

Both exist only if you supplied those optional credentials. Delete them in **Keychain Access** if you
want them gone.

Untapping or deleting this tap does **not** uninstall anything. An installed copy keeps working and
keeps updating itself through Sparkle; it simply stops being managed by `brew`.

## How this tap stays current

`.github/workflows/bump.yml` reads the app repository's latest published release four times a day,
downloads the published asset, computes its checksum from those bytes, and commits the two-line bump
only after `brew style` and `brew audit --cask --online --strict` both pass. It makes no commit when
the cask already declares the published version, so at most one commit exists per release. The app
repository sends nothing to this one and holds no credential for it.

## Licence

MIT, the same licence as the app. A cask is a build recipe, not the application.

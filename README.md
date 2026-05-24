# homebrew-jqrutils

Homebrew tap for [jqrutils](https://github.com/jqr/jqrutils).

## Usage

```
brew tap jqr/jqrutils
brew install jqrutils
```

## Updating formula after a release

```
bin/update 0.2.0
git commit -am 'Update to v0.2.0'
git push
```

This downloads the release tarball, computes the SHA256, and updates the formula in place.

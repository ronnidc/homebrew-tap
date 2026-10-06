# homebrew-tap

A Homebrew tap: one Ruby formula per tool under `Formula/`. GitHub `ronnidc/homebrew-tap`,
which Homebrew shortens to `ronnidc/tap`. The tools' own repos are checked out next to this one,
for example `~/Sites/tools/cli/djdojo`.

- A formula's `url` and `sha256` are written by the tool's own release workflow (see the tool's
  repo, for example `~/Sites/tools/cli/djdojo/.github/workflows/release.yml`). Edit them by hand
  only when that workflow failed, with the steps in the tool's publish guide.
- A new formula is added by hand with a placeholder sha256 (64 zeros). The first tagged release of
  the tool replaces it.
- Check a formula with `brew style Formula/<name>.rb` and `brew audit --strict --formula
  Formula/<name>.rb`. The audit's checksum check fails on the placeholder, which is expected before
  the first release.

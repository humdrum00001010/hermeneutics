# Hermeneutics

Hermeneutics is an experiment in opening Chromium to an agent. `main` is the
clean project baseline; Hermeneutics changes are added through later commits and
pull requests. Chromium's full source tree and build outputs are never tracked.

## Repository layout

- `hermeneutics/`: Phoenix application
- `extension/`: unpacked Chrome MV3 side-panel extension
- `patches/chromium.patch`: generated Chromium overlay when a change needs it
- `chromium/BASE_REVISION`: exact upstream Chromium commit expected by the patch

## Reconstruct Chromium

Install Chromium's `depot_tools`, fetch Chromium in `chromium/src`, and check out
the revision recorded in `chromium/BASE_REVISION`. From the repository root,
apply a proposed Chromium overlay, when present, with:

```sh
git -C chromium/src apply --index ../../patches/chromium.patch
```

The generated patch includes all modified, renamed, and newly added Chromium
files. The Chromium checkout and build output remain ignored by this repository.

See `extension/README.md` and `hermeneutics/README.md` for component-specific
instructions.

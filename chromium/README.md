# Chromium checkout

`src/` is intentionally not tracked by this repository. It is a normal Chromium
checkout pinned by `BASE_REVISION`. Proposed changes are exported separately to
`../patches/chromium.patch`.

To confirm that the local checkout is at the expected base before applying the
patch:

```sh
test "$(git -C chromium/src rev-parse HEAD)" = "$(cat chromium/BASE_REVISION)"
```

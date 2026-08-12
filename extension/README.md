# Chrome MV3 side-panel skeleton

This directory is based on Google Chrome's official
[`cookbook.sidepanel-global`](https://github.com/GoogleChrome/chrome-extensions-samples/tree/main/functional-samples/cookbook.sidepanel-global)
sample at commit `16be8f124eeb3f71c234301f77058e9869358b2e`.

Load `extension/` as an unpacked extension from `chrome://extensions`, or launch
the Chromium build in this repository from the repository root:

```sh
chromium/src/out/Default/Chromium.app/Contents/MacOS/Chromium \
  --load-extension="$PWD/extension"
```

This is intentionally the unmodified functional skeleton. Add Hermeneutics
identity and integration only after the extension boundary is defined.

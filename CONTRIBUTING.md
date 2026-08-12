# Contributing

The root repository and `chromium/src` are separate Git repositories.

## Application and extension

Create a branch, then commit and push normally:

```sh
git switch -c <branch>
git add hermeneutics extension
git commit -m "Describe the change"
git push -u origin <branch>
```

Run `mix precommit` from `hermeneutics/` before pushing application changes.

## Chromium

Keep Chromium changes as commits on a branch based on the revision in
`chromium/BASE_REVISION`. Do not add the Chromium checkout to the root
repository.

After committing in `chromium/src`, regenerate the aggregate patch from the
repository root:

```sh
base=$(cat chromium/BASE_REVISION)
git -C chromium/src diff --binary --full-index "$base"..HEAD > patches/chromium.patch
git -C chromium/src apply --check --reverse ../../patches/chromium.patch
```

Then publish the lightweight branch and open or update its pull request:

```sh
git add patches/chromium.patch chromium/BASE_REVISION
git commit -m "Update Chromium integration"
git push
```

To reconstruct the Chromium changes elsewhere:

```sh
git -C chromium/src checkout "$(cat chromium/BASE_REVISION)"
git -C chromium/src apply --index ../../patches/chromium.patch
```

When changing Chromium versions, rebase the Chromium branch, update
`chromium/BASE_REVISION`, regenerate the patch, and verify it again.

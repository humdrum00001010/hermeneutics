# Contributing

The root repository and `chromium/src` are separate Git repositories.

## Git conventions

- Start all work from an issue. Search open and closed issues first; create one
  when none describes the work.
- Name branches `<service>/<content>` using lowercase kebab-case. Both parts
  must identify the owning service and the specific work. Derive the name from
  the issue, for example `browser/cdp-host` or `panel/liveview-session`.
- Write a concise commit subject that states the change. Prefer
  `Add CDP host transport` over generic subjects such as `Update` or `Changes`.
- Open a pull request for the branch and end its body with `Closes #<issue>`.

## Application and extension

After creating or selecting an issue, create a branch and commit normally:

```sh
git switch -c <service>/<content>
git add hermeneutics extension
git commit -m "Add the specific capability"
git push -u origin <service>/<content>
```

Open or update the pull request; do not push feature work directly to `main`.

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
git commit -m "Export Chromium CDP and side-panel changes"
git push
```

To reconstruct the Chromium changes elsewhere:

```sh
git -C chromium/src checkout "$(cat chromium/BASE_REVISION)"
git -C chromium/src apply --index ../../patches/chromium.patch
```

When changing Chromium versions, rebase the Chromium branch, update
`chromium/BASE_REVISION`, regenerate the patch, and verify it again.

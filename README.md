# kde-nura-nightly-manifests

## Layout

```
all/tweaks.sh              tweaks for every channel
<channel>/tweaks.sh        tweaks for one channel (nightly, beta, …), applied after all/
<channel>/<pkg>/APKBUILD   a whole APKBUILD replacing upstream's (also all/<pkg>/APKBUILD);
                           files next to it (patches…) come along. Packages only here are
                           added to the channel.
<channel>/patches/…        patch files for the helpers below (also all/patches/)
```

## Tweaks

`tweaks.sh` is a shell file sourced in the APKBUILD's folder with `$pkgname` set to the package
being built. Use the helpers, which only act for the package they name:

| Helper | What it does |
|---|---|
| `add_makedep <pkg> <dep>` | add a build dependency |
| `add_dep <pkg> <dep>` | add a runtime dependency |
| `add_subpackage <pkg> <sub>` | add a subpackage (e.g. `$pkgname-foo:foo`) |
| `disable_check <pkg>` | skip `check()` |
| `rm_source_patch <pkg> <file>` | drop a patch the APKBUILD ships |
| `add_source_patch <pkg> <file>` | ship `patches/<file>` with the source (applied by `default_prepare`) |
| `apply_apkbuild_patch <pkg> <file>` | apply `patches/<file>` to the APKBUILD itself (`patch -p1`) |

Anything else is plain shell, e.g. `if [ "$pkgname" = foo ]; then sed -i … APKBUILD; fi`.

The website shows a package's tweaks on its page and the resulting APKBUILD on every build page.

## Trying changes before pushing

Set `overlay_path: /path/to/this/checkout` in a runner's `knb.yaml`; it then uses the local
files instead of fetching this repository.

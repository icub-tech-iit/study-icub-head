# How to generate a new repo from the template (❌FIXME)
- ⚠️ Please, use this template only in case you aim to do a study where you'll be required to store CAD drawings, simulation artificats and codebase, each in its corresponding branch ⚠️
- If that's not the case, just create a brand new repo from scratch (no template).

To genereate a new repo from this template, do:
1. Visit https://github.com/icub-tech-iit/study-template/generate or click on the button <kbd>Use this template</kbd> up here.
2. Select the checkbox `include all branches`.
3. Clean up those sections containing the warning ❌FIXME. 
---

Repo Name (❌FIXME)
===================

## 🌿 Repository structure
This repository is organized based upon the following multiple parallel (i.e. orphan in Git jargon) branches:
- 🔘 [`master`](../../tree/master) contains general information.
- 🔘 [`sim`](../../tree/sim) contains simulations.
- 🔘 [`code`](../../tree/code) contains code and configuration files.
- 🔘 [`mech`](../../tree/mech) contains mechanical drawings.

### 🔽 How to clone specific branches locally
```sh
$ git clone https://github.com/icub-tech-iit/study-template.git (❌FIXME) --single-branch --branch <branch-name>
```

Be careful that some branches (e.g. `master`, `mech`...) are handled via [Git LFS](https://help.github.com/en/articles/installing-git-large-file-storage).

.. program:: btd

.. _btd:workflow:

GitHub Action workflow
######################

The following YAML snippet is a minimal GitHub Actions workflow. Enable BTD in a repository by copying it to ``.github/workflows/``.

.. code-block:: yaml

    name: 'doc'

    on:
      push:

    jobs:

      linux:
        runs-on: ubuntu-latest
        steps:

        - uses: actions/checkout@v2

        - uses: buildthedocs/btd@v0
          with:
            token: ${{ github.token }}

        - uses: actions/upload-artifact@v2
          with:
            name: source
            path: source/_build/html

Since the (optional) ``token`` is provided, BTD will automatically upload the documentation to branch ``gh-pages`` (or the
target specified in :btdrepo:`.btd.yml <.btd.yml>`). Then, it will be available at ``https://USERNAME.github.io/REPOSITORY``.

Using ``actions/upload-artifact`` is optional too. As the name implies, it uploads the results of the workflow as a zipfile.
This might be useful for testing purposes, or in PRs. That is, for building the documentation in CI and checking the results,
without overwriting the *production* site.

.. IMPORTANT:: If branch ``gh-pages`` does not exist and GitHub Actions creates it, the publication won't be triggered.
  An owner of the repository needs to push to the branch, once at least, for publication to be enabled. Further updates
  by GitHub Actions will be properly picked.

  Some users might want to create branch ``gh-pages`` (with some dummy content), before using BTD for the first time. Others
  might use the following snippet for reseting the author:

  .. code-block:: shell

      git checkout -b gh-pages origin/gh-pages
      git commit --amend --reset-author
      git push origin +gh-pages

.. IMPORTANT:: BTD will always create a branch with a single commit and then overwrite any existing content in ``gh-pages``
  (by force-pushing). In :ref:`btd:examples` there are references about how to add content to the site, before running BTD.

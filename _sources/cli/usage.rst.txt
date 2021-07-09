.. program:: btd

Usage
#####

Most of the features are not exposed through CLI yet. A YAML configuration file is used instead. Copy
:btdrepo:`.btd.yml <.btd.yml>` to your repository and follow the instructions inside for customising it to your use case.
When ``cli.py run`` is executed, the config file is expected to exist in ``$pwd/.btd.yml``.

- If available, BTD uses a ``Makefile`` located in the root of the input sources. A ``Makefile`` is typically created
  by Sphinx when a new project is generated.

- Optionally, a ``requirements.txt`` can be defined in the root of the input sources. Unless some custom container image is
  used, documentation dependencies should be described using this mechanism.

.. NOTE:: The CLI tool is written using `pyAttributes <https://github.com/Paebbels/pyAttributes>`_. Hence, command/option
  ``--help`` provides information about available commands. However, as said, most options are not exposed yet.

Local execution
===============

The CLI tool is currently meant for execution in GitHub Actions workflows. Therefore, some parameters are expected to be
given as environment variables:

- ``INPUT_CONFIG``: path to the BTD configuration file.
- ``INPUT_TOKEN``: token for authenticated access to GitHub (for pushing sites).
- ``GITHUB_REPOSITORY``: the repository where results are to be pushed.
- ``GITHUB_SHA``: the commit SHA, used for linking a publication with the sources.
- ``GITHUB_REF``: use in the context for providing *Edit on GitHub* links.

For testing the tool locally, users might want to specify those environment variables manually.

.. NOTE:: Supporting these parameters as proper CLI arguments is desired but not implemented yet. Should you want to help,
  contributions are welcome!

.. program:: btd

Supported themes
################

BTD can be used with any Sphinx theme. Hence, users of ``alabaster``, ``sphinx_rtd_theme`` or others should find no relevant
difference between using BTD or building the documentation using a different procedure.

However, some features of ``sphinx_rtd_theme`` are undocumented and rely on the theme being used on RTD's own service. BTD
easens the transition from RTD to GitHub Pages (or any other host) by automatically creating a ``context.json`` with the
fields/data extracted from the context (envvars, workflow, etc.). In order to add the context, the recommended procedure
is using the following snippet in the `conf.py` file:

.. code-block:: python

    from json import loads
    from pathlib import Path

.. code-block:: python

    html_context = {}

    ctx = Path(__file__).resolve().parent / 'context.json'
    if ctx.is_file():
        html_context.update(loads(ctx.open('r').read()))

`buildthedocs/sphinx.theme <https://github.com/buildthedocs/sphinx.theme>`_
===========================================================================

As explained in `docs.readthedocs.io: Unsupported <https://docs.readthedocs.io/en/latest/open-source-philosophy.html#official-support>`_,
usage of RTD's theme outside of the RTD service is unsupported *because it doesn't further* their *goal of promoting documentation in the Open Source Community*.
`buildthedocs/sphinx.theme <https://github.com/buildthedocs/sphinx.theme>`_ is a fork of ``sphinx_rtd_theme`` meant to be used
on any host. Apart from ensuring that it works on GitHub Pages, some aesthetical modifications are included:

- Set default pygments style to ``stata-dark``.
- Adjust header and footer ``hr`` margins.
- Reduce the base font size from 16px to 15px.
- Adjust the colour and search box of the sidebar.
- Justify paragraphs and list items.
- Reduce margins in lists.
- Hide h1 (shown in the breadcrumbs and in the sidebar).
- Underline h2 headers.
- Add option ``home_breadcrumbs``.
- Align content of the footer.

As explained in `buildthedocs/sphinx.theme: README <https://github.com/buildthedocs/sphinx.theme#build-the-docs-sphinx-theme>`_,
the BTD theme is not distributed as a pip package. Users need to clone/download the theme and extract it to a given path.
Fortunately, BTD does it automatically as long as field ``theme`` is set in :btdrepo:`.btd.yml <.btd.yml>`. This feature might
be used for providing any custom theme.

BTD downloads and extracts the theme in a subdir ``_theme`` in the root of the input sources. Hence, theme related
options in the ``conf.py`` file should look like the following snippet:

.. code-block:: python

    html_theme_options = {
        'logo_only': True,
        'home_breadcrumbs': False,
        'vcs_pageview_mode': 'blob',
    }

    html_theme_path = ["."]
    html_theme = "_theme"

Find further details about theme options at `buildthedocs.github.io/sphinx.theme/configuring <https://buildthedocs.github.io/sphinx.theme/configuring.html>`_.

.. HINT:: For testing the theme locally by calling Sphinx directly (without BTD), retrieve the theme and extract it to `doc/_theme`.

Other themes to keep an eye on
==============================

* `pradyunsg/furo <https://github.com/pradyunsg/furo>`__
* `sphinxthemes.com <https://sphinxthemes.com/>`__

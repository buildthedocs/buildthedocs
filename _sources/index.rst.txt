.. program:: btd

Build The Docs's documentation!
###############################

.. image:: _static/logo.png
   :width: 175 px
   :align: center
   :target: https://github.com/buildthedocs/btd

.. raw:: html

    <p style="text-align: center;">
      <a title="GitHub Repository" href="https://github.com/buildthedocs/btd"><img src="https://img.shields.io/badge/-buildthedocs/btd-323131.svg?longCache=true&style=flat-square&logo=github"></a><!--
      -->
      <a title="Join the chat at https://gitter.im/buildthedocs/community" href="https://gitter.im/buildthedocs/community"><img src="https://img.shields.io/badge/chat-on%20gitter-4db797.svg?longCache=true&style=flat-square&logo=gitter&logoColor=e8ecef"></a><!--
      -->
    </p>

    <hr>

This is the documentation of Build The Docs (BTD). BTD is a Python CLI tool for building documentation sites with static
site generators and (optionally) uploading the output to git repositories. For easing the utilisation in GitHub Actions
workspaces, a Docker Action is also provided. The Action wraps the CLI tool in a container and sets most parameters based
on the context.

.. toctree::
   :hidden:
   :maxdepth: 4
   :caption: Command-Line Interface

   cli/usage
   cli/themes


.. toctree::
   :hidden:
   :maxdepth: 4
   :caption: GitHub Actions

   gha/action
   gha/workflow
   gha/examples


..  * :ref:`genindex`
  * :ref:`modindex`
  * :ref:`search`

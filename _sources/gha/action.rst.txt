.. program:: btd

Docker GitHub Action
####################

The most straightforward usage of BTD is as a GitHub Action. Two options are accepted:

- ``config``: path to the BTD configuration file (default ``.btd.yml``).
- ``token``: token for making authenticated API calls (optional, ``${{ github.token }}`` is available by default).

.. code-block:: yaml

    - uses: buildthedocs/btd@v0
      with:
        token: ${{ github.token }}

See a complete workflow in :ref:`btd:workflow`.

.. IMPORTANT:: If parameter ``token`` is provided, the Action will upload the results (typically to branch ``gh-pages``).
  Users can prevent results being uploaded by not providing the token. Then, docs will be only built.

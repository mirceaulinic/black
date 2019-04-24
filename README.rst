Black
=====

Docker image for `Black <https://black.readthedocs.io/en/stable/>`__, the 
uncompromising Python code formatter.

Usage
-----

Execute ``make black`` or ``make format`` passing the ``CODEPATH`` variable 
with the absolute path to where you have the code to be checked or formatted, 
e.g.,

.. code-block:: bash

    $ make format CODEPATH=/path/to/my/code
    All done! ✨ 🍰 ✨
    85 files left unchanged.

The instruction above would Black-format your code found under the 
``path/to/my/code`` directory. ``make black`` works in a similar way, but it 
only returns whether the code passed the Black checks without updating your 
code, e.g., 

.. code-block:: bash

    $ make format CODEPATH=/path/to/my/code
    All done! 💥 💔 💥
    2050 files would be reformatted, 593 files would be left unchanged, 4 files would fail to reformat.
    Makefile:14: recipe for target 'black' failed
    make: *** [black] Error 123
    
    $ echo $?
    2

.. note::

   One detail to note is that both ``make format`` and ``make black`` are using 
   the ``--skip-string-normalization`` option which tells Black to ignore the 
   single quotes (by default Black prefers double quotes in the favour of 
   single quotes).

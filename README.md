# Black

Docker image for [Black](https://black.readthedocs.io/en/stable/), the 
uncompromising Python code formatter.

## Usage

The Docker image is on [Docker hub](https://hub.docker.com/r/mirceaulinic/black),
and you can pull it by executing ``docker pull mirceaulinic/black``. The
following instructions would use the public image.

### Shell alias

In your environment, you can the define the following bash / zsh/ etc. aliases:

```bash
function black-check(){
    docker run --rm -v $PWD:PWD -ti mirceaulinic/black black --fast --skip-string-normalization --check $PWD
}
```

and / or:

```bash
function black-format(){
    docker run --rm -v $PWD:PWD -ti mirceaulinic/black black --fast --skip-string-normalization $PWD
}
```

And use them when inside your project:

```bash
$ black-format
All done! ✨ 🍰 ✨
2 files left unchanged.
```

### Using [this](https://github.com/mirceaulinic/black/blob/master/Makefile) Makefile

Execute ``make black`` or ``make format`` passing the ``CODEPATH`` variable 
with the absolute path to where you have the code to be checked or formatted, 
e.g.,

```bash
$ make format CODEPATH=/path/to/my/code
All done! ✨ 🍰 ✨
85 files left unchanged.
```

The instruction above would Black-format your code found under the 
``path/to/my/code`` directory. ``make black`` works in a similar way, but it 
only returns whether the code passed the Black checks without updating your 
code, e.g., 

```bash
$ make format CODEPATH=/path/to/my/code
All done! 💥 💔 💥
2050 files would be reformatted, 593 files would be left unchanged, 4 files would fail to reformat.
Makefile:14: recipe for target 'black' failed
make: *** [black] Error 123

$ echo $?
2
```

*Note*:

> One detail to note is that both ``make format`` and ``make black`` are using 
> the ``--skip-string-normalization`` option which tells Black to ignore the 
> single quotes (by default Black prefers double quotes in the favour of 
> single quotes).

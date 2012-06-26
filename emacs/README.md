# VimGolf in Emacs

Compete on [VimGolf][] from the [one true editor][]!

## Features

`vimgolf.el` provides a simple interface to compete on VimGolf from a running instance of Emacs.

It will:

1. Allow you to try a challenge out given a challenge id.
2. A nice display of how you completed the challenge, complete with keystroke count and command name display, that works well with keyboard macros, etc.
3. Provides several helper functions for figuring out what a challenge needs to be completed like:
    - `C-c C-v d` to pop open an ediff session which will not record key strokes.
    - `C-c C-v C-c` to submit a challenge, which will verify your success and tell you how you did.
    - `C-c C-v q` to cancel the challenge (like a n00b!).
    - `C-c C-v r` to revert to the start position and erase all keystrokes.
    - `C-c C-v p` to pause the competition and go do some other work.

## Installation

`vimgolf.el` is designed to be installed via elpa. The stable releases are available from [Marmalade][] while development snapshots can be found in [MELPA][].

You can install `vimgolf.el` as you ordinarilly would without elpa, but support's on you at that point.

## Roadmap

In the future, `vimgolf.el` does hope to provide real submission to VimGolf to allow people to compare solutions between different editors. For other feature ideas, see the [roadmap][].

Please [open an issue][] if you find a bug or have an idea for a feature. Patches are always welcome but I don't have a lot of time to commit to maintaining this so please be patient.

Now go forth and golf!

[vimgolf]: http://vimgolf.com/
[one true editor]: http://www.gnu.org/software/emacs/
[marmalade]: http://marmalade-repo.org/about
[melpa]: http://melpa.milkbox.net/
[roadmap]: https://github.com/igrigorik/vimgolf/blob/master/emacs/ROADMAP.md
[open an issue]: https://github.com/igrigorik/vimgolf/issues

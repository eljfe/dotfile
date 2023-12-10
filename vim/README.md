# Linux systems

To enable clipboard functions you need the `vim-gtk3` binary. This enables the cliboard register.

```vim
:echo has('clipboard')
0
```
... means you don't.  Alternatively `vim --version` ... if `-clipboard` you don't have it (otherwise `+clipboard`)


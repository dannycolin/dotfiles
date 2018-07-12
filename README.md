# dotfiles

**Warning : Use at your own risks**

## Installation

 1. First, you'll need to clone the repository in your home folder.

 ```
 git clone https://gitlab.com/dannycolin/dotfiles
 ```

 2. Next, you'll need to use GNU Stow to create the symlinks. You'll need to
    specify the top-level directory name you want to install. See an example
    below :

 ```
 stow xorg
 ```

*Note : if you don't have GNU Stow, you can install it on Debian Stretch via apt*

```
[sudo] apt install stow
```


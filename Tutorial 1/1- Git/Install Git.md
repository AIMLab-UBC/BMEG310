[TOC]



## Install Git

Open a command shell and run the following command to check if Git is already installed in your computer:

```
git --version
```

If you have Git installed, the output will be:

```
git version X.Y.Z
```

If your computer doesn’t recognize `git` as a command, you’ll need to [install Git](https://docs.gitlab.com/ee/topics/git/how_to_install_git/index.html). After that, run `git --version` again to verify whether it was correctly installed.

## Configure Git

To start using Git from your computer, you’ll need to enter your credentials (user name and email) to identify you as the author of your work. The user name and email should match the ones you’re using on GitLab.

In your shell, add your user name:

```
git config --global user.name "your_username"
```

<!--for example for me:-->

***git config --global user.name "ali"***

And your email address:

```
git config --global user.email "your_email_address@example.com"
```

To check the configuration, run:

```
git config --global --list
```

The `--global` option tells Git to always use this information for anything you do on your system. If you omit `--global` or use `--local`, the configuration will be applied only to the current repository.

You can read more on how Git manages configurations in the [Git Config](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration) documentation

## How to Create an Account on GitHub

1. **Go to [\**https://github.com/join\**](https://github.com/join) in a web browser.** 
2. **Enter your personal details.** Provide ***email*** and ***username*** you used for git configuration
3. **Click the \**Choose\** button for your desired plan**
       **Free:** Unlimited public and private repositories, up to 3 collaborators, issues and bug tracking, and project management tools.
4. **Click the \**Verify email address\** button in the message from GitHub.** 
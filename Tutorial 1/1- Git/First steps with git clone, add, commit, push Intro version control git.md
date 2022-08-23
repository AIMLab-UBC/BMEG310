[TOC]



# First steps with git: clone, add, commit, push Intro version control git

##  Learning objectives

At the end of this activity, you will be able to:

- Create a new repository on GitHub
- `Clone` your repository to your local computer
- Modify files in your repository and track changes using commits with git
- Push your changes back to GitHub

##  What you need

- A GitHub user account
- A terminal running bash, and
- git installed and configured on your computer.

---

## Git at the command line

Below you will learn a series of commands that you can run at the command line in git bash, terminal of whatever bash tool you are using. There are 2 types of commands that you will use

1. **Bash commands:** These are commands that are native to bash / shell. They allow you to navigate around your computer, explore directory structures, create and manipulate files and directories, and more. (e.g. `ls`, `cd`, `mkdir`, etc)
2. **Git commands:** These are commands that are specific to git and will only be available if you have git installed on your computer. Git specific commands will always started with a call to git (e.g. `git status`, `git clone`, etc)

## Create a new repository on GitHub (if the repository already exists, no need to create it)

1. To begin, sign in to your user account on [GitHub](https://github.com/).
2. In the upper right corner, click the `+` sign icon, then choose **New repository**. This will take you to a page where you can enter a repository name (this tutorial uses `test-repo` as the repository name)
4. It is a good idea to add a `.gitignore` file by selecting one of the languages from the drop down menu, though for this tutorial it will not be necessary.
4. Similarly, in practice you should choose a license to that people know whether and how they can use your code.
5. Once you have entered a repository name and made your selection, select **Create repository**, and you will be taken to your new repository web page.

## Clone your repository to your local machine

Next, clone your newly created repository from GitHub to your local computer. From your repository page on GitHub, click the green button labeled **Clone or download**, and in the “Clone with HTTPs” section, copy the URL for your repository.

Next, on your local machine, open your bash shell and change your current working directory to the location where you would like to clone your repository. Note that here we are using a bash command - `cd` (change directory).

For example, on a Unix based system, if you wanted to have your repository in your `Documents` folder, you change directories as follows:

```
cd Documents
```

Once you have navigated to the directory where you want to put your repository, you can use:

```
git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
```

The `git clone` command copies your repository from GitHub to your local computer. Note that this is a git specific command.

For example, for me it is like this:

```
git clone https://github.com/cherakhan/-test-repo-.git
```

When you run `git clone repo-path-here`, You should see output like:

```
Cloning into 'test-repo'...
remote: Counting objects: 5, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 5 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (5/5), done.
Checking connectivity... done.
```

Note: The repository name and output numbers that you see on your computer, representing the total file size, etc, may differ from the example provided above.

To verify that your repository now exists locally, type `ls` in your terminal. The ls command lists the files & folders available in your current directory. You should see a directory with the same name as the repository that you created previously on GitHub.

## Tracking changes with `git add` and `git commit`

Next use `cd` to **c**hange **d**irectories using the syntax:

```
cd my-repo-name
```

Replace my-repo-name with the folder name of your repo (this should be your repo name - e.g. 14ers-git)

```
cd test-repo
```

If you list all the files in this directory (using `ls -a`), you should see all of the files that exist in your GitHub repository:

```
ls -a
```

OR simply open your file browser and navigate to the new local repo.

### Add and commit changes

You will use the add and commit functions to add and commit changes that you make to git.

- `git add`: takes a modified file in your working directory and places the modified version in a staging area.
- `git commit` takes everything from the staging area and makes a permanent snapshot of the current state of your repository that is associated with a unique identifier.

These two commands make up the bulk of many workflows that use git for version control.

[![Modified files are staged using git add, and following a commit, all files in the staging area are snapshotted and become part of the repository's history, receiving a unique SHA-1 hash identifier.](https://www.earthdatascience.org/images/earth-analytics/git-version-control/git-add-commit.png)](https://www.earthdatascience.org/images/earth-analytics/git-version-control/git-add-commit.png)Modified files are staged using git add, and following a commit, all files in the staging area are snapshotted and become part of the repository's history, receiving a unique SHA-1 hash identifier. Source: Maxwell Joseph, adapted from Pro Git by Chacon and Straub (2014).

#### Add files

You can add an individual file or groups of files to git tracking. To add a single file, use

```
git add file-name-here-with-extension
```

To add the README.md file that you just modified, you’d use: (you can copy/paste your any files which would like to submit in this repo and then use `add` )

```
git add README.md
```

To add ALL of the files that you have edited at the same time, you can use:

```
git add --all
```

Use `git add --all` with caution. You do not want to accidentally add things like credential files, `.DS_Store` files, or history files.

#### Commit files

Once you are ready to make a snapshot of the current state of your repository, you can use `git commit`. The git commit command requires a **commit message** that describes the snapshot / changes that you made in that commit.

A commit message should outline what changed and why. These messages

1. help collaborators and your future self understand what was changed and why
2. allow you and your collaborators to find (and undo if necessary) changes that were previously made.

If you are not committing a lot of changes, you can create a short one line commit message using the `-m` flag:

```
git commit -m "Editing the README to try out git add/commit"
```

### push changes to GitHub

So far we have only modified our local copy of the repository. To add the changes to your git repo files on your computer to the version of your repository on GitHub, you need to **push** them GitHub.

You can push your changes to GitHub with:

```
git push
```
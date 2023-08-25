# Calculus for Team-Based Inquiry Learning

Hosted at <https://teambasedinquirylearning.github.io/calculus/>.

# How to fix branch issues

If you accidentally make updates to the `main` branch, after pushing you will get the error message
`Can't push refs to remote. Try running "Pull" first to integrate your changes.`

To fix this, open the Terminal and
enter this line, changing `my-new-branch` to something approriate. 

```bash
BRANCH=my-new-branch
```

Then copy-paste the following lines into the Terminal to fix your Git history:

```bash
git stash
git branch $BRANCH
git reset --hard origin/main
git checkout $BRANCH
git stash pop
```

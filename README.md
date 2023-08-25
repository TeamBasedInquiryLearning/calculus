# Calculus for Team-Based Inquiry Learning

Hosted at <https://teambasedinquirylearning.github.io/calculus/>.

# How to fix branch issue

If you accidentally make updates to the `main` branch, open the Terminal and
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

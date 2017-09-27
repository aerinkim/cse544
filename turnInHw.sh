#!/bin/bash
test -z "$1" && echo "Usage example: $0 hw1" && exit 1

#check no uncommitted changes.
(git status | grep -q modified:) &&  echo  'Error. There are uncommitted changes in your working directory. You can do "git status" to see them.
Please commit or stash uncommitted changes before submitting' && exit 1
COMMIT=$(git log | head -n 1 |  cut -b 1-14)
if (git tag $1 2>/dev/null)
then
    echo "Created tag '$1' pointing to $COMMIT"
else
    git tag -d $1 && git tag $1
    echo "Re-creating tag '$1'... (now $COMMIT)"
fi
echo "Now syncing with origin..."
git push origin --mirror #--atomic
echo "Please verify in GitHub that your tag '$1' matches what you expect. "

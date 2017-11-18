rubocop -aF
CHANGED=$(git status --porcelain | sed s/^...//)
git add $(echo $CHANGED)
git checkout -b cleanup-$(date +%s)-$(echo $CHANGED)
git put
hub pull-request -m `Apply Rubocop to $(echo CHANGED)`

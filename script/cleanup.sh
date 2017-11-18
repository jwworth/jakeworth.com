# Find fixable files
rubocop -aF

# Declare filename and message
CHANGED=$(git status --porcelain | sed s/^...//)
MESSAGE=`Apply Rubocop to $(echo CHANGED)`

# Add and commit
git add $(echo $CHANGED)
git commit -m $MESSAGE

# Checkout and push branch
git checkout -b cleanup-$(date +%s)-$(echo $CHANGED)
git put

# Open PR
hub pull-request -m `Apply Rubocop to $(echo CHANGED)`

# GitHub Branch Management Task

## Task Overview
Manage Git branches effectively following GitHub flow and project conventions for feature development, bug fixes, and releases.

## Execution Steps

### 1. Branch Naming Conventions

#### Feature Branches
```
feature/issue-number-brief-description
feature/123-user-authentication
feature/456-dashboard-redesign
```

#### Bug Fix Branches
```
bugfix/issue-number-brief-description
bugfix/789-login-redirect-error
bugfix/321-memory-leak-fix
```

#### Hotfix Branches
```
hotfix/issue-number-brief-description
hotfix/999-critical-security-patch
hotfix/888-production-crash-fix
```

#### Release Branches
```
release/version-number
release/v1.2.0
release/v2.0.0-beta
```

### 2. Branch Creation Workflow

#### Starting New Feature
```bash
# Ensure you're on main branch
git checkout main

# Pull latest changes
git pull origin main

# Create and switch to new feature branch
git checkout -b feature/123-user-authentication

# Push branch to remote
git push -u origin feature/123-user-authentication
```

#### Emergency Hotfix
```bash
# Create hotfix from production/main
git checkout main
git pull origin main
git checkout -b hotfix/999-critical-security-patch

# Make minimal changes
# Commit and push
git push -u origin hotfix/999-critical-security-patch
```

### 3. Branch Protection Rules

#### Main Branch Protection
- [ ] Require pull request reviews before merging
- [ ] Require status checks to pass before merging
- [ ] Require branches to be up to date before merging
- [ ] Require conversation resolution before merging
- [ ] Restrict pushes that create files larger than specified limit
- [ ] Restrict force pushes
- [ ] Restrict deletions

#### Development Branch Protection
- [ ] Require pull request reviews (can be less strict than main)
- [ ] Require status checks to pass
- [ ] Allow force pushes for maintainers only

### 4. Branch Synchronization

#### Keeping Feature Branch Updated
```bash
# While on feature branch
git checkout feature/123-user-authentication

# Fetch latest changes
git fetch origin

# Rebase on main (preferred) or merge
git rebase origin/main
# OR
git merge origin/main

# Push updated branch
git push origin feature/123-user-authentication
```

#### Resolving Conflicts During Rebase
```bash
# Start rebase
git rebase origin/main

# If conflicts occur, resolve them manually
# Then continue rebase
git add resolved-file.js
git rebase --continue

# If too many conflicts, abort and use merge instead
git rebase --abort
git merge origin/main
```

### 5. Branch Cleanup

#### After Feature Merge
```bash
# Switch to main branch
git checkout main

# Pull latest changes (includes your merged feature)
git pull origin main

# Delete local feature branch
git branch -d feature/123-user-authentication

# Delete remote feature branch
git push origin --delete feature/123-user-authentication
```

#### Bulk Cleanup
```bash
# List merged branches
git branch --merged main

# Delete all merged branches except main/develop
git branch --merged main | grep -v "main\|develop" | xargs -n 1 git branch -d

# Clean up remote tracking branches
git remote prune origin
```

### 6. Advanced Branch Operations

#### Cherry-picking Commits
```bash
# Apply specific commit to current branch
git cherry-pick commit-hash

# Cherry-pick multiple commits
git cherry-pick commit1 commit2 commit3

# Cherry-pick a range of commits
git cherry-pick start-commit..end-commit
```

#### Interactive Rebase for Commit Cleanup
```bash
# Clean up last 3 commits
git rebase -i HEAD~3

# Options in interactive rebase:
# pick = keep commit as is
# reword = change commit message
# edit = modify commit
# squash = combine with previous commit
# fixup = combine with previous commit, discard message
# drop = remove commit
```

#### Creating Release Branch
```bash
# Create release branch from develop
git checkout develop
git pull origin develop
git checkout -b release/v1.2.0

# Update version numbers, documentation
git commit -m "chore(release): prepare v1.2.0"

# Push release branch
git push -u origin release/v1.2.0
```

### 7. Branch Workflow Strategies

#### GitHub Flow (Recommended for most projects)
1. Create feature branch from main
2. Make changes and commit
3. Push branch and create PR
4. Review and test
5. Merge to main
6. Delete feature branch

#### Git Flow (For complex release cycles)
1. Main branch for production
2. Develop branch for integration
3. Feature branches from develop
4. Release branches for version preparation
5. Hotfix branches from main

### 8. Branch Quality Checks

#### Pre-Push Validation
- [ ] All tests pass on branch
- [ ] Code follows style guidelines
- [ ] No merge conflicts with target branch
- [ ] Commit messages follow convention
- [ ] No sensitive data in commits

#### Branch Health Monitoring
- [ ] Regular syncing with main branch
- [ ] Reasonable commit frequency
- [ ] Clear commit messages
- [ ] Appropriate branch size (not too large)

## Quality Gates
- **PASS**: Proper naming, clean history, up-to-date with main, protection rules followed
- **CONCERNS**: Minor naming issues or slightly outdated branch
- **FAIL**: Improper naming, major conflicts, or security issues

## Common Branch Scenarios

### Long-Running Feature Branch
```bash
# Regular sync strategy
git checkout feature/complex-feature
git fetch origin
git rebase origin/main  # Keep linear history
git push --force-with-lease origin feature/complex-feature
```

### Multiple Developers on Same Feature
```bash
# Create shared feature branch
git checkout -b feature/shared-feature
git push -u origin feature/shared-feature

# Each developer creates sub-branches
git checkout -b feature/shared-feature-user1
git checkout -b feature/shared-feature-user2

# Merge sub-branches to main feature branch via PRs
```

### Emergency Production Fix
```bash
# Create hotfix from production tag
git checkout v1.1.0
git checkout -b hotfix/critical-fix

# Make minimal fix
git commit -m "fix(critical): resolve production issue"

# Create PR to main
# After merge, cherry-pick to develop if needed
git checkout develop
git cherry-pick hotfix-commit-hash
```

## Troubleshooting

### Accidentally Committed to Wrong Branch
```bash
# If not pushed yet
git reset HEAD~1  # Undo last commit
git stash  # Save changes
git checkout correct-branch
git stash pop  # Apply changes
git commit -m "correct commit message"
```

### Force Push Safety
```bash
# Use --force-with-lease for safety
git push --force-with-lease origin feature-branch

# This prevents overwriting others' work
```

### Recovering Deleted Branch
```bash
# Find commit hash of deleted branch
git reflog

# Recreate branch from commit
git checkout -b recovered-branch commit-hash
```

## Success Criteria
- Branch follows naming convention
- Properly synced with target branch
- Clean commit history
- Appropriate protection rules applied
- No security issues or sensitive data
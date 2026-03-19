# GitHub Workflow Checklist

## Pre-Development
- [ ] **Feature Branch Created**
  - [ ] Branch follows naming convention: `feature/issue-number-brief-description` or `bugfix/issue-number-brief-description`
  - [ ] Branch created from latest main/master branch
  - [ ] Branch is pushed to remote repository

## During Development
- [ ] **Commit Management**
  - [ ] Commits follow conventional commit format: `type(scope): description`
  - [ ] Commit messages are clear and descriptive
  - [ ] Commits are atomic (single logical change per commit)
  - [ ] No sensitive information (keys, passwords, tokens) in commits
  - [ ] Large files and build artifacts excluded from commits

- [ ] **Code Quality**
  - [ ] Code follows project coding standards
  - [ ] All linting rules pass
  - [ ] No commented-out code blocks (unless specifically needed)
  - [ ] TODO/FIXME comments include issue numbers or follow-up plans

## Pre-Pull Request
- [ ] **Testing Complete**
  - [ ] All existing tests pass
  - [ ] New tests written for new functionality
  - [ ] Test coverage maintained or improved
  - [ ] Manual testing completed for UI changes

- [ ] **Code Review Ready**
  - [ ] Self-review completed
  - [ ] Code is clean and readable
  - [ ] Documentation updated (README, API docs, comments)
  - [ ] No debugging statements or console.logs left in code

## Pull Request Creation
- [ ] **PR Structure**
  - [ ] PR title follows convention: `[Type] Brief description (fixes #issue-number)`
  - [ ] PR description includes:
    - [ ] Summary of changes
    - [ ] Issue reference(s)
    - [ ] Testing instructions
    - [ ] Screenshots (for UI changes)
    - [ ] Breaking changes noted
  - [ ] PR is linked to relevant issue(s)
  - [ ] Appropriate labels applied
  - [ ] Reviewers assigned

- [ ] **CI/CD Checks**
  - [ ] All automated checks pass (CI pipeline, tests, linting)
  - [ ] Build succeeds without warnings
  - [ ] No merge conflicts
  - [ ] Branch is up to date with target branch

## Post-Merge
- [ ] **Cleanup**
  - [ ] Feature branch deleted from remote
  - [ ] Local feature branch deleted
  - [ ] Issue(s) moved to "Done" or closed
  - [ ] Deployment verified (if applicable)

## Emergency/Hotfix Process
- [ ] **Hotfix Branch**
  - [ ] Hotfix branch created from production/main
  - [ ] Branch named: `hotfix/issue-number-brief-description`
  - [ ] Minimal changes made (fix only)
  - [ ] Fast-tracked review process
  - [ ] Immediate testing after merge
  - [ ] Post-mortem scheduled (if needed)

## GitHub-Specific Best Practices
- [ ] **Repository Management**
  - [ ] Branch protection rules enabled for main/master
  - [ ] Required status checks configured
  - [ ] Minimum reviewer requirements set
  - [ ] Auto-merge disabled for critical branches

- [ ] **Security**
  - [ ] No secrets in repository
  - [ ] Dependabot alerts addressed
  - [ ] Security advisories reviewed
  - [ ] Access permissions regularly audited

- [ ] **Documentation**
  - [ ] README.md updated with new features
  - [ ] CHANGELOG.md updated (if maintained)
  - [ ] Wiki or docs updated (if applicable)
  - [ ] Code comments added for complex logic
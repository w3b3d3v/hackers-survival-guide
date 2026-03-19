# GitHub Create Pull Request Task

## Task Overview
Create a well-structured pull request following GitHub best practices and project conventions.

## Execution Steps

### 1. Pre-PR Validation
- [ ] Ensure all tests pass locally
- [ ] Verify branch is up to date with target branch
- [ ] Confirm no merge conflicts exist
- [ ] Run linting and formatting checks

### 2. Branch Verification
- [ ] Confirm feature branch follows naming convention
- [ ] Verify branch is pushed to remote repository
- [ ] Check that branch protection rules are met

### 3. PR Content Creation
- [ ] **PR Title Format**: `[Type] Brief description (fixes #issue-number)`
  - Types: feat, fix, docs, style, refactor, test, chore
  - Example: `[feat] Add user authentication (fixes #123)`

- [ ] **PR Description Template**:
  ```markdown
  ## Summary
  Brief description of changes made

  ## Related Issue(s)
  Fixes #issue-number
  Relates to #other-issue

  ## Type of Change
  - [ ] Bug fix (non-breaking change which fixes an issue)
  - [ ] New feature (non-breaking change which adds functionality)
  - [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
  - [ ] Documentation update

  ## Testing
  - [ ] Unit tests pass
  - [ ] Integration tests pass
  - [ ] Manual testing completed

  ## Screenshots (if applicable)
  Include before/after screenshots for UI changes

  ## Checklist
  - [ ] My code follows the style guidelines of this project
  - [ ] I have performed a self-review of my own code
  - [ ] I have commented my code, particularly in hard-to-understand areas
  - [ ] I have made corresponding changes to the documentation
  - [ ] My changes generate no new warnings
  - [ ] I have added tests that prove my fix is effective or that my feature works
  - [ ] New and existing unit tests pass locally with my changes
  ```

### 4. PR Configuration
- [ ] **Reviewers**: Assign appropriate team members
- [ ] **Labels**: Apply relevant labels (bug, enhancement, documentation, etc.)
- [ ] **Milestone**: Link to relevant milestone if applicable
- [ ] **Projects**: Add to relevant project board if applicable

### 5. GitHub Actions/CI Validation
- [ ] Wait for all CI checks to complete
- [ ] Address any failing checks
- [ ] Ensure build passes successfully
- [ ] Verify deployment previews work (if applicable)

### 6. Post-Creation Actions
- [ ] Monitor for review feedback
- [ ] Respond to review comments promptly
- [ ] Make requested changes in new commits (don't force push)
- [ ] Re-request review after addressing feedback

## Quality Gates
- **PASS**: PR created with proper format, all checks pass, reviewers assigned
- **CONCERNS**: Minor formatting issues or non-critical check failures
- **FAIL**: Critical checks failing, improper format, or security issues

## Common Issues and Solutions

### Merge Conflicts
1. Checkout your feature branch
2. Pull latest changes from target branch: `git pull origin main`
3. Resolve conflicts manually
4. Commit resolution: `git commit -m "resolve merge conflicts"`
5. Push updated branch: `git push origin feature-branch`

### Failed CI Checks
1. Review error logs in GitHub Actions tab
2. Fix issues locally
3. Commit and push fixes
4. Wait for checks to re-run

### Large PR Feedback
- Consider breaking into smaller, focused PRs
- Use draft PR status for work-in-progress
- Provide detailed context in description

## Templates for Common Scenarios

### Bug Fix PR Title/Description
```
[fix] Resolve memory leak in data processing (fixes #456)

## Summary
Fixed memory leak occurring during large dataset processing by properly disposing of event listeners and clearing timeouts.

## Root Cause
Event listeners were not being removed when components unmounted, causing memory accumulation.

## Solution
- Added proper cleanup in useEffect hooks
- Implemented timeout clearing mechanism
- Added memory usage monitoring
```

### Feature Addition PR Title/Description
```
[feat] Add dark mode toggle functionality (fixes #789)

## Summary
Implemented dark mode support with user preference persistence and system theme detection.

## Features Added
- Toggle button in header
- CSS custom properties for theming
- localStorage preference persistence
- System theme auto-detection
- Accessibility improvements for color contrast
```

## Success Criteria
- PR created with all required information
- All automated checks passing
- Proper reviewers assigned
- Clear, actionable description provided
- Linked to relevant issues/milestones
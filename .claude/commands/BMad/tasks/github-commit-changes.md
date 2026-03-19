# GitHub Commit Changes Task

## Task Overview
Create properly formatted commits following conventional commit standards and project guidelines.

## Execution Steps

### 1. Pre-Commit Validation
- [ ] Review all changes to be committed
- [ ] Ensure no sensitive information (API keys, passwords, tokens) included
- [ ] Verify no debug statements or console.logs left in production code
- [ ] Check that large files or build artifacts are excluded
- [ ] Run linting and formatting tools

### 2. Staging Changes
- [ ] Use `git add` to stage specific files or hunks
- [ ] Review staged changes with `git diff --cached`
- [ ] Ensure atomic commits (each commit represents one logical change)
- [ ] Avoid staging unrelated changes together

### 3. Commit Message Format
Follow Conventional Commits specification:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

#### Types
- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files
- **revert**: Reverts a previous commit

#### Examples
```bash
# Feature addition
git commit -m "feat(auth): add OAuth login functionality"

# Bug fix
git commit -m "fix(api): resolve memory leak in data processing"

# Documentation
git commit -m "docs(readme): update installation instructions"

# Refactoring
git commit -m "refactor(utils): extract common validation logic"

# Breaking change
git commit -m "feat(api): change user endpoint response format

BREAKING CHANGE: user endpoint now returns nested user object"
```

### 4. Commit Body Guidelines
- **Use imperative mood**: "Add feature" not "Added feature"
- **Explain what and why**: Focus on the reason for change
- **Keep line length under 72 characters**
- **Separate subject from body with blank line**

### 5. Advanced Commit Scenarios

#### Multiple Related Changes
```bash
# First commit - core functionality
git commit -m "feat(auth): implement JWT token validation"

# Second commit - related tests
git commit -m "test(auth): add JWT validation test cases"

# Third commit - documentation
git commit -m "docs(auth): document JWT authentication flow"
```

#### Fixing Previous Commits
```bash
# Fix last commit message
git commit --amend -m "corrected commit message"

# Add files to last commit
git add forgotten-file.js
git commit --amend --no-edit

# Interactive rebase for multiple commits
git rebase -i HEAD~3
```

#### Co-authored Commits
```bash
git commit -m "feat(ui): implement responsive navigation

Co-authored-by: John Doe <john@example.com>
Co-authored-by: Jane Smith <jane@example.com>"
```

### 6. Security and Quality Checks

#### Pre-commit Hooks (if configured)
- [ ] Code formatting (Prettier/ESLint)
- [ ] Test execution
- [ ] Security scanning
- [ ] Commit message validation

#### Manual Security Review
- [ ] No hardcoded credentials
- [ ] No personal information in commit messages
- [ ] No temporary testing data
- [ ] Proper .gitignore configuration

### 7. Branching Context

#### Feature Branch Commits
```bash
# Working on feature branch
git checkout -b feature/user-profile-updates
git commit -m "feat(profile): add user avatar upload"
git commit -m "test(profile): add avatar upload tests"
git commit -m "docs(profile): update API documentation"
```

#### Hotfix Commits
```bash
# Emergency fix
git checkout -b hotfix/critical-security-patch
git commit -m "fix(security): patch XSS vulnerability in user input

CVE-2024-XXXX: Properly sanitize user input to prevent script injection"
```

## Quality Gates
- **PASS**: Proper commit format, no sensitive data, atomic changes
- **CONCERNS**: Minor formatting issues or overly large commits
- **FAIL**: Sensitive data included, improper format, or breaking changes without documentation

## Common Commit Patterns

### Bug Fixes
```bash
git commit -m "fix(component): resolve state update race condition

- Add proper cleanup in useEffect
- Prevent state updates on unmounted components
- Add error boundary for better error handling

Fixes #123"
```

### Feature Development
```bash
git commit -m "feat(dashboard): implement real-time data updates

- Add WebSocket connection management
- Implement data synchronization logic
- Add loading states and error handling
- Include unit tests for new functionality

Closes #456"
```

### Refactoring
```bash
git commit -m "refactor(api): extract common HTTP client logic

- Create reusable HTTP client class
- Standardize error handling across endpoints
- Reduce code duplication by 40%
- Maintain backward compatibility"
```

## Troubleshooting

### Commit Amending Issues
```bash
# If you've already pushed the commit
# WARNING: Only do this on feature branches
git push --force-with-lease origin feature-branch
```

### Large File Issues
```bash
# Remove large file from commit
git reset HEAD large-file.zip
echo "large-file.zip" >> .gitignore
git add .gitignore
git commit -m "chore: add large file to gitignore"
```

### Commit Message Typos
```bash
# Fix last commit message
git commit --amend -m "corrected message"

# For pushed commits, create new commit
git commit -m "docs: fix typo in previous commit message"
```

## Success Criteria
- Commit follows conventional commit format
- Message clearly explains the change
- No sensitive information included
- Atomic change (single logical unit)
- Proper staging of related files only
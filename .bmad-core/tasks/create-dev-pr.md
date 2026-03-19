<!-- Powered by BMAD™ Core -->

# create-dev-pr

Create a pull request after development completion with automatic GitHub issue closing syntax. This task is executed by the Dev agent when a story is ready for review, ensuring proper issue linking and comprehensive PR description.

## Purpose

- Create a pull request when development is complete
- Automatically include "Closes #issue" syntax for GitHub issue resolution
- Provide clear PR description with development summary
- Link GitHub issues mentioned in the story
- Prepare PR for QA/PM review and merge

## Inputs

```yaml
required:
  - story_id: '{epic}.{story}' # e.g., "1.3"
  - story_path: '{devStoryLocation}/{epic}.{story}.*.md' # Path from core-config.yaml

optional:
  - story_title: '{title}' # If missing, derive from story file H1
  - story_slug: '{slug}' # If missing, derive from title (lowercase, hyphenated)
  - branch_name: '{branch}' # If missing, derive from story_slug (e.g., "feature/story-slug")
```

## Prerequisites

- All story tasks completed and marked [x]
- All tests passing (`deno test -A`)
- Lint checks passing (`deno lint`)
- Story status is "Ready for Review"
- All code changes committed to feature branch

## Process

### 1. Load Story Data

**Read Story File:**
- Load story file from `{story_path}`
- Extract story title (H1 header)
- Extract GitHub issue references from story content
- Extract completed tasks and subtasks
- Extract file list of changes
- Extract acceptance criteria

### 2. Extract GitHub Issues for Closing

**Issue Detection Patterns:**
1. Direct references: `#123`, `issue #123`, `GitHub issue #123`
2. Story metadata/frontmatter issue fields
3. Dev Notes section issue mentions
4. Change Log issue references

**Issue Closing Syntax:**
- Generate `Closes #123` format for each issue found
- Group multiple issues: `Closes #123, #456`
- Add context if available: `Closes #123 (user authentication)`

### 3. Create/Switch to Feature Branch

```bash
# Ensure we're on the correct feature branch
git checkout -b feature/{story_slug} 2>/dev/null || git checkout feature/{story_slug}

# Ensure all changes are committed
git add {files_from_story_file_list}
git commit -m "feat: {story_title}

{brief_description_from_story - MUST follow writing-guidelines.md: active voice, lead with results, cut unnecessary words}

Closes #{issue_numbers}"

# Push branch
git push -u origin feature/{story_slug}
```

### 4. Generate PR Description

**CRITICAL**: PR descriptions MUST follow `docs/writing-guidelines.md`:
- Lead with results, not process
- Use active voice
- Remove unnecessary words
- State changes and impacts, skip the journey
- Apply Zinsser Test: Can I cut this in half?

**PR Title:** `{story_title}`

**PR Description Template:**
```markdown
## Summary

{Extract summary from story or first few sentences of Story section}

## Closes Issues

{Auto-generated based on story analysis}
Closes #{issue_number}
Closes #{issue_number}

## Implementation

### Completed Tasks
{List all completed tasks with [x] from story}
- [x] Task 1: {description}
- [x] Task 2: {description}

### Acceptance Criteria Met
{List all ACs from story}
- [x] AC1: {description}  
- [x] AC2: {description}

## Changes Made

### Files Modified
{Extract from story File List section}
- `path/to/file.ts` - {brief description of changes}
- `path/to/test.ts` - {brief description of test changes}

### Key Features
{Extract from story completion notes or dev notes}
- Feature 1: {description}
- Feature 2: {description}

## Testing

All automated checks passing:
- [x] Unit tests (`deno test -A`)
- [x] Linting (`deno lint`)  
- [x] Type checking
- [x] Integration tests

### Test Coverage
{If available from dev notes}
- New tests added: {count}
- Test files modified: {list}

## Development Notes

{Extract from Dev Agent Record -> Completion Notes}

## Ready for Review

This PR is ready for:
- [x] QA review and testing
- [x] Code review  
- [x] Merge after approval

---
*Development completed by Dev Agent James. Ready for QA/PM review and merge.*
```

### 5. Create Pull Request

```bash
# Create PR using GitHub CLI
gh pr create \
  --title "{story_title}" \
  --body "$(cat <<'EOF'
{pr_description_content}
EOF
)" \
  --base main \
  --head feature/{story_slug}
```

### 6. Update Story File (Dev Agent Record Section)

**Add to Dev Agent Record -> Completion Notes:**
```markdown
### PR Created: [Date]

**PR URL:** {pr_url}
**Branch:** feature/{story_slug}  
**Issues Linked:** #{issue_list}

**PR Status:** Open and ready for review
**Next Steps:** QA/PM review and merge
```

**Update Story Status:**
```markdown
Status: PR Created - Pending Review
```

## GitHub Issue Detection Logic

**Search Patterns (in order):**
1. **Direct References:** `#123`, `issue #123`, `GitHub issue #123`
2. **Story Sections:**
   - Dev Notes mentions
   - Change Log references  
   - Task descriptions
   - Story content body
3. **Metadata:**
   - Story frontmatter
   - Epic-level issue tracking
4. **Fuzzy Matching:**
   - Open issues with similar titles
   - Recent issues in milestone

**Fallback Options:**
- If no issues found, ask user to specify
- Create PR without issue closing syntax
- Suggest checking other repositories

## Error Handling

**Missing Prerequisites:**
- If tests failing, don't create PR - show failing tests
- If lint errors, don't create PR - show lint issues
- If uncommitted changes, commit them first

**Branch Issues:**
- If feature branch exists with different changes, ask for guidance
- If PR already exists for branch, offer to update description
- If branch conflicts with main, suggest rebasing

**GitHub Issues:**
- If no issues found but expected, prompt user
- If issues are in different repo, ask for full reference
- If issues already closed, warn but proceed

## Quality Gates

**Only create PR if:**
- All story tasks marked [x] complete
- `deno test -A` passes (exit code 0)
- `deno lint` passes (exit code 0)
- Story File List is complete and accurate
- Story status is "Ready for Review"

**If quality gates fail:**
- Show specific failing checks
- Provide commands to fix issues
- Don't create PR until resolved

## Integration with BMad Workflow

**Before PR Creation:**
1. Run final validation checklist
2. Ensure story DOD checklist completed
3. Verify all subtasks marked complete

**After PR Creation:**
1. Update story status to "PR Created - Pending Review"
2. Add PR URL to Dev Agent Record
3. Notify that QA/PM can now review and merge

## Completion Output

```
✅ Pull Request Created Successfully!

📋 Story: 1.3 - User Authentication System
🔗 PR: https://github.com/user/repo/pull/42
🎯 Issues Closing: #15, #23
📁 Files Changed: 8 files, 247 additions, 12 deletions
✅ All Tests Passing

Next Steps:
- QA Agent: Use *merge-pr command to review and merge
- PM Agent: Use *merge-pr command for project oversight and merge
- Manual: Reviewers can review and merge at GitHub
```

## Key Principles

- Dev creates PRs when development is complete
- Automatic issue closing syntax generation
- Comprehensive PR context for reviewers
- Integration with BMad story workflow
- Quality gates prevent broken PRs
- Clear handoff to QA/PM for review and merge
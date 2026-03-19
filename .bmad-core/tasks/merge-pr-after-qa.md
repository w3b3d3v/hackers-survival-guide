<!-- Powered by BMAD™ Core -->

# merge-pr-after-qa

Review and merge a pull request after comprehensive QA validation. This task allows QA agent to perform final quality checks on a PR and merge it when quality gates are met, automatically closing linked GitHub issues.

## Purpose

- Perform final QA validation on pull request
- Verify all QA requirements are met
- Merge PR when quality standards satisfied
- Ensure linked GitHub issues are automatically closed
- Update story status to completion

## Inputs

```yaml
required:
  - pr_number: '{pr_number}' # e.g., "42" or full URL
  - story_id: '{epic}.{story}' # e.g., "1.3" (can extract from PR if missing)

optional:
  - story_path: '{devStoryLocation}/{epic}.{story}.*.md' # Auto-detected from story_id
  - qa_root: from `bmad-core/core-config.yaml` key `qa.qaLocation`
  - force_merge: false # Override quality gates (use with caution)
```

## Prerequisites

- PR exists and is open
- PR has been created by Dev agent with proper issue linking
- QA gate file exists for the story
- All CI/CD checks are passing (if configured)

## Process

### 1. Load PR and Story Data

**Fetch PR Information:**
```bash
# Get PR details
gh pr view {pr_number} --json title,body,headRefName,baseRefName,mergeable,state

# Get PR file changes
gh pr diff {pr_number} --name-only

# Check CI status
gh pr checks {pr_number}
```

**Extract from PR:**
- Story ID (from title or description)
- Linked issues (Closes #123 syntax)
- File changes list
- CI/test status

**Load Story File:**
- Find story file using story_id
- Verify story status is "PR Created - Pending Review"
- Load QA gate file if available

### 2. QA Validation Checks

**A. Gate Status Review**
- Load latest QA gate: `{qa_root}/gates/{epic}.{story}-*.yml`
- Verify gate status is PASS or CONCERNS (not FAIL)
- Check quality score meets threshold (default: ≥80)
- Review any unresolved high-severity issues

**B. PR Quality Checks**
- Verify PR description matches story requirements
- Confirm all linked issues are valid and should be closed
- Check file changes align with story File List
- Validate branch naming convention

**C. Automated Checks**
- All CI/CD checks must be passing
- No merge conflicts with base branch
- PR is mergeable state

### 3. Quality Gate Decision

**PASS Criteria (Auto-merge approved):**
- QA gate status: PASS
- Quality score: ≥80
- No high-severity unresolved issues
- All CI checks passing
- No merge conflicts

**CONCERNS Criteria (Manual review):**
- QA gate status: CONCERNS  
- Quality score: 60-79
- Medium-severity issues present
- Request additional review before merge

**FAIL Criteria (Block merge):**
- QA gate status: FAIL
- Quality score: <60
- High-severity unresolved issues
- Failing CI checks
- Merge conflicts

### 4. Merge Process

**If Quality Gates PASS:**

```bash
# Merge PR using squash merge (preserves issue closing)
gh pr merge {pr_number} \
  --squash \
  --subject "{story_title}" \
  --body "QA Approved - Quality Score: {score}/100

Closes linked issues via PR merge.

QA Gate: PASS
Reviewed by: Quinn (Test Architect)"

# Verify merge success
gh pr view {pr_number} --json state,merged
```

**If Quality Gates CONCERNS:**
- Add review comment with concerns
- Request changes or additional review
- Provide specific improvement recommendations
- Do not merge until concerns addressed

**If Quality Gates FAIL:**
- Add review comment with blocking issues
- Request changes to address failures
- Update PR status to "Changes Requested"
- Provide detailed remediation steps

### 5. Post-Merge Actions

**Update Story File (QA Results Section):**
```markdown
### PR Merged: [Date]

**PR Number:** #{pr_number}
**Merge Status:** Merged successfully
**Issues Closed:** #{issue_list}
**Final QA Score:** {score}/100

**Merge Decision:** APPROVED
**Quality Gate:** {gate_status}
**Reviewer:** Quinn (Test Architect)

**Post-Merge Verification:**
- [x] All linked issues automatically closed
- [x] Branch deleted
- [x] Story completed successfully
```

**Update Story Status:**
```markdown
Status: Done
```

**Verify Issue Closure:**
```bash
# Check that linked issues were closed
gh issue view {issue_number} --json state
```

### 6. Quality Documentation

**Create Post-Merge Report:**
Save to `{qa_root}/reports/{epic}.{story}-merge-{YYYYMMDD}.md`:

```markdown
# Merge Report: {story_title}

**Date:** {date}  
**PR:** #{pr_number}  
**Story:** {epic}.{story}  
**Reviewer:** Quinn (Test Architect)

## Summary
{Brief summary of changes merged}

## Quality Metrics
- **Gate Status:** {PASS/CONCERNS/FAIL}
- **Quality Score:** {score}/100
- **Issues Closed:** #{issue_list}
- **Files Changed:** {file_count}

## QA Validation
- [x] Code review completed
- [x] Test coverage verified  
- [x] Security review passed
- [x] Performance impact assessed
- [x] Documentation updated

## Issues Resolved
{List each closed issue with brief description}
- #{issue} - {description}

## Recommendations for Future
{Any process improvements or lessons learned}
```

## Error Handling

**PR Not Ready for Merge:**
- If CI failing, wait and provide status
- If conflicts exist, request dev to resolve
- If missing QA gate, run review first

**Quality Gates Not Met:**
- FAIL status: Block merge, provide remediation plan
- Missing gate: Run QA review process first
- Score too low: Request improvements

**GitHub Issues:**
- If linked issues don't exist, warn but proceed
- If issues already closed, note in report
- If wrong issues linked, request PR update

## Quality Thresholds

**Default Quality Score Thresholds:**
- ≥90: Excellent (auto-merge)
- 80-89: Good (auto-merge with notes)
- 60-79: Acceptable (manual review)
- <60: Needs improvement (block merge)

**Customizable via `technical-preferences.md`:**
```yaml
qa_merge_thresholds:
  auto_merge_min: 80
  manual_review_min: 60
  block_merge_max: 59
```

## Integration Points

**With Dev Agent:**
- Dev creates PR → QA merges PR
- Dev updates on PR feedback
- Clear handoff at PR creation

**With PM Agent:**  
- PM can also merge PRs for oversight
- PM handles project-level issue management
- Coordination on milestone completion

**With GitHub:**
- Automatic issue closing via merge
- Branch cleanup post-merge
- PR history preservation

## Completion Output

```
✅ Pull Request Merged Successfully!

📋 Story: 1.3 - User Authentication System
🔗 PR: #42 (merged)
🎯 Issues Closed: #15, #23
⭐ Final QA Score: 95/100 (PASS)
📊 Quality Gate: PASS

Post-Merge Actions:
✅ All linked issues closed automatically
✅ Feature branch deleted  
✅ Story status updated to Done
✅ Merge report generated

Story 1.3 is now complete! 🎉
```

## Key Principles

- Quality-first approach to PR merging
- Transparent decision making with clear criteria
- Comprehensive validation before merge
- Automatic issue resolution via merge
- Complete audit trail for compliance
- Integration with existing BMad workflow
- Balance between automation and oversight
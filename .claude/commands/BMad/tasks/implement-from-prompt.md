# Implement From Prompt Task

## Purpose

Directly implement simple changes from user prompts without creating formal stories. This task is for quick, isolated changes that can be completed in a single focused session (1-3 hours) and don't require complex planning.

## When to Use This Task

**Use for VERY SIMPLE changes:**
- Single file modifications
- Styling adjustments
- Simple bug fixes
- Configuration changes
- Documentation updates
- Small utility functions

**DO NOT use for:**
- Multi-component changes
- New feature development
- Integration work
- Breaking changes
- Anything requiring architectural decisions

## Task Execution Instructions

### 1. Prompt Qualification

#### 1.1 Immediate Disqualifiers

STOP and suggest story creation if prompt involves:
- [ ] Multiple files/components (>3 files)
- [ ] New dependencies or libraries
- [ ] Database schema changes
- [ ] API endpoint creation/modification
- [ ] Authentication/authorization changes
- [ ] Performance optimization
- [ ] Breaking changes to existing functionality
- [ ] Integration with external systems

#### 1.2 Qualification Checklist

Only proceed if ALL of these are true:
- [ ] Change is isolated to 1-3 files maximum
- [ ] No new dependencies required
- [ ] Follows existing patterns exactly
- [ ] Can be completed in 1-3 hours
- [ ] Low risk of breaking existing functionality
- [ ] Clear, unambiguous requirements
- [ ] No architectural decisions needed

### 2. Implementation Planning

#### 2.1 Quick Analysis

Before starting implementation:

**Scope Verification:**
- [ ] Identify exact files to be modified
- [ ] Confirm change follows existing patterns
- [ ] Verify no integration points affected
- [ ] Check for potential side effects

**Pattern Matching:**
- [ ] Find similar implementations in codebase
- [ ] Identify coding standards to follow
- [ ] Locate relevant tests to update/add

**Risk Assessment:**
- [ ] Minimal risk to existing functionality
- [ ] Easy rollback if needed
- [ ] No user-facing breaking changes

#### 2.2 Implementation Strategy

Create quick implementation plan:

```markdown
## Quick Implementation Plan

**Prompt**: {{original user request}}
**Estimated Time**: {{1-3}} hours
**Files to Modify**: {{list specific files}}
**Pattern Reference**: {{existing similar implementation}}

### Steps:
1. {{Step 1}}
2. {{Step 2}}
3. {{Step 3}}
4. Test and validate
```

### 3. Direct Implementation

#### 3.1 Code Changes

Follow this sequence:

1. **Backup Current State**
   - Create feature branch: `quickfix/{{brief-description}}`
   - Commit current state before changes

2. **Implement Change**
   - Follow existing code patterns exactly
   - Maintain coding standards
   - Add appropriate comments if needed

3. **Update Tests**
   - Modify existing tests if affected
   - Add minimal test coverage for new functionality
   - Ensure all tests pass

4. **Validate Implementation**
   - Test the specific change
   - Verify no regression in related functionality
   - Check edge cases if applicable

#### 3.2 Quality Checks

Before considering complete:

- [ ] **Functionality**: Change works as requested
- [ ] **Code Quality**: Follows project standards
- [ ] **Tests**: Existing tests pass, new tests added if needed
- [ ] **No Regression**: Related functionality unaffected
- [ ] **Documentation**: Updated if necessary (README, comments)

### 4. Documentation and Handoff

#### 4.1 Change Documentation

Create brief change summary:

```markdown
## Quick Implementation: {{Change Title}}

**Prompt**: {{original request}}
**Implementation Date**: {{date}}
**Time Spent**: {{actual hours}}

### Changes Made:
- {{File 1}}: {{what was changed}}
- {{File 2}}: {{what was changed}}

### Testing:
- {{what was tested}}
- {{test results}}

### Notes:
- {{any important notes or decisions}}
- {{potential future improvements}}
```

#### 4.2 Commit and PR

**Commit Message Format:**
```
fix(scope): brief description of change

- Specific change 1
- Specific change 2

Resolves user request: {{original prompt}}
Time: {{hours}}h
```

**PR Creation** (if required):
- Use minimal PR template
- Include before/after screenshots for UI changes
- Reference the user prompt
- Mark as minor/patch change

### 5. Escalation Triggers

#### 5.1 Stop Implementation If:

- [ ] Change requires more than 3 files
- [ ] Implementation is taking longer than expected (>3 hours)
- [ ] Encountering unexpected complexity
- [ ] Breaking changes are needed
- [ ] Multiple integration points discovered
- [ ] Tests are failing due to broader issues

#### 5.2 Escalation Actions

If stopped, immediately:

1. **Preserve Work**: Commit current progress with WIP message
2. **Document Findings**: Note why implementation was more complex
3. **Suggest Alternative**: Recommend story creation or plan mode
4. **Communicate**: Explain to user why escalation is needed

**Escalation Message Template:**
```markdown
## Implementation Escalated

**Original Prompt**: {{user request}}
**Issue Encountered**: {{why stopped}}
**Work Preserved**: {{branch/commit with current progress}}

**Recommendation**:
This change is more complex than initially assessed. I recommend:

1. **Story Creation**: Convert to formal story for proper planning
2. **Plan Mode**: Break into phases for systematic implementation
3. **Expert Review**: Consult with {{domain}} expert

**Current Progress**: {{what was accomplished}}
**Next Steps**: {{recommended action}}
```

### 6. Examples of Appropriate Changes

#### Styling/UI Tweaks
- "Change button color to blue"
- "Increase font size in sidebar"
- "Add margin to the header"

#### Simple Bug Fixes
- "Fix typo in error message"
- "Correct validation regex"
- "Update broken link"

#### Configuration Updates
- "Update API endpoint URL"
- "Change default timeout value"
- "Add new environment variable"

#### Documentation Changes
- "Update README installation steps"
- "Fix broken documentation link"
- "Add code comments to utility function"

## Success Criteria

**Implementation Successful When:**
- Change works exactly as requested
- No existing functionality broken
- Code follows project standards
- Appropriate tests updated/added
- Change is documented in commit/PR
- Completed within 3-hour time limit

**Escalation Successful When:**
- Complexity discovered before damage done
- Work preserved for future continuation
- Clear explanation provided to user
- Appropriate alternative suggested

## Integration with SE Agent Workflow

This task integrates with:
- **prompt-to-story**: Alternative for complex changes
- **github-commit**: Proper commit message formatting
- **github-branch**: Feature branch management
- **run-tests**: Validation of implementation
- **develop-story**: Fallback for escalated changes

## Risk Mitigation

**Low-Risk Approach:**
- Always use feature branches
- Commit frequently
- Test thoroughly before PR
- Document all changes
- Quick rollback capability maintained

**Safety Nets:**
- 3-hour time limit prevents runaway work
- Clear escalation triggers
- Pattern-following prevents architectural drift
- Test requirements maintain quality
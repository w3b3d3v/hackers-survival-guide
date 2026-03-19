<!-- Powered by BMAD™ Core -->

# GitHub Project Management Task

## Overview
Create and manage comprehensive GitHub project structure including milestones, epics, issues, documentation, and project boards using GitHub CLI.

**CRITICAL**: All GitHub content (issues, PRs, commits) MUST follow `docs/writing-guidelines.md` standards. Writing guidelines apply ONLY to GitHub content - not internal task documentation or agent communication.

## Inputs Required
- **Strategic roadmap document**: Output from roadmap-strategic-planning task
- **GitHub repository**: Repository where project will be managed
- **Team information**: Development team size and roles

## Outputs Generated
- **GitHub Milestones**: Created with target dates and descriptions
- **GitHub Issues**: Epics and user stories with proper labels
- **Project Board**: Organized with columns and automation
- **Repository Documentation**: Wiki pages and development docs

## Workflow

### Phase 1: Repository Assessment & Setup

**STEP 1: Repository Analysis**
```bash
# Check current repository state
gh repo view
gh issue list --state all --limit 50
gh milestone list
gh label list
```

**STEP 2: Label System Setup**
Create standardized label system:
```bash
# Epic and story labels
gh label create "epic" --description "Large feature spanning multiple stories" --color "8B0000"
gh label create "story" --description "User story implementation" --color "0366d6"
gh label create "task" --description "Technical task or chore" --color "d4c5f9"

# Priority labels  
gh label create "priority/high" --description "High priority item" --color "d73a4a"
gh label create "priority/medium" --description "Medium priority item" --color "fbca04"
gh label create "priority/low" --description "Low priority item" --color "0e8a16"

# Phase labels
gh label create "phase/foundation" --description "Phase 0 - Foundation" --color "1d76db"
gh label create "phase/core" --description "Phase 1 - Core Features" --color "0366d6"
gh label create "phase/polish" --description "Phase 2 - Polish & Launch" --color "28a745"

# Area labels
gh label create "area/backend" --description "Backend development" --color "f9c513"
gh label create "area/frontend" --description "Frontend development" --color "c5def5"
gh label create "area/devops" --description "DevOps and infrastructure" --color "5319e7"
gh label create "area/docs" --description "Documentation" --color "0052cc"
```

### Phase 2: Milestone Creation

**STEP 3: Create Strategic Milestones**
Based on roadmap phases, create milestones:

```bash
# Foundation milestone
gh milestone create "MVP Foundation" \
  --description "Phase 0: Project setup, infrastructure, authentication" \
  --due-date "YYYY-MM-DD"

# Core features milestone  
gh milestone create "MVP Core" \
  --description "Phase 1: Essential user-facing features and workflows" \
  --due-date "YYYY-MM-DD"

# Launch milestone
gh milestone create "MVP Launch" \
  --description "Phase 2: Polish, monitoring, and launch preparation" \
  --due-date "YYYY-MM-DD"

# Post-MVP milestone
gh milestone create "Post-MVP Growth" \
  --description "Future enhancements and growth features" \
  --due-date "YYYY-MM-DD"
```

### Phase 3: Epic Creation

**STEP 4: Create Epic Issues**
For each major feature area, create epic issues:

```bash
# Example epic creation
gh issue create \
  --title "[Epic] User Authentication & Authorization" \
  --body-file epic-auth-template.md \
  --label "epic,phase/foundation,area/backend,priority/high" \
  --milestone "MVP Foundation"
```

Epic issue template format (following writing-guidelines.md):
```markdown
## Epic Overview
[Lead with result] What this epic delivers and why it matters.

## User Value  
As [user type], I want [capability] so that [benefit].

## Acceptance Criteria
- [ ] [Clear, testable criterion]
- [ ] [Clear, testable criterion]  
- [ ] [Clear, testable criterion]

## Story Breakdown
- [ ] Story 1: [Action-focused title] (#issue-number)
- [ ] Story 2: [Action-focused title] (#issue-number)
- [ ] Story 3: [Action-focused title] (#issue-number)

## Technical Notes
- [Concrete implementation details]
- [Specific dependencies]
- [Identified risks]

## Definition of Done
- [ ] All stories completed
- [ ] Documentation updated
- [ ] Tests passing
- [ ] Code reviewed

**Writing Standards Applied:**
- Active voice throughout
- Results stated first
- No unnecessary qualifiers
- Clear, actionable language
```

### Phase 4: User Story Creation

**STEP 5: Create User Story Issues**
For each epic, create detailed user stories:

```bash
gh issue create \
  --title "User Registration with Email Verification" \
  --body-file story-template.md \
  --label "story,phase/foundation,area/backend,priority/high" \
  --milestone "MVP Foundation" \
  --assignee "@me"
```

User story template (following writing-guidelines.md):
```markdown
## User Story
As [user type], I want [functionality] so that [benefit].

## Acceptance Criteria  
- [ ] Given [context], when [action], then [result]
- [ ] Given [context], when [action], then [result]

## Implementation
- [Specific approach]
- [Required API endpoints]
- [Database changes]

## Testing
- [Unit tests needed]
- [Integration scenarios]
- [Manual test steps]

## Definition of Done
- [ ] Feature works
- [ ] Tests pass
- [ ] Code reviewed
- [ ] Docs updated

**Writing Standards Applied:**
- Cut unnecessary words ("functionality implemented" → "feature works")
- Use active voice
- Lead with outcomes
- Simple, clear language
```

### Phase 5: Project Board Setup

**STEP 6: Create Project Board**
```bash
# Create project board
gh project create --title "MVP Development" --body "Main project board for MVP development"

# Add columns programmatically or via web interface:
# - Backlog
# - Sprint Ready
# - In Progress  
# - In Review
# - Done
```

**STEP 7: Board Automation Setup**
Configure automation rules:
- New issues → Backlog
- Issues assigned → Sprint Ready
- PRs opened → In Review
- PRs merged → Done

### Phase 6: Documentation Setup

**STEP 8: Repository Documentation**
Create essential documentation:

```bash
# Enable wiki if not already enabled
gh api repos/:owner/:repo -f has_wiki=true

# Create wiki pages using gh CLI or web interface
```

Essential wiki pages:
- **Development Setup**: Environment setup instructions
- **Architecture Overview**: High-level system design
- **Contributing Guidelines**: Code standards and processes
- **API Documentation**: Endpoint specifications
- **Deployment Guide**: Release and deployment processes

**STEP 9: Issue Templates**
Create `.github/ISSUE_TEMPLATE/` files:
- `user-story.md`: User story template
- `epic.md`: Epic template  
- `bug-report.md`: Bug report template
- `technical-task.md`: Technical task template

### Phase 7: GitHub Integration

**STEP 10: Advanced GitHub Features**
Set up additional project management features:

```bash
# Create project-specific labels for sprints
gh label create "sprint/1" --description "Sprint 1 items" --color "f29513"
gh label create "sprint/2" --description "Sprint 2 items" --color "f29513"

# Set up issue dependencies (using task lists in epic descriptions)
# Configure branch protection rules
gh api repos/:owner/:repo/branches/main/protection -X PUT --input protection-rules.json

# Set up release automation
gh workflow list
gh workflow run release.yml
```

## GitHub CLI Commands Reference

### Issue Management
```bash
# List issues by various filters
gh issue list --state open --label "epic"
gh issue list --milestone "MVP Foundation"
gh issue list --assignee "@me"

# Create issues with templates
gh issue create --template user-story.md
gh issue create --web  # Opens web interface

# Issue updates
gh issue edit 123 --add-label "priority/high"
gh issue edit 123 --milestone "MVP Core" 
gh issue close 123 --comment "Completed in PR #456"
```

### Milestone Management
```bash
# List milestones
gh milestone list

# Update milestone
gh milestone edit "MVP Foundation" --due-date "2024-12-31"

# Close milestone
gh milestone close "MVP Foundation"
```

### Project Board Management
```bash
# List projects
gh project list

# Add issue to project
gh project item-add 123 --project-id 456

# Update project item status
gh project item-edit --project-id 456 --id 789 --field-id "Status" --single-select-option-id "Done"
```

## Automation & Integration

### Workflow Automation
Create `.github/workflows/` files for:
- **Issue Triage**: Auto-label new issues
- **PR Automation**: Link PRs to issues, update project boards
- **Release Management**: Create releases from milestones
- **Documentation**: Auto-update docs from code changes

### Integration Points
- **Slack/Discord**: Notifications for issue updates
- **Time Tracking**: Integration with time tracking tools
- **CI/CD**: Link builds to issues and PRs
- **Analytics**: Track milestone progress and velocity

## Success Criteria
- [ ] All milestones created with target dates
- [ ] Epic issues created with proper story breakdown
- [ ] User stories created with clear acceptance criteria
- [ ] Project board configured with automation
- [ ] Repository documentation complete
- [ ] Team access and permissions configured
- [ ] Integration with development workflow established

## Best Practices

### GitHub Writing Standards (CRITICAL)
When creating GitHub issues, PRs, and commits, follow `docs/writing-guidelines.md`:

**For GitHub Content Only:**
- Lead with results: "Fixed authentication" not "This PR addresses authentication issues"  
- Use active voice: "Added user login" not "User login was added"
- Apply Zinsser Test: Cut unnecessary words, use simpler terms
- No AI mentions: Never include "Generated with Claude" or AI co-author tags
- Write for developers: Clear, actionable content

### Issue Organization
- Use consistent naming conventions
- Apply labels systematically  
- Keep issue descriptions updated
- Link related issues using keywords

### Milestone Management
- Set realistic target dates
- Balance milestone scope
- Regular milestone health checks
- Celebrate milestone completions

### Project Board Hygiene
- Regular board grooming sessions
- Clear column definitions
- Consistent card movement
- Archive completed items

## Dependencies
- GitHub CLI (`gh`) installed and authenticated
- Repository admin access
- Team member GitHub accounts
- Strategic roadmap document completed
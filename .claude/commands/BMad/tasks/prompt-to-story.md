# Prompt to Story Conversion Task

## Purpose

Convert user prompts for requested changes into implementation-ready stories with complexity assessment. This task analyzes the scope and suggests plan mode with step breakdown for large changes, or creates immediate implementation stories for smaller changes.

## Task Execution Instructions

### 1. Prompt Analysis and Complexity Assessment

#### 1.1 Initial Prompt Evaluation

Analyze the user's prompt for:

**Scope Indicators:**
- [ ] Number of components/systems affected
- [ ] Number of distinct functional requirements
- [ ] Integration complexity (internal systems, external APIs, databases)
- [ ] UI/UX changes required
- [ ] Testing scope (unit, integration, e2e)
- [ ] Documentation updates needed

**Complexity Signals:**
- [ ] Multiple user roles affected
- [ ] Breaking changes to existing APIs
- [ ] New external dependencies required
- [ ] Security/authentication changes
- [ ] Performance optimization needs
- [ ] Migration or data transformation required

**Size Estimation:**
- **Small** (1-4 hours): Single component, isolated change, minimal integration
- **Medium** (4-8 hours): Multiple related files, some integration, straightforward testing
- **Large** (8+ hours): Multiple components, complex integration, extensive testing
- **Epic** (Multi-story): Requires architectural planning, multiple iterations

#### 1.2 Complexity Decision Matrix

| Criteria | Small | Medium | Large | Epic |
|----------|-------|--------|-------|------|
| Files Modified | 1-3 | 4-8 | 9-15 | 15+ |
| Components Affected | 1 | 2-3 | 4-6 | 6+ |
| Integration Points | 0-1 | 2-3 | 4-5 | 5+ |
| New Dependencies | 0 | 0-1 | 1-2 | 2+ |
| Breaking Changes | No | Minor | Some | Major |
| Testing Scope | Unit only | Unit + Integration | Full stack | E2E + Performance |

### 2. Plan Mode Assessment

#### 2.1 Trigger Plan Mode When:

- **Epic Size**: Estimated 16+ hours or touches 6+ major components
- **Architectural Impact**: Requires new patterns, significant refactoring, or system design
- **Multiple Domains**: Crosses frontend, backend, database, and external systems
- **Unknown Complexity**: User prompt lacks sufficient detail for accurate estimation
- **Risk Factors**: Security changes, performance critical, or affects core business logic

#### 2.2 Plan Mode Response Format

If triggering plan mode:

```markdown
## Complexity Assessment: EPIC SCOPE DETECTED

**Estimated Effort**: {{hours}} hours across {{components}} components

**Plan Mode Recommended**: This change is substantial enough to benefit from step-by-step planning.

### Suggested Breakdown:

**Phase 1: Foundation** ({{hours}} hours)
- {{foundational task 1}}
- {{foundational task 2}}

**Phase 2: Core Implementation** ({{hours}} hours)
- {{core feature 1}}
- {{core feature 2}}

**Phase 3: Integration & Testing** ({{hours}} hours)
- {{integration task 1}}
- {{testing and validation}}

**Phase 4: Polish & Documentation** ({{hours}} hours)
- {{refinement tasks}}
- {{documentation updates}}

### Would you like to:
1. **Enter Plan Mode**: Break this into detailed steps for systematic implementation
2. **Create Epic**: Convert to epic with multiple stories for iterative development
3. **Proceed Anyway**: Create a single large story (not recommended)
4. **Refine Scope**: Reduce scope to create a smaller, focused story

**Recommendation**: Option 1 (Plan Mode) for systematic implementation with checkpoints.
```

### 3. Direct Story Creation (Small/Medium Changes)

#### 3.1 Story Structure Generation

For changes that don't require plan mode:

```markdown
# Story: {{Derived Title from Prompt}}

<!-- Source: User Prompt Conversion -->
<!-- Complexity: {{Small/Medium}} -->
<!-- Estimated Effort: {{hours}} hours -->

## Status: Draft

## Story

As a {{derived user type}},
I want {{capability from prompt}},
so that {{derived value/benefit}}.

## Context

**Change Type**: {{Feature/Enhancement/Bug Fix/Refactor}}
**Scope**: {{Brief scope description}}
**Impact**: {{Affected systems/components}}
**Prompt Source**: {{Original user request}}

## Acceptance Criteria

{{Generated from prompt analysis}}

1. **Primary Functionality**
   - {{Main requirement from prompt}}
   - {{Secondary requirement if any}}

2. **Integration Requirements**
   - {{Integration points maintained}}
   - {{Existing functionality preserved}}

3. **Quality Requirements**
   - {{Testing criteria}}
   - {{Performance criteria}}
   - {{Security criteria if applicable}}

## Dev Notes

### Implementation Approach
{{Technical approach based on prompt analysis}}

### Key Considerations
{{Technical constraints, patterns to follow, gotchas}}

### Files Likely Affected
{{Estimated file paths based on common patterns}}

### Testing Strategy
{{Testing approach based on change type}}

## Tasks / Subtasks

{{Generated task breakdown}}

- [ ] Task 1: {{Analysis/Setup task}}
  - [ ] {{Subtask}}
  - [ ] {{Subtask}}

- [ ] Task 2: {{Implementation task}}
  - [ ] {{Subtask}}
  - [ ] {{Subtask}}

- [ ] Task 3: {{Testing task}}
  - [ ] {{Subtask}}
  - [ ] {{Subtask}}

- [ ] Task 4: {{Integration/Validation task}}
  - [ ] {{Subtask}}
  - [ ] {{Subtask}}
```

#### 3.2 Intelligent Field Population

**User Type Derivation:**
- Look for user mentions in prompt
- Default to "developer" for technical changes
- Use "user" for UI/UX changes
- Use "admin" for configuration/management features

**Value Proposition:**
- Extract benefit statements from prompt
- Infer business value if not explicit
- Focus on user-centric outcomes

**Technical Approach:**
- Analyze prompt for technical hints
- Apply project patterns and conventions
- Include architecture alignment notes

### 4. Interactive Refinement Process

#### 4.1 Information Gathering

If prompt lacks critical details, gather:

**Missing Technical Details:**
- "What specific {{component/system}} should this integrate with?"
- "Are there existing patterns in the codebase I should follow?"
- "What's the expected user interaction flow?"
- "Are there performance or security requirements?"

**Missing Business Context:**
- "Who is the primary user for this feature?"
- "What problem does this solve?"
- "How should this integrate with existing workflows?"

**Missing Scope Clarification:**
- "Should this include {{related functionality}}?"
- "Are there edge cases or error scenarios to consider?"
- "What constitutes 'done' for this change?"

#### 4.2 Iterative Refinement

Allow for prompt refinement through questions:

```markdown
## Prompt Clarification Needed

I've analyzed your request: "{{original prompt}}"

**Initial Assessment**: {{size}} scope, estimated {{hours}} hours

**Questions for Better Story Creation:**

1. **{{Category}}**: {{Specific question}}
2. **{{Category}}**: {{Specific question}}
3. **{{Category}}**: {{Specific question}}

**Current Understanding:**
- {{What I understand so far}}
- {{Assumptions I'm making}}

Please provide clarification so I can create a precise, actionable story.
```

### 5. Quality Validation

#### 5.1 Story Completeness Check

Before finalizing, ensure:

- [ ] **Clear User Value**: Story explains why change is needed
- [ ] **Specific Acceptance Criteria**: Testable, concrete requirements
- [ ] **Technical Feasibility**: Approach is realistic and follows patterns
- [ ] **Scope Appropriateness**: Size matches single story guidelines
- [ ] **Implementation Ready**: Dev agent can start work without guesswork

#### 5.2 Risk Assessment

Include risk evaluation:

```markdown
## Risk Assessment

**Implementation Risk**: {{Low/Medium/High}}
- {{Primary risk factor}}
- {{Mitigation approach}}

**Integration Risk**: {{Low/Medium/High}}
- {{Integration concerns}}
- {{Safety measures}}

**Rollback Plan**: {{How to undo if needed}}
```

### 6. Output Options

#### 6.1 Story File Creation

Create story file:
- **Location**: `{{devStoryLocation}}/prompt-{{timestamp}}-{{slug}}.md`
- **Format**: Follow project story template
- **Status**: Draft (ready for review)

#### 6.2 Alternative Outputs

**Plan Mode Trigger**:
- Detailed breakdown suggestion
- Phase-by-phase approach
- Resource and timeline estimates

**Epic Conversion**:
- Multi-story epic structure
- Story interdependencies
- Iteration planning

**Scope Reduction**:
- Minimal viable implementation
- Future enhancement suggestions
- Clear scope boundaries

## Success Criteria

**For Direct Story Creation:**
- Story is implementation-ready without additional research
- Scope is appropriate for single iteration
- Technical approach is clear and feasible
- Risk factors are identified and mitigated

**For Plan Mode Trigger:**
- Complexity is accurately assessed
- Breakdown is logical and actionable
- Dependencies are identified
- User understands why plan mode is beneficial

## Usage Examples

### Small Change Example
**Prompt**: "Add a loading spinner to the login button"
**Result**: Direct story creation (2-3 hours estimated)

### Medium Change Example
**Prompt**: "Add user profile picture upload with resizing"
**Result**: Direct story creation (6-8 hours estimated)

### Large Change Example
**Prompt**: "Implement real-time chat with notifications"
**Result**: Plan mode suggestion (16+ hours, multiple components)

### Epic Example
**Prompt**: "Add complete multi-tenant support with role-based access"
**Result**: Plan mode trigger (40+ hours, architectural changes)

## Integration Notes

This task integrates with:
- **develop-story**: Can immediately implement created stories
- **review**: Can assess story quality before implementation
- **github-branch**: Can create feature branch for story implementation
- **plan-mode**: External plan mode for complex changes
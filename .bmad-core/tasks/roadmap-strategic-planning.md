<!-- Powered by BMAD™ Core -->

# Strategic Roadmap & MVP Planning Task

## Overview
Transform raw project notes into a strategic roadmap with clear MVP breakdown, organized by business areas and development phases.

## Inputs Required
- **notes.md**: Raw project notes containing business ideas, todos, development tasks, marketing ideas, etc.

## Outputs Generated
- **Strategic Roadmap Document**: Organized breakdown of project areas
- **MVP Definition**: Clear scope and priorities for first release
- **GitHub Project Structure**: Milestones, epics, and issues ready for creation

## Workflow

### Phase 1: Notes Analysis & Categorization

**STEP 1: Load and Parse Notes**
- Load the provided notes.md file
- Identify and extract all todos, ideas, and requirements
- Tag each item by category (business, dev, marketing, ops, etc.)

**STEP 1.5: Context Completeness Analysis**
For each extracted idea, assess context completeness:
- **Well-Defined (80-100% context)**: Clear user value, implementation approach, success criteria
- **Partially Defined (40-80% context)**: Some clarity but missing key details  
- **Vague (<40% context)**: General intent but lacks specifics
- **Ambiguous (unclear intent)**: Needs complete redefinition

**Context Gap Identification:**
```markdown
## Ideas Needing Clarification

### HIGH PRIORITY (affects MVP scope):
- "[vague idea]" - Missing: [specific gaps]
- "[unclear requirement]" - Missing: [specific gaps]

### MEDIUM PRIORITY (important but not blocking):
- "[general concept]" - Missing: [specific gaps]

**Recommendation**: Run `*clarify-ideas` command before finalizing roadmap
```

**STEP 2: Strategic Areas Identification**
Create structured breakdown:
```yaml
business_areas:
  - core_product: Features that define the product
  - user_experience: UI/UX, onboarding, user journey
  - technical_infrastructure: Backend, database, APIs, DevOps
  - growth_marketing: User acquisition, SEO, content marketing
  - operations: Support, analytics, monitoring
  - compliance_legal: Privacy, terms, security requirements
```

**STEP 3: Priority Matrix Creation**
For each identified item, assess:
- **Impact**: High/Medium/Low business value
- **Effort**: High/Medium/Low development complexity  
- **Risk**: High/Medium/Low technical or business risk
- **Dependencies**: What must be built first

### Phase 2: MVP Scope Definition

**STEP 4: MVP Core Feature Set**
Apply strict MVP criteria:
- Must solve the core user problem
- Must be technically feasible in 2-4 sprints
- Must provide measurable business value
- Must enable user validation and feedback

**STEP 5: MVP Phase Breakdown**
Structure MVP into phases:
```yaml
mvp_phases:
  phase_0_foundation:
    - Project setup, CI/CD, basic infrastructure
    - Core data models and authentication
  phase_1_core:
    - Essential user-facing features
    - Basic user flows and interactions
  phase_2_polish:
    - Error handling, edge cases
    - Basic analytics and monitoring
```

### Phase 3: GitHub Project Structure

**STEP 6: Milestones Planning**
Create GitHub milestones:
- **MVP Foundation** (Phase 0)
- **MVP Core** (Phase 1) 
- **MVP Launch** (Phase 2)
- **Post-MVP Growth** (Future features)

**STEP 7: Epic Definitions**
For each MVP phase, create epics:
- Epic title following pattern: `[Phase] Epic Name`
- Epic description with user value statement
- Epic acceptance criteria for completion
- Epic story point estimation

**STEP 8: GitHub Issues Structure**
For each epic, define:
- Feature issues (user stories)
- Technical debt issues
- Documentation issues
- Testing issues

### Phase 4: Strategic Documentation

**STEP 9: Roadmap Document Generation**
Create comprehensive roadmap document containing:

```markdown
# Project Strategic Roadmap

## Executive Summary
- Project vision and goals
- Target market and user base
- Success metrics and KPIs

## MVP Strategy
- Core problem being solved
- MVP feature set and rationale  
- Success criteria for MVP

## Development Phases
- Detailed breakdown of each phase
- Timeline estimates and dependencies
- Resource requirements

## Post-MVP Roadmap
- Growth features and enhancements
- Market expansion opportunities
- Technical scaling considerations

## Risk Assessment
- Technical risks and mitigation
- Market risks and alternatives
- Resource and timeline risks
```

### Phase 5: GitHub Project Creation (Optional)

**STEP 10: GitHub CLI Integration**
If requested, execute GitHub commands:
- Create project milestones using `gh api`
- Create epics as issues with epic labels
- Create feature issues linked to epics
- Set up project board with columns

## Interaction Requirements

**Required User Inputs:**
1. Path to notes.md file
2. Project vision/goal clarification (if not clear from notes)
3. Timeline constraints (sprint length, target launch date)
4. Team size and technical constraints

**Elicitation Questions:**
- "What is the core problem this project solves for users?"
- "What would make this MVP successful in your eyes?"
- "Are there any technical constraints or preferences?"
- "What's your target timeline for MVP launch?"

## Success Criteria
- [ ] All notes categorized and prioritized
- [ ] Clear MVP scope with <20 user stories
- [ ] Strategic roadmap document created
- [ ] GitHub project structure defined
- [ ] Technical and business risks identified
- [ ] Next steps for development team clear

## Dependencies
- templates/roadmap-strategic-template.yaml
- User access to GitHub repository
- Clarity on business goals and user base
<!-- Powered by BMAD™ Core -->

# Idea Clarification & Context Analysis Task

## Overview
Analyze project notes and roadmap ideas to identify items lacking sufficient context, then guide user through clarifying and elaborating these ideas for better strategic planning.

## Inputs Required
- **Project notes**: Raw notes.md or similar documentation
- **Existing roadmap**: Current roadmap document (if available)
- **User availability**: For interactive clarification sessions

## Outputs Generated
- **Context Gap Analysis**: List of ideas needing clarification
- **Clarification Questions**: Specific questions for each vague idea
- **Enhanced Ideas Document**: Ideas with added context and details
- **Updated Roadmap**: Roadmap with clarified and expanded ideas

## Workflow

### Phase 1: Idea Context Assessment

**STEP 1: Extract All Ideas**
Scan input documents for:
- Todo items and tasks
- Feature descriptions
- Business goals and objectives
- Marketing strategies
- Technical requirements
- User experience ideas

**STEP 2: Context Completeness Analysis**
For each idea, assess context completeness using these criteria:

```yaml
context_assessment:
  user_value:
    - Who benefits from this idea?
    - What problem does it solve?
    - How will users interact with it?
  
  business_impact:
    - What business goal does this support?
    - How will success be measured?
    - What's the expected ROI or benefit?
  
  implementation_clarity:
    - What needs to be built/done?
    - Are there technical constraints?
    - What resources are required?
  
  scope_definition:
    - What's included/excluded?
    - How complex is the implementation?
    - Are there dependencies?
  
  priority_rationale:
    - Why is this important now?
    - How does it compare to other priorities?
    - What happens if we don't do this?
```

**STEP 3: Gap Identification**
Categorize ideas by context completeness:

```markdown
## Context Analysis Results

### Well-Defined Ideas (80-100% context)
- User authentication system
  - Clear user value, technical approach, success criteria defined
  - Ready for implementation planning

### Partially Defined Ideas (40-80% context)  
- "Improve user experience"
  - Missing: Specific UX problems, target improvements, success metrics
  - Has: General intent, user focus

### Vague Ideas (<40% context)
- "Marketing stuff"  
  - Missing: Target audience, channels, budget, goals, timeline
  - Has: General category recognition

### Ambiguous Ideas (unclear intent)
- "Make it better"
  - Missing: What "it" refers to, what "better" means, how to measure
  - Needs complete redefinition
```

### Phase 2: Clarification Question Generation

**STEP 4: Generate Targeted Questions**
For each incomplete idea, create specific clarification questions:

**Template for Question Generation:**
```markdown
## Idea: [Original idea text]

### Context Gaps Identified:
- [ ] User value unclear
- [ ] Business impact undefined  
- [ ] Implementation approach vague
- [ ] Success criteria missing

### Clarification Questions:

**User Value Questions:**
- Who specifically would use this feature?
- What problem are they trying to solve?
- How do they currently handle this problem?

**Business Impact Questions:**
- What business metric would this improve?
- How would you measure success?
- What's the cost of not having this?

**Implementation Questions:**
- What would this look like to users?
- What are the main components needed?
- Are there similar solutions to reference?

**Priority Questions:**
- Why is this important for MVP vs. later?
- How does this compare to other features?
- What happens if we delay this 6 months?
```

**STEP 5: Question Prioritization**
Rank clarification sessions by impact:

```yaml
high_priority_clarification:
  - Core product features with vague definitions
  - Revenue-impacting ideas lacking business context
  - Technical architecture decisions without criteria

medium_priority_clarification:
  - User experience improvements needing specificity
  - Marketing strategies without target definition
  - Operational processes without clear workflows

low_priority_clarification:
  - Nice-to-have features with general descriptions
  - Future enhancement ideas without urgency
  - Administrative tools without specific requirements
```

### Phase 3: Interactive Clarification Process

**STEP 6: Structured Clarification Sessions**
For each high-priority unclear idea:

**Session Structure:**
1. **Present Original Idea**: Show user their original note/idea
2. **Explain Context Gaps**: Identify what's missing for implementation
3. **Ask Targeted Questions**: Use generated clarification questions
4. **Capture Enhanced Definition**: Document expanded idea with context
5. **Validate Understanding**: Confirm interpretation is correct

**Example Clarification Session:**
```markdown
## Clarification Session: "Improve user onboarding"

### Original Idea:
"Need to improve user onboarding - it's confusing"

### Context Gaps:
- What specific parts are confusing?
- What should good onboarding accomplish?
- How will we measure improvement?

### Clarification Questions:
Q: What do new users struggle with most in current onboarding?
A: "They don't understand how to set up their first project"

Q: What would successful onboarding look like?
A: "Users complete their first project setup within 10 minutes"

Q: How would you measure onboarding success?
A: "90% of users complete setup, 80% continue to second session"

### Enhanced Idea Definition:
**Feature: Guided First Project Setup**
- **User Value**: New users can create their first project confidently
- **Success Metrics**: 90% completion rate, <10 minute average time
- **Implementation**: Step-by-step wizard with progress indicators
- **Scope**: Covers account setup, project creation, basic configuration
- **Priority**: High - blocking user adoption
```

### Phase 4: Idea Enhancement and Documentation

**STEP 7: Create Enhanced Idea Definitions**
Transform clarified ideas into implementation-ready definitions:

```markdown
## Enhanced Idea Template

### [Idea Name]
**Original Note**: [User's original text]

**User Value Statement**: 
As a [user type], I want [specific capability] so that [specific benefit].

**Business Impact**:
- **Goal**: [Specific business objective]
- **Success Metrics**: [Measurable outcomes]
- **Timeline Impact**: [When needed and why]

**Implementation Overview**:
- **Core Components**: [What needs to be built]
- **User Experience**: [How users will interact]
- **Technical Approach**: [High-level implementation strategy]

**Scope Definition**:
- **Included**: [Specific features/functionality]
- **Excluded**: [What's not included in this version]
- **Dependencies**: [What must exist first]

**Priority Rationale**:
- **Importance**: [Why this matters now]
- **Impact**: [Effect on users/business]
- **Effort**: [Estimated complexity]
```

**STEP 8: Roadmap Integration**
Update strategic roadmap with enhanced ideas:
- Replace vague items with detailed definitions
- Adjust timeline estimates based on clarified scope
- Update priority rankings with better context
- Identify new dependencies revealed through clarification

### Phase 5: Validation and Follow-up

**STEP 9: Context Validation**
Review enhanced ideas for completeness:

**Validation Checklist:**
- [ ] User value clearly articulated
- [ ] Business impact quantified
- [ ] Implementation approach defined
- [ ] Success criteria measurable
- [ ] Scope boundaries clear
- [ ] Priority rationale documented

**STEP 10: Iterative Refinement**
For ideas still lacking context after initial clarification:
- Schedule follow-up sessions
- Research similar solutions for reference
- Prototype or mock up concepts for clarity
- Gather additional stakeholder input

## Clarification Question Frameworks

### For Feature Ideas
```
Context Questions:
- Who is the primary user of this feature?
- What job are they trying to accomplish?
- How do they currently do this job?
- What pain points exist in the current process?
- What would success look like to them?

Scope Questions:
- What's the simplest version that would be valuable?
- What advanced capabilities might be needed later?
- Are there similar features in other products?
- What integrations or APIs would be needed?
- What data does this feature require?
```

### For Business Goals
```
Impact Questions:
- How will this goal affect revenue/users/engagement?
- What metrics will indicate progress toward this goal?
- What's the timeline for achieving this goal?
- Who is responsible for this goal's success?
- What budget/resources are available?

Strategy Questions:
- What's the competitive advantage this creates?
- How does this align with company strategy?
- What are the risks if we don't pursue this?
- What assumptions are we making?
- How will we validate our approach?
```

### For Technical Ideas
```
Implementation Questions:
- What problem is this technology solving?
- What are the alternatives to this approach?
- What are the technical constraints or requirements?
- How does this integrate with existing systems?
- What's the maintenance and support impact?

Decision Questions:
- What criteria will determine if this is successful?
- What are the risks and how can they be mitigated?
- What's the learning curve for the team?
- How does this affect system performance/security?
- What's the long-term technical debt impact?
```

## User Interaction Patterns

**For Context Gathering:**
```
"I found this idea in your notes: '[original idea]'

To help create a clear implementation plan, I need more context:

1. [Specific question about user value]
2. [Specific question about business impact]
3. [Specific question about implementation scope]

Would you like to elaborate on this idea now, or should I mark it for later clarification?"
```

**For Priority Assessment:**
```
"I have several ideas that need clarification:

HIGH PRIORITY (affects core MVP):
1. [Idea] - Missing: [context gaps]
2. [Idea] - Missing: [context gaps]

MEDIUM PRIORITY (important for full product):  
3. [Idea] - Missing: [context gaps]
4. [Idea] - Missing: [context gaps]

Which would you like to clarify first?"
```

## Success Criteria
- [ ] All vague ideas identified and categorized
- [ ] Targeted clarification questions generated
- [ ] User provides enhanced context for priority ideas
- [ ] Ideas transformed into implementation-ready definitions
- [ ] Roadmap updated with clarified scope and priorities
- [ ] Context gaps eliminated for MVP-critical features

## Integration Points
- **Input**: Takes roadmap-strategic-planning task output
- **Processing**: Identifies and clarifies context gaps
- **Output**: Feeds enhanced ideas back to roadmap planning
- **Iteration**: Can be run multiple times as ideas evolve

## Dependencies
- User availability for clarification sessions
- Access to original notes and project documentation  
- Understanding of business goals and user base
- Template for enhanced idea documentation
<!-- Powered by BMAD™ Core -->

# Roadmap Time Optimization Task

## Overview
Optimize existing roadmap and MVP scope to fit within specific time constraints by breaking down phases, reducing scope, or adjusting priorities.

## Inputs Required
- **Existing roadmap document**: Current strategic roadmap
- **Time constraints**: Target timeline (weeks/months)
- **Team capacity**: Development team size and availability
- **Priority constraints**: Non-negotiable features vs. nice-to-haves

## Outputs Generated
- **Time-optimized roadmap**: Adjusted phases and milestones
- **Scope reduction recommendations**: Features to defer or cut
- **Alternative delivery approaches**: Parallel development options
- **Risk assessment**: Timeline risks and mitigation strategies

## Workflow

### Phase 1: Constraint Analysis

**STEP 1: Time Constraint Assessment**
Gather specific constraints:
- Target launch date
- Available development hours per week
- Team size and skill distribution
- External dependencies and deadlines
- Buffer requirements (testing, deployment, etc.)

**STEP 2: Current Roadmap Analysis**
Analyze existing roadmap:
- Total estimated effort (story points/hours)
- Critical path dependencies
- Phase breakdown and sequencing
- Feature complexity assessment
- Risk factors affecting timeline

**STEP 3: Gap Identification**
Calculate timeline gap:
```
Current Estimate: X weeks
Target Timeline: Y weeks
Gap to Close: (X - Y) weeks
Reduction Needed: ((X - Y) / X) * 100%
```

### Phase 2: Optimization Strategies

**STEP 4: Scope Reduction Options**
Identify reduction strategies by priority:

**Option A: Feature Deferral**
- Move non-core features to post-MVP
- Identify features that can launch separately
- Create "phased launch" approach

**Option B: Feature Simplification**
- Reduce feature complexity while keeping core value
- Remove edge cases and advanced options
- Use simpler implementation approaches

**Option C: Technical Shortcuts**
- Use third-party services instead of building
- Accept technical debt for faster delivery
- Implement minimum viable versions

**Option D: Parallel Development**
- Identify features that can be built simultaneously
- Split team across independent workstreams
- Front-load research and design phases

### Phase 3: Roadmap Restructuring

**STEP 5: Create Time-Boxed Phases**
Restructure into fixed-time phases:

```yaml
time_boxed_approach:
  phase_1_foundation:
    duration: "4 weeks"
    capacity: "160 hours" # 4 weeks × 40 hours
    must_have_features:
      - Core authentication
      - Basic data models
      - Essential APIs
    
  phase_2_core:
    duration: "6 weeks" 
    capacity: "240 hours"
    must_have_features:
      - Primary user workflows
      - Core business logic
      - Basic UI implementation
    
  phase_3_launch:
    duration: "2 weeks"
    capacity: "80 hours"
    must_have_features:
      - Error handling
      - Basic monitoring
      - Launch preparation
```

**STEP 6: Feature Prioritization Matrix**
Create prioritization using:
- **Impact**: Business value (High/Medium/Low)
- **Effort**: Development complexity (High/Medium/Low)
- **Risk**: Implementation risk (High/Medium/Low)
- **Dependency**: Blocking other features (Yes/No)

Priority scoring:
```
Score = (Impact × 3) + (1/Effort × 2) + (1/Risk × 1) + (Dependency × 2)
```

### Phase 4: Alternative Approaches

**STEP 7: Delivery Model Options**

**Approach A: Strict MVP (Minimum Time)**
- Absolute minimum features for user validation
- Accept higher technical debt
- Plan immediate post-launch iterations

**Approach B: Phased Launch (Balanced)**
- Core features in phase 1
- Enhancement features in phase 2
- Growth features in phase 3

**Approach C: Parallel Tracks (Resource Intensive)**
- Split team across frontend/backend
- Develop features in parallel streams
- Requires clear API contracts upfront

**STEP 8: Risk Mitigation Planning**
Address timeline risks:

**Technical Risks:**
- Complex integrations → Use mock services initially
- Performance issues → Accept minimal viable performance
- Unknown complexity → Add discovery spikes

**Resource Risks:**
- Team availability → Cross-train on critical features
- Skill gaps → Pair programming or external help
- Scope creep → Strict change control process

### Phase 5: Implementation Planning

**STEP 9: Sprint Planning Alignment**
Break optimized roadmap into sprints:
- Standard sprint length (1-2 weeks)
- Story point capacity per sprint
- Buffer time for testing and fixes
- Demo and feedback cycles

**STEP 10: Milestone Restructuring**
Adjust milestones to fit timeline:
```markdown
## Revised Milestones

### Milestone 1: Foundation (Week 4)
**Success Criteria:**
- [ ] User authentication working
- [ ] Core data models implemented
- [ ] Basic API endpoints functional

### Milestone 2: Core Features (Week 10)
**Success Criteria:**
- [ ] Primary user workflow complete
- [ ] Essential business logic working
- [ ] Basic UI functional

### Milestone 3: Launch Ready (Week 12)
**Success Criteria:**
- [ ] Error handling implemented
- [ ] Basic monitoring in place
- [ ] Documentation complete
```

## Optimization Techniques

### Scope Reduction Methods

**Feature Cutting:**
- Remove "admin panels" → Use database tools initially
- Remove "user profiles" → Use basic account info only
- Remove "advanced search" → Use simple filtering

**Implementation Simplification:**
- Use email verification → Skip SMS verification
- Use basic auth → Skip OAuth initially
- Use simple validation → Skip complex business rules

**Technical Shortcuts:**
- Use hosted services → Firebase, Supabase, etc.
- Use UI libraries → Skip custom components
- Use templates → Skip custom design

### Time-Boxing Strategies

**Fixed Scope Sprints:**
- Set sprint duration (2 weeks)
- Define must-have outcomes
- Cut features that don't fit

**Feature Time-Boxing:**
- "Authentication: 3 days max"
- "User dashboard: 5 days max" 
- Cut complexity if time runs out

**Quality Trade-offs:**
- Accept manual testing initially
- Skip comprehensive error handling
- Plan refactoring in future iterations

## User Interaction Points

**Required Elicitation:**
1. **Time Constraint Confirmation:**
   - "What is your absolute deadline?"
   - "How much time can the team dedicate per week?"
   - "Are there any external deadline pressures?"

2. **Priority Clarification:**
   - "Which features are absolutely non-negotiable?"
   - "What would success look like with 50% fewer features?"
   - "Which features could launch separately later?"

3. **Risk Tolerance:**
   - "How much technical debt are you comfortable with?"
   - "Would you accept a simpler UI to meet timeline?"
   - "Are you open to using third-party services?"

4. **Resource Flexibility:**
   - "Can you add team members temporarily?"
   - "Are there features someone else could build?"
   - "Can you extend the timeline by X weeks if needed?"

## Decision Framework

### Go/No-Go Criteria
For each optimization option:
- **Feasible**: Can be implemented in available time
- **Viable**: Still delivers core user value
- **Sustainable**: Won't create insurmountable technical debt
- **Testable**: Can be validated with users

### Recommendation Format
```markdown
## Time Optimization Recommendations

### Current State
- Estimated timeline: 16 weeks
- Target timeline: 12 weeks
- Gap to close: 4 weeks (25% reduction needed)

### Recommended Approach: Phased Launch
**Phase 1 (12 weeks): Core MVP**
- [List of core features]
- Estimated effort: 480 hours
- Team capacity: 480 hours (12 weeks × 40 hours)

**Phase 2 (Post-launch): Enhancements**  
- [List of deferred features]
- Can be developed after launch feedback

### Features Removed/Simplified
- Admin dashboard → Use database tools
- Advanced search → Basic filtering only
- User profiles → Basic account info

### Risks & Mitigation
- Technical debt → Plan refactoring sprints
- Reduced functionality → Clear user communication
- Integration complexity → Use staging environment
```

## Success Criteria
- [ ] Timeline gap identified and quantified
- [ ] Multiple optimization options presented
- [ ] Feasible roadmap fits within constraints
- [ ] Feature priorities clearly defined
- [ ] Risk mitigation strategies identified
- [ ] Implementation approach agreed upon
- [ ] Updated GitHub milestones created

## Integration with Existing Workflow
- Uses output from roadmap-strategic-planning task
- Feeds into github-project-management task  
- Updates existing roadmap documents
- Maintains story/epic structure while adjusting scope
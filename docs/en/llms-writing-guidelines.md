# Writing Guidelines for LLM Coding Agents

**Target Audience:** This document provides writing standards for AI agents (LLMs) when creating documentation, code comments, and technical content for Polkadot development projects.

## Core Principles (Zinsser Method)

### Business Writing Rules

- Lead with the result, not the process
- Use active voice: "We fixed the bug" not "The bug was fixed"
- Write for the reader who knows nothing about your work
- State conclusions first, then explain if needed
- One idea per sentence, one topic per paragraph

### Code-Related Writing

- Variable names are
  sentences: make them clear, not clever
- Error messages should tell users what to do next
- Documentation should answer "why", code shows "what"
- PR descriptions: State changes and impacts, skip the journey
- Commit messages: What changed and why, in present tense

**Brevity is power.** Strip every sentence to its cleanest components. Remove every word that serves no function. Replace phrases with words. Choose simple words over complex ones.

### Clutter Elimination

- Cut qualifiers: "very",
  "quite", "rather", "somewhat", "pretty much"
- Remove redundant pairs: "each
  and every",
  "first and foremost", "various and sundry"
- Eliminate throat-clearing: "It is important to note that", "The fact that"
- Avoid inflated phrases: Use "now" not "at this point in time"
- Delete meaningless jargon: "utilize" → "use", "implement" → "do"
- Start with what it does, not how it works
- Use concrete examples over abstract descriptions
- Write instructions as commands: "Run tests" not "You should run tests"
- Test your writing: Can someone follow it without you there?
- Assume intelligence but not knowledge

# The Zinsser Test

Before committing any written text, ask:

1. Can I cut this sentence in half?
2. Is there a simpler word?
3. Does the reader need to know this?
4. Am I saying this twice?

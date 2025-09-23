# Presentation Template
<!-- HackMD Presentation Template with Brand Consistency -->
<!--
To use this template:
1. Copy this file and rename it
2. Replace placeholder content with your presentation content
3. Customize brand colors and styling in the style section below
4. Use --- to separate slides
5. Switch to presentation mode in HackMD to view as slides
-->

<style>
/* Brand Color Palette - Customize these colors for your brand */
:root {
  --primary-color: #2563eb;     /* Primary brand color */
  --secondary-color: #64748b;   /* Secondary brand color */
  --accent-color: #f59e0b;      /* Accent color for highlights */
  --text-color: #1e293b;        /* Main text color */
  --background-color: #ffffff;  /* Background color */
  --light-gray: #f8fafc;        /* Light backgrounds */
}

/* Global presentation styling */
.reveal {
  font-family: "Inter", "Segoe UI", Roboto, sans-serif;
  color: var(--text-color);
}

.reveal h1, .reveal h2, .reveal h3 {
  color: var(--primary-color);
  font-weight: 700;
}

.reveal h1 {
  font-size: 2.5em;
  margin-bottom: 0.5em;
}

.reveal h2 {
  font-size: 2em;
  margin-bottom: 0.4em;
}

/* Slide backgrounds */
.reveal .slides section {
  background: var(--background-color);
  border-top: 4px solid var(--primary-color);
}

/* Code blocks styling */
.reveal pre {
  background: var(--light-gray);
  border-left: 4px solid var(--accent-color);
}

.reveal code {
  background: var(--light-gray);
  color: var(--primary-color);
  padding: 0.2em 0.4em;
  border-radius: 4px;
}

/* Lists styling */
.reveal ul li, .reveal ol li {
  margin-bottom: 0.5em;
}

/* Emphasis and strong styling */
.reveal strong {
  color: var(--primary-color);
}

.reveal em {
  color: var(--secondary-color);
  font-style: italic;
}

/* Quote styling */
.reveal blockquote {
  border-left: 4px solid var(--accent-color);
  background: var(--light-gray);
  padding: 1em;
  margin: 1em 0;
}

/* Custom slide classes */
.title-slide {
  text-align: center;
  background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
  color: white;
}

.title-slide h1 {
  color: white;
}

.section-slide {
  background: var(--light-gray);
  border-top: 8px solid var(--accent-color);
}

.contact-slide {
  text-align: center;
  background: var(--primary-color);
  color: white;
}
</style>

<!-- Title Slide -->
<!-- {_class="title-slide"} -->
# Your Presentation Title
## Subtitle or Event Name
### Your Name | Date

---

<!-- Agenda Slide -->
## Agenda

- **Introduction** - Brief overview
- **Main Topic 1** - Key concepts
- **Main Topic 2** - Implementation details
- **Demo** - Live demonstration
- **Q&A** - Questions and discussion

---

<!-- Section Break -->
<!-- {_class="section-slide"} -->
# Introduction

---

## About This Presentation

- **Objective**: Clear goal statement
- **Target Audience**: Who this is for
- **Key Takeaways**: What you'll learn

> **Note**: Use this format for important callouts and key points

---

<!-- Content Slide Example -->
## Main Topic 1

### Key Points

1. **First important concept**
   - Supporting detail
   - Example or use case

2. **Second important concept**
   - Supporting detail
   - Example or use case

3. **Third important concept**
   - Supporting detail
   - Example or use case

---

## Code Example

Here's how to implement the concept:

```javascript
// Example code with syntax highlighting
function createPresentation(content) {
  return {
    title: content.title,
    slides: content.slides,
    theme: 'branded'
  };
}
```

**Key Features:**
- Syntax highlighting
- Clean formatting
- Easy to follow

---

<!-- Section Break -->
<!-- {_class="section-slide"} -->
# Main Topic 2

---

## Implementation Details

### Step-by-Step Process

1. **Planning Phase**
   - Define requirements
   - Create wireframes

2. **Development Phase**
   - Write code
   - Test functionality

3. **Deployment Phase**
   - Deploy to production
   - Monitor performance

---

## Visual Content

You can add:
- Images: `![Alt text](image-url)`
- Charts and diagrams
- Screenshots
- Videos (with HackMD embed support)

**Pro Tip**: Use consistent image sizing and alignment for professional look

---

<!-- Demo Section -->
<!-- {_class="section-slide"} -->
# Live Demo

---

## Demo: Feature Showcase

**What we'll demonstrate:**
- Core functionality
- User interface
- Integration points

**Duration**: 5-10 minutes

> **Note**: Prepare backup slides in case demo fails

---

<!-- Q&A Section -->
<!-- {_class="section-slide"} -->
# Questions & Discussion

---

## Q&A Session

**Have questions?**

- Ask anytime during the presentation
- Use the chat for questions
- Connect after the session

**Topics for discussion:**
- Implementation challenges
- Best practices
- Future roadmap

---

<!-- Contact/Thank You Slide -->
<!-- {_class="contact-slide"} -->
# Thank You!

## Contact Information

**Your Name**
- Email: your.email@example.com
- GitHub: @yourusername
- LinkedIn: /in/yourprofile
- Twitter: @yourhandle

**Resources:**
- Slides: [link-to-slides]
- Code: [link-to-repo]
- Documentation: [link-to-docs]

---

<!-- Backup Slides Section -->
# Backup Slides

---

## Additional Resources

**Further Reading:**
- Documentation links
- Tutorials
- Community resources

**Tools Mentioned:**
- Tool 1: Description and link
- Tool 2: Description and link
- Tool 3: Description and link

---

## Technical Details

**For those who want to dive deeper:**

- Advanced configuration options
- Performance considerations
- Troubleshooting common issues

<!-- Speaker Notes:
Remember to:
- Practice timing for each slide
- Prepare for common questions
- Have backup plans for technical issues
- Engage with the audience throughout
-->
# HackMD Presentation Workflow

This directory contains templates and examples for creating branded presentations using HackMD's slide mode powered by Reveal.js.

## Quick Start

1. **Copy the template**: Start with `template-branded.md`
2. **Customize branding**: Update CSS variables in the `<style>` section
3. **Add your content**: Replace placeholder content with your presentation
4. **Switch to slide mode**: In HackMD, click the slide icon or press `Ctrl+Alt+S`
5. **Share**: Use HackMD's share functionality for live presentations

## File Structure

```
hackmd-presentations/
├── README.md                          # This workflow guide
├── template-branded.md                # Main branded template
├── demo-polkadot-development.md       # Example presentation
└── assets/                           # Images and media (create as needed)
```

## Template Features

### 🎨 Consistent Branding
- Customizable color palette via CSS variables
- Professional typography (Inter font family)
- Consistent spacing and layout
- Brand-specific slide classes

### 📊 Slide Types
- **Title slides**: `{_class="title-slide"}`
- **Section breaks**: `{_class="section-slide"}`
- **Content slides**: Default styling
- **Contact slides**: `{_class="contact-slide"}`

### 🛠️ Built-in Components
- Code syntax highlighting
- Quote blocks with brand styling
- Structured lists and emphasis
- Speaker notes support

## Customization Guide

### Brand Colors
Update these CSS variables in the `<style>` section:

```css
:root {
  --primary-color: #2563eb;     /* Your main brand color */
  --secondary-color: #64748b;   /* Secondary brand color */
  --accent-color: #f59e0b;      /* Accent for highlights */
  --text-color: #1e293b;        /* Main text color */
  --background-color: #ffffff;  /* Background color */
  --light-gray: #f8fafc;        /* Light backgrounds */
}
```

### Slide Layouts

#### Standard Content Slide
```markdown
## Slide Title

### Subsection

- **Bold point**: Description
- **Another point**: More details

> **Note**: Important callout information
```

#### Code Examples
```markdown
## Code Example

```javascript
// Your code here with syntax highlighting
function example() {
  return "formatted code";
}
\```

**Key Features:**
- Feature 1
- Feature 2
```

#### Section Break
```markdown
<!-- {_class="section-slide"} -->
# Section Title
```

## HackMD Slide Mode Features

### Navigation
- **Arrow keys**: Navigate between slides
- **ESC**: Overview mode
- **S**: Speaker notes view
- **F**: Fullscreen mode

### Slide Separators
- Use `---` to separate slides
- Level 1 headers (`#`) create section slides
- Level 2 headers (`##`) create content slides

### Speaker Notes
Add notes that only appear in speaker view:

```markdown
<!-- Speaker Notes:
- Remember to mention key point
- Prepare for questions about X
- Demo backup plan
-->
```

### Background Options
- Custom backgrounds: `<!-- {_data-background="#color"} -->`
- Gradient backgrounds: `<!-- {_data-background="linear-gradient(45deg, #color1, #color2)"} -->`
- Image backgrounds: `<!-- {_data-background="url(image.jpg)"} -->`

## Best Practices

### 📝 Content Structure
1. **Keep slides focused**: One main idea per slide
2. **Use consistent hierarchy**: H2 for slide titles, H3 for sections
3. **Limit text**: 6-8 bullet points maximum per slide
4. **Include speaker notes**: Add context and reminders

### 🎨 Visual Consistency
1. **Stick to brand colors**: Use the CSS variables consistently
2. **Consistent formatting**: Use the same patterns for similar content
3. **Professional imagery**: High-quality, relevant visuals
4. **Readable fonts**: Stick to the template typography

### 🚀 Presentation Flow
1. **Strong opening**: Clear title and agenda
2. **Logical progression**: Build concepts progressively
3. **Section breaks**: Use section slides to organize content
4. **Clear conclusion**: Summarize key points and provide contact info

### 🔧 Technical Tips
1. **Test beforehand**: Always preview in slide mode before presenting
2. **Backup plans**: Prepare static slides if technology fails
3. **Timing practice**: Use speaker notes to time your presentation
4. **Interactive elements**: Engage audience with questions and polls

## Common Slide Patterns

### Introduction Pattern
```markdown
# Presentation Title
## Subtitle
### Presenter | Event | Date

---

## Agenda
- Topic 1
- Topic 2
- Topic 3
- Q&A

---

## About [Topic/Speaker]
- Background info
- Relevant experience
- What makes this relevant
```

### Technical Demo Pattern
```markdown
## Demo: [Feature Name]

**What we'll demonstrate:**
- Core functionality
- Key benefits
- Integration points

**Duration**: X minutes

> **Note**: Backup slides available if demo fails

---

## Live Demo

[Actual demonstration or screenshot/video]

**Key takeaways:**
- Point 1
- Point 2
- Point 3
```

### Conclusion Pattern
```markdown
## Key Takeaways

1. **Main Point 1**: Brief summary
2. **Main Point 2**: Brief summary
3. **Main Point 3**: Brief summary

---

# Thank You!

## Contact & Resources

**Presenter Name**
- Email: presenter@example.com
- GitHub: @username
- LinkedIn: /in/profile

**Resources:**
- Slides: [link]
- Code: [link]
- Documentation: [link]
```

## Troubleshooting

### Common Issues

**Slides not displaying correctly:**
- Check for missing `---` separators
- Verify CSS syntax in style block
- Ensure proper markdown formatting

**Styling not applied:**
- CSS must be in `<style>` tags at the top
- Check for typos in CSS variable names
- Verify class names match CSS selectors

**Speaker notes not showing:**
- Press `S` key in presentation mode
- Check that notes are in proper comment format
- Verify HackMD permissions

### Performance Tips

1. **Optimize images**: Compress large images before embedding
2. **Limit animations**: Keep auto-animations minimal
3. **Test on target devices**: Check mobile/tablet compatibility
4. **Internet dependency**: Have offline backup for critical presentations

## Advanced Features

### Custom Animations
```html
<!-- Add to specific slides -->
<div data-auto-animate>
  <h2>Animated content</h2>
</div>
```

### Embedded Content
```markdown
<!-- YouTube videos -->
<iframe width="560" height="315" src="https://youtube.com/embed/VIDEO_ID"></iframe>

<!-- Interactive elements -->
<div class="interactive-demo">
  <!-- Custom HTML for demos -->
</div>
```

### Export Options
- **PDF Export**: Use browser print to PDF
- **Static HTML**: Download presentation as HTML file
- **Sharing**: HackMD provides direct presentation links

## Version Control

### File Naming Convention
```
YYYY-MM-DD-event-name-topic.md
```

Examples:
- `2024-09-23-latin-hack-polkadot-intro.md`
- `2024-10-15-conference-name-technical-deep-dive.md`

### Backup Strategy
1. **Version in Git**: Commit presentations to repository
2. **HackMD History**: Use built-in version history
3. **Export copies**: Keep local PDF/HTML backups

## Resources

### HackMD Documentation
- [HackMD Slide Mode](https://hackmd.io/features#Slide-Mode)
- [Markdown Syntax Guide](https://hackmd.io/how-to-use-markdown)

### Reveal.js Resources
- [Reveal.js Documentation](https://revealjs.com/)
- [Markdown in Reveal.js](https://revealjs.com/markdown/)
- [Themes and Styling](https://revealjs.com/themes/)

### Design Resources
- [Color Palette Generators](https://coolors.co/)
- [Font Pairing Tools](https://fontpair.co/)
- [Icon Libraries](https://heroicons.com/)

---

**Happy Presenting! 🎉**

For questions or improvements to this workflow, create an issue or submit a pull request.
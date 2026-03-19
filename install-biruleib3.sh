#!/bin/bash

# Biruleib3 SE Agent Installation Script
# This script safely adds the Biruleib3 Software Engineer agent to any existing BMad project
# without overwriting existing configuration files.

set -e  # Exit on any error

SOURCE_PROJECT="/Users/nomadbitcoin/Projects/coding-sessions/kitdot_w3b3d3v"
TARGET_PROJECT="$1"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🛠️  Biruleib3 SE Agent Installer${NC}"
echo "==============================================="

# Validate input
if [ -z "$TARGET_PROJECT" ]; then
    echo -e "${RED}❌ Error: Please provide target project path${NC}"
    echo "Usage: $0 <target_project_path>"
    echo "Example: $0 /path/to/your/project"
    exit 1
fi

# Validate target project
if [ ! -d "$TARGET_PROJECT" ]; then
    echo -e "${RED}❌ Error: Target project directory does not exist: $TARGET_PROJECT${NC}"
    exit 1
fi

# Check if target has BMad installed
if [ ! -d "$TARGET_PROJECT/.bmad-core" ] || [ ! -d "$TARGET_PROJECT/.claude/commands/BMad" ]; then
    echo -e "${RED}❌ Error: Target project does not have BMad installed${NC}"
    echo "Please install BMad in the target project first."
    exit 1
fi

# Check if source files exist
if [ ! -f "$SOURCE_PROJECT/.claude/commands/BMad/agents/se.md" ]; then
    echo -e "${RED}❌ Error: Biruleib3 source files not found in: $SOURCE_PROJECT${NC}"
    exit 1
fi

echo -e "${YELLOW}📍 Source:${NC} $SOURCE_PROJECT"
echo -e "${YELLOW}📍 Target:${NC} $TARGET_PROJECT"
echo ""

# Function to copy file with verification
copy_file() {
    local source="$1"
    local target="$2"
    local description="$3"

    if [ -f "$source" ]; then
        cp "$source" "$target"
        echo -e "${GREEN}✅ Copied:${NC} $description"
    else
        echo -e "${YELLOW}⚠️  Skipped:${NC} $description (source not found)"
    fi
}

# Function to create directory if it doesn't exist
ensure_dir() {
    local dir="$1"
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo -e "${GREEN}📁 Created directory:${NC} $dir"
    fi
}

echo -e "${BLUE}🚀 Installing Biruleib3 SE Agent...${NC}"
echo ""

# Ensure target directories exist
ensure_dir "$TARGET_PROJECT/.claude/commands/BMad/agents"
ensure_dir "$TARGET_PROJECT/.claude/commands/BMad/tasks"
ensure_dir "$TARGET_PROJECT/.bmad-core/checklists"
ensure_dir "$TARGET_PROJECT/.bmad-core/templates"

echo ""
echo -e "${BLUE}📋 Copying Agent Command...${NC}"

# Copy SE agent command
copy_file "$SOURCE_PROJECT/.claude/commands/BMad/agents/se.md" \
          "$TARGET_PROJECT/.claude/commands/BMad/agents/se.md" \
          "Biruleib3 SE Agent command"

echo ""
echo -e "${BLUE}📋 Copying Tasks...${NC}"

# Copy task commands
copy_file "$SOURCE_PROJECT/.claude/commands/BMad/tasks/prompt-to-story.md" \
          "$TARGET_PROJECT/.claude/commands/BMad/tasks/prompt-to-story.md" \
          "Prompt to Story task"

copy_file "$SOURCE_PROJECT/.claude/commands/BMad/tasks/implement-from-prompt.md" \
          "$TARGET_PROJECT/.claude/commands/BMad/tasks/implement-from-prompt.md" \
          "Implement from Prompt task"

copy_file "$SOURCE_PROJECT/.claude/commands/BMad/tasks/github-create-pr.md" \
          "$TARGET_PROJECT/.claude/commands/BMad/tasks/github-create-pr.md" \
          "GitHub Create PR task"

copy_file "$SOURCE_PROJECT/.claude/commands/BMad/tasks/github-commit-changes.md" \
          "$TARGET_PROJECT/.claude/commands/BMad/tasks/github-commit-changes.md" \
          "GitHub Commit Changes task"

copy_file "$SOURCE_PROJECT/.claude/commands/BMad/tasks/github-branch-management.md" \
          "$TARGET_PROJECT/.claude/commands/BMad/tasks/github-branch-management.md" \
          "GitHub Branch Management task"

echo ""
echo -e "${BLUE}📋 Copying Supporting Files...${NC}"

# Copy supporting files to .bmad-core
copy_file "$SOURCE_PROJECT/.bmad-core/checklists/github-workflow-checklist.md" \
          "$TARGET_PROJECT/.bmad-core/checklists/github-workflow-checklist.md" \
          "GitHub Workflow Checklist"

copy_file "$SOURCE_PROJECT/.bmad-core/templates/github-pr-tmpl.yaml" \
          "$TARGET_PROJECT/.bmad-core/templates/github-pr-tmpl.yaml" \
          "GitHub PR Template"

echo ""
echo -e "${GREEN}🎉 Biruleib3 SE Agent Installation Complete!${NC}"
echo ""
echo -e "${BLUE}🚀 Usage:${NC}"
echo "1. Navigate to your target project: cd $TARGET_PROJECT"
echo "2. Start Claude Code in that directory"
echo "3. Use command: /BMad:agents:se"
echo ""
echo -e "${BLUE}📋 Available Commands:${NC}"
echo "• *implement {prompt}     - Smart implementation routing"
echo "• *create-story {prompt}  - Convert prompts to stories"
echo "• *develop-story          - Execute story implementation"
echo "• *github-pr             - Create pull requests"
echo "• *github-commit         - Commit with standards"
echo "• *github-branch         - Manage branches"
echo "• *run-tests             - Execute testing suite"
echo "• *help                  - Show all commands"
echo ""
echo -e "${YELLOW}📝 Note:${NC} Existing BMad configuration preserved - no settings lost!"
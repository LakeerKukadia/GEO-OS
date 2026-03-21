#!/bin/bash

echo "🚀 Installing GEO-OS Pipeline..."

# Step 1 - Pull latest skills from geo-seo-claude
echo "📦 Fetching latest GEO skills..."
git clone https://github.com/zubair-trabzada/geo-seo-claude.git /tmp/geo-seo-claude
cd /tmp/geo-seo-claude
bash install.sh

# Step 2 - Install Python dependencies
echo "🐍 Installing Python dependencies..."
pip install -r requirements.txt --break-system-packages

# Step 3 - Install agent definitions
echo "🤖 Installing GEO SEO Analyst agent..."
mkdir -p ~/.claude/agents/geo-seo-analyst
cp ~/geo-os-temp/agents/geo-seo-analyst/AGENTS.md ~/.claude/agents/geo-seo-analyst/AGENTS.md

echo "🤖 Installing GEO Solutions Agent..."
mkdir -p ~/.claude/agents/geo-solutions-agent
cp ~/geo-os-temp/agents/geo-solutions-agent/AGENTS.md ~/.claude/agents/geo-solutions-agent/AGENTS.md

# Step 4 - Configure paths dynamically
echo "⚙️ Configuring paths for this machine..."
BASE_PATH="$HOME/Paperclip"
mkdir -p "$BASE_PATH"

sed -i '' "s|/Users/bhavikkukadia/Paperclip|$BASE_PATH|g" ~/.claude/agents/geo-seo-analyst/AGENTS.md
sed -i '' "s|/Users/bhavikkukadia/Paperclip|$BASE_PATH|g" ~/.claude/agents/geo-solutions-agent/AGENTS.md
sed -i '' "s|/Users/bhavikkukadia/.claude|$HOME/.claude|g" ~/.claude/agents/geo-seo-analyst/AGENTS.md
sed -i '' "s|/Users/bhavikkukadia/.claude|$HOME/.claude|g" ~/.claude/agents/geo-solutions-agent/AGENTS.md

# Step 5 - Cleanup
rm -rf /tmp/geo-seo-claude

echo ""
echo "✅ GEO-OS Installation Complete!"
echo ""
echo "📁 Skills installed to: ~/.claude/skills/"
echo "🤖 Agents installed to: ~/.claude/agents/"
echo "💾 Paperclip workspace: $BASE_PATH"
echo ""
echo "Next steps:"
echo "1. Install Paperclip: npx paperclipai onboard --yes"
echo "2. Create a company in Paperclip"
echo "3. Hire GEO SEO Analyst agent"
echo "4. Hire GEO Solutions Agent"
echo "5. Create an issue with a URL to audit"
echo ""
echo "📖 Full docs: https://github.com/LakeerKukadia/GEO-OS"

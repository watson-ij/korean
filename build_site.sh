#!/bin/bash

# Korean Natural Method - Simple HTML Site Builder
# Uses pandoc with a nice CSS framework

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Building Korean Natural Method HTML site...${NC}"

# Check for pandoc
if ! command -v pandoc &> /dev/null; then
    echo -e "${RED}pandoc is required but not installed.${NC}"
    echo "Install with: brew install pandoc (Mac) or apt-get install pandoc (Linux)"
    exit 1
fi

# Create output directory
OUTPUT_DIR="site"
mkdir -p "$OUTPUT_DIR/chapters"
mkdir -p "$OUTPUT_DIR/colloquia"
mkdir -p "$OUTPUT_DIR/sermones"
mkdir -p "$OUTPUT_DIR/annotated"
mkdir -p "$OUTPUT_DIR/workbooks"
mkdir -p "$OUTPUT_DIR/css"

# Download a nice CSS framework (Sakura - clean and minimal)
echo -e "${BLUE}Setting up CSS...${NC}"

# Choose theme (uncomment the one you want)
# THEME="sakura.css"              # Default light
# THEME="sakura-dark.css"         # Dark theme
# THEME="sakura-dark-solarized.css" # Dark solarized
# THEME="sakura-earthly.css"      # Earthly (warm light)
# THEME="sakura-vader.css"        # Vader (high contrast dark)
THEME="sakura-dark.css"           # Using dark as default

if [ ! -f "$OUTPUT_DIR/css/sakura.css" ]; then
    echo -e "${BLUE}Downloading $THEME theme...${NC}"
    curl -s "https://raw.githubusercontent.com/oxalorg/sakura/master/css/$THEME" > "$OUTPUT_DIR/css/sakura.css"
fi

# Create a simple navigation template
cat > "$OUTPUT_DIR/nav.html" << 'EOF'
<nav style="background: #f0f0f0; padding: 1em; margin-bottom: 2em; border-radius: 5px;">
    <a href="index.html">📚 Home</a> |
    <a href="chapters.html">📖 Chapters</a> |
    <a href="colloquia.html">💬 Colloquia</a> |
    <a href="sermones.html">📜 Sermones</a> |
    <a href="vocabulary.html">📝 Vocabulary</a>
</nav>
EOF

# Function to convert markdown to HTML with navigation
convert_with_nav() {
    local input=$1
    local output=$2
    local title=$3
    local prev=$4
    local next=$5
    local annotated_link=$6
    
    # Create navigation links
    local nav_links=""
    [ -n "$prev" ] && nav_links="<a href='$prev'>← Previous</a> | "
    nav_links="$nav_links<a href='../index.html'>Home</a>"
    [ -n "$next" ] && nav_links="$nav_links | <a href='$next'>Next →</a>"
    [ -n "$annotated_link" ] && nav_links="$nav_links | <a href='$annotated_link'>📝 Study Version</a>"
    
    pandoc "$input" \
        --standalone \
        --metadata title="$title" \
        --css="../css/sakura.css" \
        --include-before-body="$OUTPUT_DIR/nav.html" \
        --variable=nav:"$nav_links" \
        --template=template.html \
        -o "$output" 2>/dev/null || \
    pandoc "$input" \
        --standalone \
        --metadata title="$title" \
        --css="../css/sakura.css" \
        -H <(echo "<style>
            nav { background: #f0f0f0; padding: 1em; margin-bottom: 2em; border-radius: 5px; }
            nav a { margin: 0 0.5em; }
            .chapter-nav { text-align: center; padding: 1em; margin: 2em 0; }
            .chapter-nav a { margin: 0 1em; padding: 0.5em 1em; background: #e0e0e0; border-radius: 3px; text-decoration: none; }
        </style>") \
        -B <(echo "<nav><a href='../index.html'>📚 Home</a> | <a href='../chapters.html'>📖 All Chapters</a></nav>") \
        -B <(echo "<div class='chapter-nav'>$nav_links</div>") \
        -A <(echo "<div class='chapter-nav'>$nav_links</div>") \
        -o "$output"
}

# Build chapter pages with navigation
echo -e "${BLUE}Converting chapters...${NC}"
chapters=(chapters/chapter-*.md)
for i in "${!chapters[@]}"; do
    chapter="${chapters[$i]}"
    if [ -f "$chapter" ]; then
        num=$(basename "$chapter" .md | sed 's/chapter-//')
        prev=""
        next=""
        annotated=""
        
        # Determine previous/next links
        if [ $i -gt 0 ]; then
            prev_num=$(basename "${chapters[$i-1]}" .md | sed 's/chapter-//')
            prev="chapter-${prev_num}.html"
        fi
        if [ $i -lt $((${#chapters[@]}-1)) ]; then
            next_num=$(basename "${chapters[$i+1]}" .md | sed 's/chapter-//')
            next="chapter-${next_num}.html"
        fi
        
        # Check if annotated version exists
        if [ -f "annotated/chapter-${num}-annotated.md" ]; then
            annotated="../annotated/chapter-${num}-annotated.html"
        fi
        
        convert_with_nav "$chapter" "$OUTPUT_DIR/chapters/chapter-${num}.html" \
            "Chapter $num" "$prev" "$next" "$annotated"
        echo -e "${GREEN}✓${NC} Chapter $num"
    fi
done

# Build annotated pages
echo -e "${BLUE}Converting annotated versions...${NC}"
for file in annotated/chapter-*-annotated.md; do
    if [ -f "$file" ]; then
        num=$(basename "$file" -annotated.md | sed 's/chapter-//')
        
        # Create with link back to original
        pandoc "$file" \
            --standalone \
            --metadata title="Chapter $num - Study Version" \
            --css="../css/sakura.css" \
            -H <(echo "<style>
                .annotation { background: rgba(255, 255, 0, 0.2); padding: 2px 4px; border-radius: 3px; }
                .grammar-note { color: #0066cc; font-style: italic; }
                .particle { background: rgba(100, 200, 255, 0.2); padding: 1px 3px; border-radius: 2px; }
                .vocab { background: rgba(144, 238, 144, 0.2); padding: 2px 4px; border-radius: 3px; }
                .warning { background: rgba(255, 200, 200, 0.3); padding: 4px; margin: 4px 0; border-left: 3px solid #ff6b6b; }
                nav.study-nav { background: #f9f9f9; padding: 1em; margin-bottom: 2em; border-radius: 5px; border: 2px solid #4CAF50; }
            </style>") \
            -B <(echo "<nav class='study-nav'>
                <strong>📚 Study Mode</strong> | 
                <a href='../chapters/chapter-${num}.html'>📖 Back to Original</a> | 
                <a href='../index.html'>🏠 Home</a>
                </nav>
                <div style='background: #e8f5e9; padding: 10px; border-radius: 5px; margin-bottom: 20px;'>
                    💡 <strong>Study Version:</strong> This page includes grammar explanations, vocabulary notes, and learning tips.
                </div>") \
            -o "$OUTPUT_DIR/annotated/chapter-${num}-annotated.html"
        echo -e "${GREEN}✓${NC} Chapter $num annotated"
    fi
done

# Build workbook pages
echo -e "${BLUE}Converting workbooks...${NC}"
for file in workbooks/chapter-*-workbook.md; do
    if [ -f "$file" ]; then
        num=$(basename "$file" -workbook.md | sed 's/chapter-//')
        
        pandoc "$file" \
            --standalone \
            --metadata title="Chapter $num - Workbook" \
            --css="../css/sakura.css" \
            -B <(echo "<nav>
                <a href='../chapters/chapter-${num}.html'>📖 Original Chapter</a> | 
                <a href='../annotated/chapter-${num}-annotated.html'>📝 Study Version</a> | 
                <a href='../index.html'>🏠 Home</a>
                </nav>") \
            -o "$OUTPUT_DIR/workbooks/chapter-${num}-workbook.html"
        echo -e "${GREEN}✓${NC} Chapter $num workbook"
    fi
done

# Build colloquia pages
echo -e "${BLUE}Converting colloquia...${NC}"
for file in colloquia/colloquium-*.md; do
    if [ -f "$file" ]; then
        num=$(basename "$file" .md | sed 's/colloquium-//')
        pandoc "$file" \
            --standalone \
            --metadata title="Colloquium $num" \
            --css="../css/sakura.css" \
            -B <(echo "<nav><a href='../index.html'>📚 Home</a> | <a href='../colloquia.html'>💬 All Colloquia</a></nav>") \
            -o "$OUTPUT_DIR/colloquia/colloquium-${num}.html"
        echo -e "${GREEN}✓${NC} Colloquium $num"
    fi
done

# Build index page
echo -e "${BLUE}Creating index page...${NC}"
cat > "$OUTPUT_DIR/index.md" << 'EOF'
# Korean Natural Method 📚

## 한국어 자연 학습법

Welcome to your Korean learning journey using the natural method, inspired by Hans Ørberg's approach.

### 📖 Main Chapters
Start here with the main story following 민수 and 지은:

EOF

# Add chapter links to index
for chapter in chapters/chapter-*.md; do
    if [ -f "$chapter" ]; then
        num=$(basename "$chapter" .md | sed 's/chapter-//')
        # Extract title from first h1 in file
        title=$(grep "^# " "$chapter" | head -1 | sed 's/# //')
        echo "- [Chapter $num: $title](chapters/chapter-${num}.html)" >> "$OUTPUT_DIR/index.md"
    fi
done

cat >> "$OUTPUT_DIR/index.md" << 'EOF'

### 💬 Colloquia
Additional dialogues for extra practice:

EOF

# Add colloquium links
for file in colloquia/colloquium-*.md; do
    if [ -f "$file" ]; then
        num=$(basename "$file" .md | sed 's/colloquium-//')
        title=$(grep "^# " "$file" | head -1 | sed 's/# //')
        echo "- [Colloquium $num: $title](colloquia/colloquium-${num}.html)" >> "$OUTPUT_DIR/index.md"
    fi
done

cat >> "$OUTPUT_DIR/index.md" << 'EOF'

### 📝 Study Materials
Annotated versions and workbooks for deeper learning:

EOF

# Add annotated chapter links
for file in annotated/chapter-*-annotated.md; do
    if [ -f "$file" ]; then
        num=$(basename "$file" -annotated.md | sed 's/chapter-//')
        echo "- [Chapter $num - Study Version](annotated/chapter-${num}-annotated.html)" >> "$OUTPUT_DIR/index.md"
    fi
done

# Add workbook links if any exist
if ls workbooks/chapter-*-workbook.md 1> /dev/null 2>&1; then
    echo "" >> "$OUTPUT_DIR/index.md"
    echo "### 📓 Workbooks" >> "$OUTPUT_DIR/index.md"
    for file in workbooks/chapter-*-workbook.md; do
        if [ -f "$file" ]; then
            num=$(basename "$file" -workbook.md | sed 's/chapter-//')
            echo "- [Chapter $num - Practice Workbook](workbooks/chapter-${num}-workbook.html)" >> "$OUTPUT_DIR/index.md"
        fi
    done
fi

cat >> "$OUTPUT_DIR/index.md" << 'EOF'

### 📚 Resources
- [Vocabulary Tracker](vocabulary.html)
- [Study Guide](study-guide.html)

---
*Generated: 
EOF
echo "$(date)*" >> "$OUTPUT_DIR/index.md"

# Convert index
pandoc "$OUTPUT_DIR/index.md" \
    --standalone \
    --metadata title="Korean Natural Method" \
    --css="css/sakura.css" \
    -o "$OUTPUT_DIR/index.html"

# Convert vocabulary tracker if it exists
if [ -f "vocabulary-tracker.md" ]; then
    echo -e "${BLUE}Converting vocabulary tracker...${NC}"
    pandoc "vocabulary-tracker.md" \
        --standalone \
        --metadata title="Vocabulary Tracker" \
        --css="css/sakura.css" \
        -B <(echo "<nav><a href='index.html'>📚 Home</a></nav>") \
        -o "$OUTPUT_DIR/vocabulary.html"
fi

# Clean up temporary files
rm -f "$OUTPUT_DIR/index.md" "$OUTPUT_DIR/nav.html"

echo -e "${GREEN}✅ Site built successfully!${NC}"
echo -e "${BLUE}Open ${OUTPUT_DIR}/index.html in your browser to view.${NC}"

# Optional: Open in browser (skip in CI environment)
if [ -z "$CI" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "$OUTPUT_DIR/index.html"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open "$OUTPUT_DIR/index.html" 2>/dev/null || true
    fi
fi

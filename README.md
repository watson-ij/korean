# Korean Natural Method - User Guide

## Quick Start

You want to learn Korean through particle physics stories. This system generates chapters progressively, validates them, and builds a website for reading. Here's how to use it without micromanaging.

## Initial Setup

```bash
# 1. Create project structure
mkdir korean-natural-method
cd korean-natural-method
mkdir -p .claude/commands chapters colloquia annotated validation workbooks

# 2. Copy all command files to .claude/commands/
# Each command from the documentation should be its own file

# 3. Place CLAUDE.md in root directory
# This contains all character info and progression plans

# 4. Place vocabulary-tracker.md in root
# This tracks all vocabulary introduced

# 5. Place korean-validation.md in validation/
# This contains the Korean validation rules
```

## Daily Workflow: Creating New Content

### The Universal Pipeline (Works for Everything!)

```bash
# For chapters
/write_chapter 2
/auto_fix chapters/chapter-02.md

# For colloquia
/generate_colloquium 2 민수
/auto_fix colloquia/colloquium-02.md

# For sermones (after chapter 10)
/generate_sermo 12
/auto_fix sermones/sermo-12.md

# For narrationes
/generate_narratio 5-7
/auto_fix narrationes/narratio-5-7.md
```

**That's it!** `auto_fix` automatically:
- Detects what type of content it is
- Applies appropriate validation (strict for chapters, relaxed for supplements)
- Fixes issues while preserving the right style
- Re-validates to ensure quality

### Quick Examples

```bash
# Monday: Write new chapter
/write_chapter 3
/auto_fix chapters/chapter-03.md
./build_site.sh

# Tuesday: Add practice dialogue
/generate_colloquium 3 하나
/auto_fix colloquia/colloquium-03.md
./build_site.sh

# Wednesday: Struggling? Get annotations
/annotate_chapter 3 detailed
./build_site.sh
```

### Building the Website

```bash
# After generating a few chapters
./build_site.sh

# Open site/index.html in your browser
# Dark theme is default, change in script if needed
```

## Typical Learning Session

1. **Read Chapter 2** on the website
2. **Struggled with something?** Generate annotated version:
   ```bash
   /annotate_chapter 2 detailed
   ./build_site.sh
   ```
3. **Want more practice?** Generate colloquium:
   ```bash
   /generate_colloquium 2 마이크  # See Michael's struggles
   ```
4. **Track your progress** by re-reading Chapter 1 - you'll understand more!

## Advanced Workflows

### When You Encounter Real Situations

Had a confusing conversation in lab? Add it to the story:

```bash
/incorporate_scenario 3 "Someone said 논문 검토 부탁드려요 vs 검토해 보세요 and I didn't understand the difference"
```

### Batch Operations

```bash
# Validate everything at once
/batch_validate chapters/

# Generate all supplementary materials for a chapter
/generate_colloquium 5 민수
/generate_colloquium 5 준호
/generate_sermo 5  # (After chapter 10)
./build_site.sh
```

### Check Your Progress

```bash
# See what supplementary materials exist
/check_supplement_coverage 10

# Review all vocabulary so far
# Just open vocabulary-tracker.md
```

## What the Pipeline Does For You

When you run `/auto_fix`, it automatically:

1. ✅ **Checks Korean sounds natural** (particles, speech levels)
2. ✅ **Verifies story logic** (no meeting at 3pm if class ends at 4pm)  
3. ✅ **Ensures grammar progression** (no past tense in Chapter 1)
4. ✅ **Validates character consistency** (Ha-na doesn't know advanced physics yet)
5. ✅ **Fixes issues automatically** based on priority
6. ✅ **Documents all changes** for transparency

## Command Reference (Everyday Use)

### Creating Content
- `/write_chapter N` - Generate chapter N
- `/generate_colloquium N 민수` - Casual dialogue supplement
- `/generate_sermo N` - Formal style supplement (after Ch 10)
- `/auto_fix path/to/file.md` - Validate and fix ANY content type

### When Struggling
- `/annotate_chapter N detailed` - Full grammar explanations
- `/generate_difficulty_supplement N [topic]` - Extra practice
- `/generate_workbook N` - Interactive exercises

### Building Website
- `./build_site.sh` - Creates HTML site with navigation

## Tips for Learning

1. **Don't skip ahead** - Grammar builds systematically
2. **Re-read earlier chapters** - You'll discover new understanding
3. **Read colloquia for repetition** - Same vocabulary, different context
4. **Use annotations when stuck** - But try without them first
5. **Michael is you** - His mistakes and confusion mirror your journey

## Troubleshooting

**"Chapter seems unnatural"**
```bash
/validate_korean chapters/chapter-N.md --level thorough
# Review the report, then:
/manual_review N "Make dialogue more casual"
```

**"I want to see what changed"**
- Check the comment at top of fixed files
- Git diff works great: `git diff chapter-03.md chapter-03-fixed.md`

**"Too much new vocabulary"**
```bash
/manual_review N "Reduce new vocabulary to 7 words"
```

**"Michael's pronunciation issue is confusing"**
- The [bracketed text] shows what Koreans hear
- If it's too confusing, you can ignore brackets on first read

## File Structure You'll See

```
korean-natural-method/
├── CLAUDE.md                 # Don't edit - it's the master plan
├── vocabulary-tracker.md     # Updates automatically
├── chapters/
│   ├── chapter-01.md         # Main story
│   ├── chapter-02.md
│   └── chapter-02-fixed.md   # After auto_fix
├── colloquia/
│   └── colloquium-01.md     # Supplementary dialogues
├── annotated/
│   └── chapter-01-annotated.md  # Study versions
├── validation/
│   ├── korean-validation.md     # Validation rules
│   └── validation-reports/      # Check if curious
└── site/
    └── index.html           # Your reading website
```

## The Learning Path

**Chapters 1-5**: Foundation
- Present tense only
- Lab life, daily routines
- Basic particles

**Chapters 6-10**: Past & Future
- Start talking about what happened
- Planning discussions
- CERN trip planning begins

**Chapters 11-15**: Split narratives
- Jun-ho at CERN
- Min-su in Seoul
- Weekly Zoom meetings connect stories

**Chapters 16-20**: Complex grammar
- Indirect speech (교수님이 말씀하시길...)
- Because/so connections
- Michael improves noticeably

**Chapters 21-25**: Natural Korean
- Conference presentations
- Job applications
- Your Korean is getting real!

## Remember

- **Start with `/write_chapter N` → `/auto_fix N`** - It handles the complexity
- **Build the website** after every few chapters for better reading
- **Trust the progression** - It's based on proven methods
- **Michael's struggles are features, not bugs** - They mirror your learning

## Ready to Start?

```bash
# Chapter 2
/write_chapter 2
/auto_fix chapters/chapter-02.md

# Add supplementary material
/generate_colloquium 2 민수
/auto_fix colloquia/colloquium-02.md

# Build and read
./build_site.sh
# Open site/index.html and start reading!
```

---

*System designed to create Ørberg-style Korean learning through particle physics stories. No Korean teacher required, just patience and regular reading.*

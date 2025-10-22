# Korean Validation Command for Claude Code

## Project Structure Update
```
korean-natural-method/
├── CLAUDE.md
├── vocabulary-tracker.md           # NOW INCLUDES BASELINE PREREQUISITES
├── validation/
│   ├── korean-validation.md      # The validation rules/methods
│   ├── validation-command.md      # This file
│   └── validation-reports/        # Generated reports
│       └── ...
├── chapters/
└── ...
```

## Important: Baseline Prerequisites Approach (Updated 2025-10-22)

**Target Audience:** Beginner-Intermediate Korean learners

**Validation Philosophy:**
This project assumes learners have **baseline Korean knowledge** before starting Chapter 1. The vocabulary-tracker.md now includes a comprehensive "Baseline Prerequisites" section (~300 common words) that should NOT be flagged as vocabulary violations.

**What to Validate:**
- ✅ **Domain-specific vocabulary** (particle physics, research lab context) - must be introduced in chapters
- ✅ **Grammar progression** - must follow CLAUDE.md strictly
- ✅ **Story consistency** - timeline, character knowledge, locations
- ✅ **Korean naturalness** - particles, word order, formality

**What NOT to Flag:**
- ❌ **Baseline conversation words** - 안녕, 네, 응, 괜찮아, etc.
- ❌ **Common pronouns** - 나, 저, 우리, 너, 누구, etc.
- ❌ **Basic particles** - 은/는, 이/가, 을/를, 에, 에서, 도, etc.
- ❌ **Essential verbs** - 하다, 가다, 오다, 있다, 먹다, etc. (see full list in vocab tracker)
- ❌ **Computer/office basics** - 컴퓨터, 키보드, 화면, 책상, etc.
- ❌ **Numbers and time** - 시, 분, 반, 1-10, days of week, etc.

**When in doubt:** Check vocabulary-tracker.md → Baseline Prerequisites section first!

---

## 13. validate_korean

**Command**: `validate_korean [file_or_directory] [--level basic|thorough|quick]`

**Instructions for Claude Code**:
```
Load validation/korean-validation.md as your validation rulebook.
Then perform the requested validation level:

QUICK VALIDATION (--level quick):
1. Particle Rule Check
   - Load Section 2 "Particle Verification Rules" from korean-validation.md
   - Scan for impossible combinations:
     * 을/를 + 있다/없다
     * Double particles (에서에, 에를, etc.)
     * 이/가 + transitive verb + object
   - Flag any violations with line numbers

2. Speech Level Consistency
   - Within each dialogue, verify consistent formality
   - Check for mixed endings (반말 + 존댓말 in same conversation)
   - Flag: "Line 45: Mixed speech level - '먹어' followed by '주세요'"

3. Common Error Patterns
   - Load Section 9 "Common Unnatural Patterns to Avoid"
   - Check for word-order issues
   - Check for over-translation patterns
   - Flag suspicious patterns

Output: validation-reports/quick-[filename]-[date].md

BASIC VALIDATION (--level basic or default):
Include everything from QUICK plus:

4. Dialogue Naturalness Check
   - Load Section 5 "Dialogue Naturalness Checklist"
   - In casual dialogue, check for:
     * Appropriate contractions (그러면→그럼)
     * Subject omission (natural in Korean)
     * Natural question forms (뭐 해? not 무엇을 해?)
   - Generate naturalness score (0-10)

5. Back-Translation Test (sample)
   - Select 5 random sentences from dialogues
   - Select 3 sentences introducing new grammar
   - Note: "Would need Papago API for actual back-translation"
   - Flag sentences that seem like English word-order

6. Collocation Verification
   - Check common verb-object pairs against Section 2
   - Verify natural combinations:
     * 수업이 있다 ✓ (not 수업을 있다)
     * 밥을 먹다 ✓ (not 밥이 먹다)
     * 커피를 마시다 ✓
   - Flag unusual combinations

Output: validation-reports/basic-[filename]-[date].md

THOROUGH VALIDATION (--level thorough):
Include everything from BASIC plus:

7. Corpus Pattern Analysis
   - Extract all unique sentence patterns
   - Group by grammar structure
   - Flag statistical outliers
   - Note: "In production, would check against Sejong Corpus patterns"

8. Google Search Simulation
   - Extract 10 representative phrases
   - Especially phrases using new grammar
   - Note which phrases would need searching:
     * "Check Google: '도서관에서 만나자'"
     * "Check Google: '수업이 몇 시에 끝나?'"
   - Flag phrases that seem too textbook-like

9. Natural Progression Check
   - Verify vocabulary is from vocabulary-tracker.md
     * Check against BOTH Baseline Prerequisites AND chapter-specific vocabulary
     * Baseline words (~300 common words) are assumed known - do NOT flag as errors
     * Only flag domain-specific words not yet introduced in chapters
   - Check grammar matches expected chapter level
   - Ensure no advanced grammar accidentally used

10. Comprehensive Scoring
    Rate based on Section 12 "Quality Score Rubric":
    - Particles (0-10)
    - Dialogue (0-10)  
    - Contractions (0-10)
    - Word Order (0-10)
    - Collocations (0-10)
    - Overall confidence score

Output: validation-reports/thorough-[filename]-[date].md
```

## 14. validate_dialogue

**Command**: `validate_dialogue [chapter_number]`

**Instructions for Claude Code**:
```
Specialized validation focusing only on dialogue sections.
Reference korean-validation.md Sections 5 and 11.

1. Extract all dialogue from the chapter
2. For each conversation:
   - Check relationship between speakers
   - Verify appropriate speech level
   - Check for natural contractions
   - Verify natural turn-taking patterns
   - Flag overly complete sentences (unnatural)

3. Dialogue-specific checks:
   - Fillers present? (아, 음, 그래, 뭐)
   - Natural interruptions?
   - Topic/subject omission where natural?
   - Appropriate casual markers?

Output sample:
---
Dialogue Validation Report - Chapter X

Conversation 1 (민수 & 지은):
✓ Consistent 반말 (friends)
✓ Natural contractions used
⚠ Line 23: "저는 가요" - should be casual
✗ Line 45: Every sentence has explicit subject (unnatural)

Suggested fixes:
- Line 23: "나 가" or just "가"
- Lines 40-50: Remove some subject markers
---
```

## 15. batch_validate

**Command**: `batch_validate [directory] [--fix-common]`

**Instructions for Claude Code**:
```
Validate all .md files in directory.

1. Run quick validation on all files
2. Generate summary report
3. If --fix-common flag is set:
   - Auto-fix safe corrections:
     * 그러면 → 그럼 in casual dialogue
     * Remove double particles
     * Fix obvious particle errors
   - Create backup before changes
   - Log all auto-corrections

Output: validation-reports/batch-report-[date].md
```

## 16. generate_validation_checklist

**Command**: `generate_validation_checklist [chapter_number]`

**Instructions for Claude Code**:
```
Create a manual checklist for human spot-checking.

Based on the chapter content and korean-validation.md:
1. Generate 5 most important phrases to verify
2. Create Google search queries to check
3. List specific Korean drama episodes that might have similar contexts
4. Suggest 3 sentences for HelloTalk/HiNative verification
5. Provide back-translation test sentences

Output format:
---
Manual Validation Checklist - Chapter X

Priority Phrases for Google Search:
□ "도서관에서 만나자" - Expected: 10,000+ results
□ "수업이 몇 시에 끝나?" - Expected: common pattern
□ [phrase] - [expected result]

Back-Translation Test:
1. Original: "민수는 지하철을 타요"
   Expected English: "Minsu takes the subway"
   Check if returns similar Korean

Drama Context Check:
- University scenes: Check "청춘기록" Episode 1-3
- Cafe conversations: Check "로맨스는 별책부록"

For Native Speaker Verification:
Post on HelloTalk: "Is this natural?"
1. [Most uncertain sentence]
2. [New grammar example]
3. [Casual dialogue sample]
---
```

## 17. track_corrections

**Command**: `track_corrections [chapter_number] [correction_notes]`

**Instructions for Claude Code**:
```
Maintain a corrections database for pattern learning.

When errors are found and fixed:
1. Log the error pattern
2. Note the correction
3. Update validation rules if needed
4. Check if error appears elsewhere

Store in: validation/correction-history.md

Format:
---
Date: [date]
Chapter: [number]
Error Type: [Particle/Word Order/Formality/etc]
Original: [incorrect phrase]
Corrected: [natural version]
Rule: [Add to validation rules if systematic]
---

After 20+ corrections, generate common patterns report.
```

## Usage Workflow

```bash
# Initial validation after writing
claude "validate_korean chapters/chapter-02.md --level basic"

# Check all dialogues specifically  
claude "validate_dialogue 2"

# Before finalizing a batch of chapters
claude "batch_validate chapters/ --fix-common"

# For manual verification
claude "generate_validation_checklist 2"

# After getting feedback
claude "track_corrections 2 'Changed 뭐를 해 to 뭐 해, removed excessive particles'"

# Thorough check for important chapters
claude "validate_korean chapters/chapter-10.md --level thorough"
```

## Report Interpretation

### Confidence Levels
- **HIGH (8-10/10)**: Ready to use
- **MEDIUM (6-7/10)**: Check flagged items
- **LOW (<6/10)**: Needs revision

### Priority Fixes
1. **CRITICAL**: Particle errors, impossible grammar
2. **HIGH**: Unnatural dialogue, wrong speech levels
3. **MEDIUM**: Missing contractions, too formal
4. **LOW**: Style preferences, minor optimizations

### When to Seek Native Review
- Confidence score below 7/10
- Introducing new complex grammar
- Cultural context critical
- After every 5 chapters as spot check

## Integration with Main Workflow

```bash
# Standard chapter creation with validation
claude "plan_next_chapter 3"
claude "write_chapter 3"
claude "validate_korean chapters/chapter-03.md"  # NEW STEP
claude "review_chapter 3"  # Now includes validation results
claude "update_vocab_tracker 3"
```

## Notes

- The validator references korean-validation.md as the source of truth
- Quick validation should take <1 minute
- Basic validation is the default for regular use
- Thorough validation for milestone chapters (5, 10, 15, etc.)
- All reports saved for pattern analysis
- Corrections database improves future validation

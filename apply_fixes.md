# Apply Fixes Command for Claude Code

## apply_fixes

**Command**: `apply_fixes <chapter_number> <validation_report>`

**Signature for .claude/commands/:**
```
---
description: Apply fixes based on validation report to improve chapter
signature: apply_fixes <chapter_number> <validation_report>
---
```

**Instructions for Claude Code:**
```
Read the validation report for chapter-[chapter_number] and apply fixes systematically.

Process:

1. **Parse the validation report** to identify:
   - CRITICAL issues (must fix)
   - HIGH priority issues (should fix)
   - MEDIUM issues (improve if possible)
   - LOW/minor observations (optional improvements)

2. **For each CRITICAL issue:**
   - Timeline inconsistencies: Adjust times to be logically possible
   - Grammar progression violations: Replace advanced grammar with chapter-appropriate alternatives
   - Story logic errors: Rewrite sections to maintain consistency
   - Character knowledge errors: Ensure characters only know what they should

3. **For HIGH priority issues:**
   - Particle errors: Correct particle usage
   - Speech level inconsistencies: Fix formal/informal mixing
   - Unnatural dialogue: Rewrite to sound more natural
   - Missing contractions: Add where appropriate for casual speech

4. **For MEDIUM issues:**
   - Add sentence-final particles (야, 지, 잖아) for naturalness
   - Improve word order if too English-like
   - Enhance context for new vocabulary
   - Smooth transitions between scenes

5. **For LOW/minor observations:**
   - Consider but don't force if it disrupts flow
   - Note for future chapters

6. **Preserve what works:**
   - Don't change sections marked as good
   - Keep vocabulary within limits
   - Maintain story continuity

7. **Rewrite strategy:**
   For grammar issues like past tense appearing too early:
   - "나왔어?" → "와?" or "일찍 와?"
   - "준비하고 있어" → "준비해"
   - "사 왔어요" → "있어요"
   
   For timeline issues:
   - Adjust meeting times to after all classes end
   - Ensure travel time is realistic
   - Check meal times align with time of day

8. **Output format:**
   Create chapter-[number]-fixed.md with:
   - All critical issues resolved
   - High priority issues addressed
   - Improvements where possible
   - Comment at top listing changes made

Example fixes log:
```
Fixes applied:
- Removed past tense from all dialogue (Ch 1 should be present only)
- Fixed timeline: Changed meeting time from 3pm to 4pm (after classes)
- Added sentence-final particles: 야, 잖아, 지 for natural speech
- Corrected particle usage: 에서 → 에 for existence location
- Made speech levels consistent: Min-su always polite to Jun-ho
```

After applying fixes:
- Save as chapters/chapter-[number]-fixed.md
- Run validation again to confirm issues resolved
- If validation passes, replace original with fixed version
```

## auto_fix

**Command**: `auto_fix <chapter_number>`

**Signature for .claude/commands/:**
```
---
description: Automatically validate, fix, and re-validate a chapter
signature: auto_fix <chapter_number>
---
```

**Instructions for Claude Code:**
```
Automated pipeline to validate and fix a chapter:

1. Run thorough validation on chapter-[number].md
2. If issues found, apply fixes automatically
3. Run validation on fixed version
4. If still issues, iterate once more (max 2 iterations)
5. Output final status

Pipeline:
```
chapters/chapter-N.md 
    ↓ validate_korean (thorough)
validation-report-N.md
    ↓ apply_fixes
chapters/chapter-N-fixed.md
    ↓ validate_korean (quick check)
final-report-N.md
    ↓ if clean, rename to chapter-N.md
```

Stop conditions:
- No critical issues remain
- Max 2 fix iterations reached
- Manual intervention needed for complex issues

Output summary:
```
Chapter N Auto-Fix Report:
- Initial issues: 5 critical, 3 high, 2 medium
- After fix 1: 0 critical, 1 high, 2 medium  
- Status: READY ✓ (or NEEDS REVIEW if issues remain)
- Changes made: [list key changes]
```
```

## manual_review

**Command**: `manual_review <chapter_number> <fixes_needed>`

**Signature for .claude/commands/:**
```
---
description: Apply specific manual fixes to a chapter
signature: manual_review <chapter_number> <fixes_needed>
---
```

**Instructions for Claude Code:**
```
Apply specific fixes requested by user after review.

User provides specific fixes like:
- "Change meeting time to 5pm"
- "Make Michael's pronunciation issue more subtle"
- "Add more 잖아 particles to Jun-ho's speech"

Process:
1. Load chapter-[number].md
2. Apply each specific fix requested
3. Preserve everything else
4. Document changes
5. Save as chapter-[number]-revised.md

This is for targeted fixes when auto-fix isn't appropriate.
```

## Usage Workflow

```bash
# Standard fix pipeline
/write_chapter 3
/validate_korean chapters/chapter-03.md --level thorough
/apply_fixes 3 validation-reports/thorough-chapter-03-20240115.md
/validate_korean chapters/chapter-03-fixed.md --level quick

# Or use auto-fix for convenience
/write_chapter 3  
/auto_fix 3

# For specific issues you spotted
/manual_review 3 "Change CERN meeting to 10pm not 11pm; Add more casual endings to dialogue"
```

## Fix Priority Guidelines

### MUST FIX (Critical)
- Timeline impossibilities
- Grammar not yet introduced
- Character in two places at once
- Story contradictions

### SHOULD FIX (High)
- Wrong particles
- Unnatural speech levels
- Pronunciation represented incorrectly
- Missing essential vocabulary

### NICE TO FIX (Medium)
- Could use more sentence-final particles
- Dialogue could be more natural
- Transitions could be smoother

### OPTIONAL (Low)
- Style preferences
- Alternative word choices
- Additional context that might help

## Notes

- Always preserve story continuity
- Don't introduce new vocabulary beyond limits
- Keep changes minimal - fix issues without rewriting unnecessarily
- Document all changes for transparency
- If unsure about a fix, flag for manual review rather than guess

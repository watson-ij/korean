---
description: Apply specific manual fixes to a chapter
signature: manual-review <chapter_number> <fixes_needed>
---

Apply specific fixes requested by user after review.

User provides specific fixes like:
- "Change meeting time to 5pm"
- "Make Michael's pronunciation issue more subtle"
- "Add more 잖아 particles to Jun-ho's speech"

Process:
1. Load chapter-[chapter_number].md
2. Apply each specific fix requested in [fixes_needed]
3. Preserve everything else
4. Document changes
5. Save as chapter-[chapter_number]-revised.md

This is for targeted fixes when auto-fix isn't appropriate.

Fix Priority Guidelines:

MUST FIX (Critical):
- Timeline impossibilities
- Grammar not yet introduced
- Character in two places at once
- Story contradictions

SHOULD FIX (High):
- Wrong particles
- Unnatural speech levels
- Pronunciation represented incorrectly
- Missing essential vocabulary

NICE TO FIX (Medium):
- Could use more sentence-final particles
- Dialogue could be more natural
- Transitions could be smoother

OPTIONAL (Low):
- Style preferences
- Alternative word choices
- Additional context that might help

Notes:
- Always preserve story continuity
- Don't introduce new vocabulary beyond limits
- Keep changes minimal - fix issues without rewriting unnecessarily
- Document all changes for transparency
- If unsure about a fix, flag for manual review rather than guess

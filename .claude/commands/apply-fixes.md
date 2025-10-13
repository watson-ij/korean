---
description: Apply fixes based on validation report to improve chapter
signature: apply-fixes <chapter_number> <validation_report>
---

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
   Create chapter-[chapter_number]-fixed.md with:
   - All critical issues resolved
   - High priority issues addressed
   - Improvements where possible
   - Comment at top listing changes made

Example fixes log:
```
<!-- Fixes applied:
- Removed past tense from all dialogue (Ch 1 should be present only)
- Fixed timeline: Changed meeting time from 3pm to 4pm (after classes)
- Added sentence-final particles: 야, 잖아, 지 for natural speech
- Corrected particle usage: 에서 → 에 for existence location
- Made speech levels consistent: Min-su always polite to Jun-ho
-->
```

After applying fixes:
- Save as chapters/chapter-[chapter_number]-fixed.md
- Run validation again to confirm issues resolved
- If validation passes, replace original with fixed version

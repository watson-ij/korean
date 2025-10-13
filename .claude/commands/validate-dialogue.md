---
description: Specialized validation focusing only on dialogue sections
signature: validate-dialogue <chapter_number>
---

Specialized validation focusing only on dialogue sections in chapter-[chapter_number].md.
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

Output sample format:
---
Dialogue Validation Report - Chapter [chapter_number]

Conversation 1 (민수 & 지은):
✓ Consistent 반말 (friends)
✓ Natural contractions used
⚠ Line 23: "저는 가요" - should be casual
✗ Line 45: Every sentence has explicit subject (unnatural)

Suggested fixes:
- Line 23: "나 가" or just "가"
- Lines 40-50: Remove some subject markers
---

Output as: validation-reports/dialogue-[chapter_number]-[date].md

---
description: Maintain a corrections database for pattern learning
signature: track-corrections <chapter_number> <correction_notes>
---

Maintain a corrections database for pattern learning.

When errors are found and fixed:
1. Log the error pattern from chapter-[chapter_number].md
2. Note the correction specified in [correction_notes]
3. Update validation rules if needed
4. Check if error appears elsewhere

Store in: validation/correction-history.md

Format:
---
Date: [date]
Chapter: [chapter_number]
Error Type: [Particle/Word Order/Formality/etc]
Original: [incorrect phrase]
Corrected: [natural version]
Rule: [Add to validation rules if systematic]
---

After 20+ corrections, generate common patterns report to help improve:
- Future writing
- Validation rules
- Common pitfalls awareness

Output: Appends to validation/correction-history.md

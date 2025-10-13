---
description: Automatically validate, fix, and re-validate any content type
signature: auto-fix <file_path>
---

Automated pipeline to validate and fix any content type (chapter, colloquium, sermo, narratio, etc.)

1. Detect content type from file path:
   - chapters/chapter-N.md → Chapter
   - colloquia/colloquium-N.md → Colloquium
   - sermones/sermo-N.md → Sermo
   - narrationes/narratio-N.md → Narratio
   - annotated/*-annotated.md → Annotated (skip validation)
   - workbooks/*-workbook.md → Workbook (light validation only)

2. Apply appropriate validation level based on type:
   - Chapters: thorough validation (check grammar progression, story logic, etc.)
   - Colloquia: basic validation (focus on natural dialogue, less strict on progression)
   - Sermones: basic validation (formal style check, vocabulary verification)
   - Narrationes: thorough validation (story consistency across extended narrative)
   - Difficulty supplements: quick validation (just particle/grammar checks)

3. Run validation on [file_path]

4. If issues found:
   - Apply fixes automatically based on content type
   - Preserve the specific style (casual for colloquia, formal for sermones)
   - Maintain vocabulary limits for the content type

5. Re-validate the fixed version (quick check)

6. If still issues, iterate once more (max 2 iterations)

7. Output final status

Content-specific fix strategies:

For CHAPTERS:
- Strict grammar progression adherence
- Full story consistency checks
- Character knowledge tracking
- Timeline validation

For COLLOQUIA:
- Preserve casual, conversational tone
- Allow more sentence-final particles
- Family/friend speech patterns
- Phone/text conversation naturalness

For SERMONES:
- Maintain formal register (합니다체)
- Academic vocabulary preferred
- Longer, complex sentences OK
- No casual contractions

For NARRATIONES:
- Extended story consistency
- Character development tracking
- Multiple scene transitions
- Vocabulary from chapter range only

Pipeline:
```
[any file].md
    ↓ detect type & validate accordingly
validation-report.md
    ↓ apply content-specific fixes
[any file]-fixed.md
    ↓ validate (quick check)
final-report.md
    ↓ if clean, rename to original
```

Stop conditions:
- No critical issues remain
- Max 2 fix iterations reached
- Manual intervention needed for complex issues

Output summary:
```
Auto-Fix Report: [filename]
Type: Chapter/Colloquium/Sermo/Narratio
- Initial issues: X critical, Y high, Z medium
- After fix 1: X critical, Y high, Z medium
- Status: READY ✓ (or NEEDS REVIEW if issues remain)
- Changes made: [list key changes]
- Special notes: [any content-type specific observations]
```

File naming:
- Save fixed version with same name pattern
- chapters/chapter-N.md → chapters/chapter-N-fixed.md
- colloquia/colloquium-N.md → colloquia/colloquium-N-fixed.md
- If clean after fixes, rename to original filename

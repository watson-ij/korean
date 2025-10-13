---
description: Validate all md files in directory with optional auto-fix
signature: batch-validate <directory> [fix_common]
---

Validate all .md files in [directory].

1. Run quick validation on all files
2. Generate summary report
3. If [fix_common] is set to "yes" or "true":
   - Auto-fix safe corrections:
     * 그러면 → 그럼 in casual dialogue
     * Remove double particles
     * Fix obvious particle errors
   - Create backup before changes
   - Log all auto-corrections

Report includes:
- Total files validated
- Files by confidence level (high/medium/low)
- Common error patterns across all files
- Priority files needing review
- Summary of auto-fixes applied (if any)

Output as: validation-reports/batch-report-[date].md

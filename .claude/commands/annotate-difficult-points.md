---
description: Create targeted annotation focusing on specific difficulties
signature: annotate-difficult-points <chapter_number> <grammar_points>
---

Create targeted annotation focusing on specific difficulties in chapter-[chapter_number].md.

User specifies problem areas in [grammar_points] like:
- "past_tense"
- "particles"
- "honorifics"
- "contractions"

Generate annotation ONLY for those aspects:

Example for "particles":
- Highlight every particle in bold
- Color code by type (은/는 = blue, 이/가 = red, etc.)
- Add decision tree: "Why this particle?"
- Common error: "You might think 을 but it's 이 because..."

Example for "past_tense":
- Highlight all past tense verbs
- Show conjugation breakdown
- Compare with present tense form
- Show common errors

Example for "honorifics":
- Identify all honorific forms
- Explain relationship dynamics
- Show non-honorific alternative
- Note when honorifics are required vs optional

Output as: annotated/chapter-[chapter_number]-[grammar_points]-guide.md

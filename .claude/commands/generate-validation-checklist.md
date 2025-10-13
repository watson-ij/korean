---
description: Create a manual checklist for human spot-checking
signature: generate-validation-checklist <chapter_number>
---

Create a manual checklist for human spot-checking of chapter-[chapter_number].md.

Based on the chapter content and korean-validation.md:
1. Generate 5 most important phrases to verify
2. Create Google search queries to check
3. List specific Korean drama episodes that might have similar contexts
4. Suggest 3 sentences for HelloTalk/HiNative verification
5. Provide back-translation test sentences

Output format:
---
Manual Validation Checklist - Chapter [chapter_number]

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

Output as: validation-reports/checklist-[chapter_number].md

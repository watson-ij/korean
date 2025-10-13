---
description: Create a casual dialogue supplement focusing on one character
signature: generate-colloquium <chapter_number> [character]
---

Create a casual dialogue supplement for chapter [chapter_number].

If [character] is not specified, automatically choose a character based on:
- Which character is featured prominently in chapter-[chapter_number].md
- Character rotation (ensure all main characters get colloquium coverage)
- Story context (who would have an interesting outside perspective)

Review chapter-[chapter_number].md and vocabulary-tracker.md.

Content Guidelines:
1. Length: 300-400 words
2. Format: Primarily dialogue (80%+)
3. Setting: Different from main chapter (home, phone call, texting, etc.)
4. Language: Casual/intimate (반말 with family/close friends)
5. Vocabulary: ONLY words introduced up to this chapter
6. Grammar: Reinforce the chapter's grammar point naturally
7. New perspectives: Show character's life outside university

Example contexts:
- Phone call with parents
- Texting with friends
- Talking to roommate
- Video call home
- Meeting neighborhood 아줌마
- Ordering delivery food

Include:
- Natural conversational fillers (아, 음, 그래, 뭐)
- Realistic interruptions and topic changes
- Everyday concerns (food, weather, tired, busy)

Exercises:
- 6 simple comprehension questions only

Output as: colloquia/colloquium-[chapter_number].md

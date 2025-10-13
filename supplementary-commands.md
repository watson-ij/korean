# Supplementary Material Commands for Claude Code

## Project Structure Addition
```
korean-natural-method/
├── CLAUDE.md
├── chapters/
│   ├── chapter-01.md
│   └── ...
├── colloquia/              # Casual dialogue supplements
│   ├── colloquium-01.md
│   └── ...
├── sermones/               # Formal style supplements
│   ├── sermo-01.md
│   └── ...
├── narrationes/            # Extended narratives
│   ├── narratio-01.md
│   └── ...
└── vocabulary-tracker.md
```

## 7. generate_colloquium

**Command**: `generate_colloquium [chapter_number] [character]`

**Instructions for Claude Code**:
```
Create a casual dialogue supplement focusing on one character.
Review chapter-[number].md and vocabulary-tracker.md.

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

Output as: colloquia/colloquium-[number].md
```

## 8. generate_sermo

**Command**: `generate_sermo [chapter_number]`

**Instructions for Claude Code**:
```
Create a formal narrative supplement (available after Chapter 10).
Review chapters 1-[number] and vocabulary-tracker.md.

Content Guidelines:
1. Length: 400-500 words  
2. Format: Formal narrative/descriptive prose
3. Style: News article, blog post, or announcement style
4. Language: Formal (합니다체) or written style
5. Vocabulary: Can use ALL vocabulary up to this chapter
6. Dense information: More complex sentences than colloquia

Example formats:
- University newspaper article about students
- Blog post about Seoul life
- Official announcement about campus events  
- Character's formal presentation or report
- Email to professor
- Internship application letter
- News report about university trends

Include:
- Formal conjunctions (그러나, 따라서, 또한)
- Longer sentences with multiple clauses
- Descriptive language
- Formal vocabulary variants (식사 instead of 밥)

Exercises:
- 8 comprehension questions
- 2-3 vocabulary in context questions

Output as: sermones/sermo-[number].md
```

## 9. generate_narratio  

**Command**: `generate_narratio [chapter_range]`

**Instructions for Claude Code**:
```
Create an extended side story for chapter range (e.g., chapters 5-7).

Content Guidelines:
1. Length: 1000-1200 words
2. Self-contained story arc featuring side characters
3. Uses vocabulary/grammar from the chapter range
4. Different perspective on main story events

Example narratives:
- 하나's first week in Seoul (chapters 5-7)
- 준호's job interview experience (chapters 8-10)  
- Weekend trip story (chapters 12-14)
- Parents visiting Seoul (chapters 15-17)

Structure:
- Part 1: Setup (300-400 words)
- Part 2: Development (400 words)
- Part 3: Resolution (300-400 words)

Exercises:
- 10 comprehension questions
- 5 sequence ordering exercises
- Short summary writing prompt

Output as: narrationes/narratio-[range].md
```

## 10. generate_difficulty_supplement

**Command**: `generate_difficulty_supplement [chapter_number] [grammar_point]`

**Instructions for Claude Code**:
```
When a learner struggles with specific grammar, generate targeted practice.

Analyze the problematic grammar point and create:

1. Mini-dialogue (200 words)
   - Uses the grammar point 10+ times
   - Very simple vocabulary
   - Repetitive but natural patterns

2. Pattern practice story (300 words)
   - Systematic variations of the grammar
   - Contrasts with similar patterns
   - Clear context for each usage

3. Exercises:
   - 10 transformation exercises
   - 5 error correction items
   - 5 sentence completion

Example for past tense (았/었어요):
- Dialogue about what happened yesterday
- Every sentence uses past tense
- Gradual complexity increase

Output as: supplements/drill-[chapter]-[grammar].md
```

## 11. generate_culture_note

**Command**: `generate_culture_note [chapter_number] [topic]`

**Instructions for Claude Code**:
```
Create cultural context readings related to chapter situations.

Content Guidelines:
1. Length: 300-400 words
2. Real Korean cultural information
3. Written at current vocabulary level
4. Relates to chapter situations

Topics examples:
- 한국 대학생활 (Korean university life)
- 커피 문화 (Coffee culture)  
- 지하철 에티켓 (Subway etiquette)
- 선배/후배 관계 (Senior/junior relationships)
- 한국 음식 문화 (Korean food culture)

Format:
- Explanatory but in simple Korean
- Use only known vocabulary + 3-4 cultural terms
- Include comparisons when helpful
- Real examples from daily life

Output as: culture/culture-[number]-[topic].md
```

## 12. check_supplement_coverage

**Command**: `check_supplement_coverage [up_to_chapter]`

**Instructions for Claude Code**:
```
Analyze which chapters have supplementary materials.

Report:
1. Coverage matrix:
   - Which chapters have colloquia
   - Which have sermones
   - Which have narrationes
   - Which have difficulty supplements

2. Character balance:
   - How often each character is featured
   - Recommend which character needs more coverage

3. Grammar reinforcement:
   - Which grammar points have supplements
   - Which need additional practice

4. Recommendations:
   - Priority supplements to create
   - Gaps in coverage

Output as: reports/supplement-coverage-[date].md
```

## Usage Patterns

### When student struggles with a chapter:
```bash
# Generate easier supplementary material
claude "generate_colloquium 7 민수"
claude "generate_difficulty_supplement 7 past_tense"
```

### For additional practice:
```bash
# After mastering chapter 10
claude "generate_sermo 10"
claude "generate_narratio 8-10"
```

### For immersion variety:
```bash
# Different text types for same vocabulary
claude "generate_colloquium 5 지은"
claude "generate_culture_note 5 university_life"
```

## Pedagogical Notes

**Colloquia** (Chapters 1-25)
- Immediate reinforcement
- Lower cognitive load
- Focus on spoken patterns
- Build familiarity with characters

**Sermones** (Chapters 10-25)
- Introduce formal register
- Prepare for real Korean texts
- Denser information processing
- Academic vocabulary variants

**Narrationes** (Every 3-5 chapters)
- Extensive reading practice
- Narrative comprehension
- Character development
- Sustained attention practice

**Difficulty Supplements** (As needed)
- Targeted intervention
- Systematic drilling
- Confidence building
- Pattern recognition

## Important Principles

1. **Never introduce new grammar** in supplements (only reinforce)
2. **Colloquia** can use slightly more casual/contracted forms
3. **Sermones** should prepare students for real Korean texts
4. **All supplements** must be comprehensible with current vocabulary
5. **Cultural notes** can introduce cultural terms with context
6. **Story continuity** - supplements can reference main chapter events

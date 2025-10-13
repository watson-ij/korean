# Custom Commands for Claude Code

## 1. plan_next_chapter

**Command**: `plan_next_chapter [chapter_number]`

**Instructions for Claude Code**:
```
Review the following files:
- CLAUDE.md for the grammar progression plan and story arc
- vocabulary-tracker.md for all previously introduced vocabulary
- The previous chapter (if it exists)

Then create a plan that includes:

1. Grammar Focus:
   - Main grammar point to introduce (from progression plan)
   - How it will be introduced naturally in context

2. Story Outline:
   - 3-4 main story beats
   - Which characters appear
   - Setting/location
   - How the story advances the overall arc

3. Vocabulary Plan:
   - 7-10 new words to introduce
   - How each will be made clear from context
   - Which previous vocabulary to reinforce

4. Dialogue Situations:
   - 2-3 conversational contexts that naturally use the new grammar
   - Real-life situations students can relate to

Output as: plan-chapter-[number].md
```

## 2. write_chapter

**Command**: `write_chapter [chapter_number]`

**Instructions for Claude Code**:
```
Using plan-chapter-[number].md and following the structure in CLAUDE.md:

1. Write the 이야기 section:
   - 500-800 words
   - Bold new vocabulary on first use
   - Natural progression from simple to complex sentences
   - Include dialogue that sounds conversational
   - Ensure new grammar appears at least 5 times in different contexts

2. Create 연습 문제:
   - 8 맞아요/틀려요 questions (mix of obvious and careful reading)
   - 8 comprehension questions in Korean (answers should be in the text)
   - 8-10 fill-in-the-blank (focus on particles and new grammar)
   - 5 matching or multiple choice items

3. Add 새 단어 정리:
   - List all new vocabulary with minimal English hints
   - Group by part of speech

Remember:
- Use ONLY vocabulary from vocabulary-tracker.md plus the new planned words
- Keep sentences short initially, gradually increase complexity
- Every new word should be deducible from context

Output as: chapters/chapter-[number].md
```

## 3. review_chapter

**Command**: `review_chapter [chapter_number]`

**Instructions for Claude Code**:
```
Review chapters/chapter-[number].md for:

1. Korean Language Check:
   - Natural-sounding dialogue (Would a Korean university student say this?)
   - Correct particle usage
   - Appropriate speech levels (반말 between friends)
   - Natural contractions (하는 → 하는, 그러면 → 그럼)

2. Pedagogical Check:
   - Are new words clearly deducible from context?
   - Is the grammar point appearing naturally?
   - Sufficient repetition of new elements?
   - Appropriate difficulty progression?

3. Story Flow:
   - Does it connect to the previous chapter?
   - Character consistency maintained?
   - Engaging and relatable situations?

4. Exercise Quality:
   - Clear and unambiguous questions?
   - Appropriate difficulty level?
   - Testing comprehension, not tricks?

Output a report with:
- Issues found (if any)
- Suggested corrections
- Confirmation if ready to use

If corrections needed, output: chapter-[number]-revised.md
```

## 4. update_vocab_tracker

**Command**: `update_vocab_tracker [chapter_number]`

**Instructions for Claude Code**:
```
After chapter is finalized:

1. Extract all new vocabulary from chapter-[number].md
2. Add to vocabulary-tracker.md maintaining the format:
   - Categorize by part of speech
   - Include the forms used in the chapter
   - Add minimal English hints
3. Update cumulative counts
4. Add notes for next chapter planning

Output: Updated vocabulary-tracker.md
```

## 5. generate_review_sheet

**Command**: `generate_review_sheet [chapters_range]`

**Instructions for Claude Code**:
```
Create a cumulative review sheet for specified chapters:

1. Vocabulary review:
   - Group words by theme/topic
   - Create fill-in sentences using words in new contexts

2. Grammar pattern summary:
   - List all patterns introduced
   - One clear example for each

3. Mixed exercises:
   - Sentences combining multiple grammar points
   - Short paragraph reading with comprehension questions
   - Translation exercises (Korean to Korean paraphrase)

Output as: review-chapters-[range].md
```

## 6. check_natural_progression

**Command**: `check_natural_progression [up_to_chapter]`

**Instructions for Claude Code**:
```
Analyze progression through specified chapters:

1. Vocabulary growth rate (should be 7-10 per chapter)
2. Grammar complexity curve (gradual increase)
3. Story continuity and character development
4. Identify any sudden difficulty spikes

Output a report with:
- Growth metrics
- Progression graph (text representation)
- Recommendations for smoothing if needed
```

## Usage Example Workflow

```bash
# Planning phase
claude "plan_next_chapter 2"

# Review the plan
cat plan-chapter-2.md

# Write the chapter
claude "write_chapter 2"

# Review and revise
claude "review_chapter 2"

# Update tracking
claude "update_vocab_tracker 2"

# After every 5 chapters
claude "generate_review_sheet 1-5"
claude "check_natural_progression 5"
```

## Important Notes

- Always maintain Korean-only immersion in chapter content
- Exercises can have minimal English for clarity if needed
- Each chapter should be self-contained but build on previous knowledge
- If unsure about Korean naturalness, flag for review
- Prioritize comprehensible input over perfect grammar coverage

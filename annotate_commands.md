# Annotation Commands for Claude Code

## annotate_chapter

**Command**: `annotate_chapter <chapter_number> [level]`

**Signature for .claude/commands/:**
```
---
description: Create an annotated version of a chapter with grammar and vocabulary explanations
signature: annotate_chapter <chapter_number> [level]
---
```

**Instructions for Claude Code:**
```
Create an annotated study version of chapter-[chapter_number].md.
Level: [level] (basic/detailed/grammar-focus) - default to "basic" if not specified

Read the original chapter and create an annotated version with inline explanations.

BASIC ANNOTATION LEVEL:
Add the following annotations using HTML comment style or color coding:

1. New Vocabulary:
   - After each new word, add: [새 단어: English meaning]
   - Example: "민수는 **아파트**[🏠 apartment]에 살아요"

2. Grammar Points:
   - After grammar patterns, add brief explanation
   - Example: "지하철을 타요[을/를 + 타다 = ride (object)]"

3. Contractions/Casual Speech:
   - Show full form: "지은아[지은 + 아 (calling)]"
   - Note: "갈까?[ㄹ까 = shall we?]"

4. Particles:
   - Mark particle usage: "서울에[에 = location] 살아요"

5. Cultural Notes:
   - Add where relevant: "학생식당[💡 Korean unis have subsidized cafeterias]"

DETAILED ANNOTATION LEVEL:
Include everything from BASIC plus:

6. Sentence Structure Breakdown:
   ```
   민수가 물어봐요: "지은아, 오늘 뭐 해?"
   [민수가 = subject] [물어봐요 = asks (물어보다 + 아요)]
   [지은아 = addressing 지은] [오늘 = today/time marker] 
   [뭐 = what (casual for 무엇)] [해 = do (하다 in 반말)]
   ```

7. Speech Level Analysis:
   - Note relationship dynamics
   - Why 반말 vs 존댓말 is used

8. Alternative Expressions:
   - "물어봐요" → could also say: "질문해요", "여쭤봐요" (honorific)

9. Common Mistakes:
   - ⚠️ Don't say "뭐를 해?" (too formal for friends)
   - ⚠️ "학교에서 만나자" not "학교에 만나자" (action location)

GRAMMAR-FOCUS LEVEL:
Heavy focus on grammar patterns:

10. Pattern Templates:
    - "V + 을/를까요?" = Shall we V?
    - "N + 에서" = at/in N (action location)
    - "A + 지 않아요" = not A (negative form)

11. Conjugation Breakdown:
    - 끝나다 → 끝나 (stem) + 아요 → 끝나요
    - 만나다 → 만나 (stem) + 자 → 만나자 (let's meet)

12. Grammar Cross-References:
    - "This ㄹ까요 pattern appears again in Ch.3, Ch.7"
    - "Compare with ㄹ게요 (will/intention) learned in Ch.5"

FORMAT OUTPUT AS:

# Chapter [number] - ANNOTATED STUDY VERSION

## 📚 Study Guide
- **New Grammar**: [list main patterns]
- **New Vocabulary**: [count] new words
- **Key Contractions**: [list casual forms]

## 이야기 (Annotated)

[Original text with inline annotations]

## 🔍 Grammar Deep Dive

### Pattern 1: [Grammar point]
- Formation: [how to form it]
- Usage: [when to use]
- Examples from text: [quotes]
- Practice: [2-3 practice sentences]

## 📝 Vocabulary Notes

### New Words
[Detailed vocabulary with example sentences from the text]

### Word Families
- 공부 → 공부하다, 공부방, 공부벌레
- 먹다 → 먹이다, 먹거리, 먹방

## 💡 Study Tips
- [Specific advice for difficult points]
- [Memory tricks for vocabulary]
- [Common mistakes to avoid]

## 🗣️ Speaking Practice
[Pronunciation notes for difficult sounds]
[Intonation patterns for questions]

Output: annotated/chapter-[number]-annotated.md
```

## annotate_dialogue

**Command**: `annotate_dialogue <chapter_number>`

**Instructions for Claude Code:**
```
Extract only dialogue sections and create detailed conversation analysis.

For each dialogue exchange:

1. Original Line:
   민수: "지은아, 오늘 뭐 해?"

2. Breakdown:
   - Literal: "Ji-eun-ah, today what do?"
   - Natural English: "Hey Ji-eun, what are you doing today?"
   - Speech Level: 반말 (casual - they're friends)
   - Grammar: 뭐 (what) + 해 (하다 in casual present)
   - Particle: 아 (vocative particle for names ending in consonant)
   - Natural response patterns: Could answer with schedule/activity

3. Alternative Ways to Say It:
   - More formal: "지은 씨, 오늘 뭐 하세요?"
   - More casual: "야, 오늘 뭐 해?"
   - Different nuance: "오늘 뭐 할 거야?" (future tense)

Output: annotated/chapter-[number]-dialogue-study.md
```

## generate_workbook

**Command**: `generate_workbook <chapter_number>`

**Instructions for Claude Code:**
```
Create an interactive workbook version with extensive practice.

Include:

1. Pre-Reading Preparation:
   - Preview new vocabulary with images/associations
   - Grammar pattern preview with simple examples

2. Guided Reading:
   - Text broken into chunks
   - Comprehension check after each section
   - "Notice the pattern" boxes

3. Post-Reading Activities:
   - Fill in the blanks (removed particles)
   - Reorder scrambled sentences
   - Change speech levels (반말 ↔ 존댓말)
   - Write similar dialogues with different characters

4. Grammar Drills:
   - Pattern practice with new vocabulary
   - Error correction exercises
   - Transformation exercises

5. Creative Extension:
   - "Write 민수's diary entry for this day"
   - "Text conversation between 민수 and 지은"
   - "What happens next?" continuation

Output: workbooks/chapter-[number]-workbook.md
```

## annotate_difficult_points

**Command**: `annotate_difficult_points <chapter_number> <grammar_points>`

**Instructions for Claude Code:**
```
Create targeted annotation focusing on specific difficulties.

User specifies problem areas like:
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

Output: annotated/chapter-[number]-[focus]-guide.md
```

## Usage Examples

```bash
# Basic annotation for self-study
/annotate_chapter 5 basic

# Detailed annotation when struggling
/annotate_chapter 5 detailed

# Focus on grammar patterns
/annotate_chapter 5 grammar-focus

# Just analyze dialogues
/annotate_dialogue 5

# Create practice workbook
/generate_workbook 5

# Target specific problems
/annotate_difficult_points 5 particles
/annotate_difficult_points 5 "past_tense,honorifics"
```

## Sample Annotated Output

Here's what a small section would look like annotated:

---

**Original:**
민수가 물어봐요: "지은아, 오늘 뭐 해?"

**Basic Annotation:**
민수가[가=subject] 물어봐요[물어보다=to ask]: "지은아[calling 지은], 오늘[today] 뭐[what(casual)] 해[do(반말)]?"

**Detailed Annotation:**
```
민수가 물어봐요: "지은아, 오늘 뭐 해?"
├─ 민수가: 민수 (name) + 가 (subject particle - used for new information)
├─ 물어봐요: 물어보다 (to ask) + 아요 (polite present) 
│   └─ Note: 보다 adds "try/attempt" nuance (ask and see)
├─ 지은아: 지은 (name) + 아 (vocative particle after consonant)
│   └─ Shows friendly relationship (would be "지은 씨" if formal)
├─ 오늘: today (time marker, no particle needed)
├─ 뭐: what (casual form of 무엇)
│   └─ In casual speech, usually no 을/를 particle with 뭐
└─ 해: 하다 (to do) in 반말 present form
    └─ Full form: 하 + 여 → 해 (casual present)

💡 Natural English: "Hey Ji-eun, what are you up to today?"
⚠️ Common mistake: Don't add 를 after 뭐 in casual speech
🗣️ Intonation: Rising tone on 해? to mark question
```

---

## Benefits

1. **Self-Diagnosis**: See exactly what you're missing
2. **Pattern Recognition**: Grammar patterns become visible
3. **Mistake Prevention**: Warnings about common errors
4. **Speech Level Awareness**: Understand social dynamics
5. **Active Learning**: Workbook version for practice
6. **Customized Focus**: Target your specific weak points

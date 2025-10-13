---
description: Create an annotated version of a chapter with grammar and vocabulary explanations
signature: annotate_chapter <chapter_number> [level]
---

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

# Chapter [chapter_number] - ANNOTATED STUDY VERSION

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

Output: annotated/chapter-[chapter_number]-annotated.md

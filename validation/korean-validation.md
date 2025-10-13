# Korean Language Validation Methods

## 1. Corpus Validation Tools

### Google Search Validation
```bash
# Create a validation command for Claude Code
claude "validate_phrases chapter-01.md"
```

Check natural phrases by:
- Searching exact phrases in quotes: "도서관에서 만나자"
- Check hit counts (1000+ hits = likely natural)
- Look for .kr domains in results
- Compare variants: "커피 마실까?" vs "커피를 마실까?"

### Naver/Daum Search
- Korean search engines better for colloquial Korean
- Check 블로그 (blog) results for casual speech
- News results for formal speech patterns

## 2. Pattern Frequency Analysis

### Common Collocation Checker
Create a command to verify word combinations:

```python
# Pseudo-code for validation
common_patterns = {
    "수업이 + 있다": ✓ Natural,
    "수업을 + 있다": ✗ Unnatural,
    "밥을 + 먹다": ✓ Natural,
    "밥이 + 먹다": ✗ Unnatural (except special contexts)
}
```

### Particle Verification Rules
```
Subject particles (이/가):
- With 있다/없다: ✓
- With action verbs: ✓ (for new information)
- With descriptive verbs: ✓

Topic particles (은/는):
- For contrast: ✓
- For established topics: ✓
- In questions: Check case-by-case

Object particles (을/를):
- With transitive verbs: ✓
- With 있다/없다: ✗
- With adjectives: ✗
```

## 3. Automated Cross-Reference Tools

### Papago Back-Translation Test
```
Korean → English → Korean

If the back-translation differs significantly, the original might be unnatural:
Original: "민수는 대학생이에요"
→ English: "Minsu is a university student"
→ Korean: "민수는 대학생이에요" ✓ (same = natural)

Original: "민수는 대학생을 이에요" 
→ English: [error or awkward]
→ Korean: [different] ✗ (indicates problem)
```

### Multiple Translation Engine Comparison
- If Papago, Google, and DeepL all translate differently = potential issue
- If all produce similar English = likely natural Korean

## 4. Korean Language Corpora

### Sejong Corpus Patterns
Check against common patterns from the Sejong Corpus:
- Verb endings frequency
- Particle combinations
- Common expressions

### NIKL (National Institute of Korean Language) Resources
- Check their learner corpus for common mistakes to avoid
- Use their frequency lists for natural vocabulary choices

## 5. Structural Validation Rules

### Dialogue Naturalness Checklist
```markdown
✓ Contractions in casual speech:
  - 그러면 → 그럼
  - 지은이는 → 지은인
  - 하는 것 → 하는 거

✓ Appropriate endings for relationships:
  - Friends: -아/어 (반말)
  - To seniors: -아/어요
  - Formal writing: -ㅂ니다

✓ Natural question patterns:
  - "뭐 해?" more natural than "무엇을 해?"
  - "어디 가?" more natural than "어디에 가?"

✗ Avoid textbook-only patterns:
  - Over-using 당신
  - Every sentence with explicit subjects
  - No topic/subject omission
```

### Grammar Co-occurrence Matrix
```
Past + Probable future: ✗ (았을 거예요 needs special context)
Present progressive + Frequency: ✓ (자주 하고 있어요)
Want to + Past: ✗ (고 싶었다 is correct, not 고 싶았다)
```

## 6. Claude Code Validation Commands

### validate_chapter
```bash
claude "validate_chapter 5"
```
Should check:
1. All particles match their verbs correctly
2. Speech levels are consistent within conversations
3. Common collocations are used
4. No mixing of formal/informal in same utterance

### check_naturalness
```bash
claude "check_naturalness chapter-05.md --focus dialogue"
```
Should verify:
1. Appropriate contractions for casual speech
2. Natural word order (SOV but flexible for emphasis)
3. Appropriate omissions (subjects often dropped)
4. Natural response patterns

## 7. Reddit/Forum Validation

### r/Korean Community Patterns
Search for similar phrases in:
- r/Korean daily discussion threads
- Talk To Me In Korean forum posts
- HiNative Korean questions

Red flags if your phrase:
- Never appears in native speaker posts
- Only appears in learner questions as "Is this correct?"
- Gets corrected when learners use it

## 8. YouTube Subtitle Mining

### Korean Drama/YouTube Validation
Search for phrases in:
- Korean drama subtitles (Viki, Netflix)
- Korean YouTube auto-captions
- V LIVE transcripts

Natural if:
- Appears in multiple different contexts
- Used by different age groups
- Appears in unscripted content

## 9. Prevention Strategies

### Common Unnatural Patterns to Avoid

**Word Order Issues:**
```
✗ 어제 갔어요 학교에 (scrambled)
✓ 어제 학교에 갔어요
```

**Particle Stacking:**
```
✗ 학교에서에 (double location)
✓ 학교에서
```

**Over-translation from English:**
```
✗ 나는 좋아해요 그것을 (I like it - word by word)
✓ 좋아해요 / 그게 좋아요
```

**Formal/Informal Mixing:**
```
✗ 먹어 + 주세요 (mixing speech levels)
✓ 먹어 줘 / 먹어 주세요
```

## 10. Batch Validation Script

Create a validation aggregator command:

```bash
claude "batch_validate chapters/chapter-*.md"
```

This should:
1. Extract all unique sentence patterns
2. Group similar structures
3. Flag statistical outliers
4. Check against common error patterns
5. Generate a report with confidence scores

## 11. Native Speaker Spot Checks

### Strategic Sampling
Instead of checking everything:
- Check 3 random dialogues per chapter
- Focus on new grammar introduction passages
- Validate any phrases you're unsure about

### HelloTalk/Hinative Strategy
- Post 2-3 sentences as "Is this natural?"
- Don't post full chapters
- Focus on dialogue sections
- Ask "How would you say this naturally?"

## 12. Version Control for Corrections

```bash
# Track all corrections
git commit -m "Natural Korean fixes: chapter 5
- Changed 뭐를 해? to 뭐 해?
- Fixed particle usage in dialogue
- Made contractions more natural"
```

## Quality Score Rubric

Rate each chapter:
- **Particles** (0-10): Correct usage and natural omissions
- **Dialogue** (0-10): Sounds like real Korean students
- **Contractions** (0-10): Appropriate level of casualness
- **Word Order** (0-10): Natural Korean, not translated English
- **Collocations** (0-10): Common word partnerships

Target: 40+ / 50 minimum for release

## Red Flag Patterns

Immediate revision needed if:
1. Back-translation produces very different Korean
2. Zero Google results for exact phrases
3. Only appears in Korean textbooks, not native content
4. Multiple particles stacked incorrectly
5. Every sentence has explicit subject (very unnatural)
6. No contractions in casual dialogue
7. Word-for-word English translations

## Confidence Indicators

High confidence in naturalness if:
1. 10,000+ Google results for exact phrase
2. Appears in multiple Korean dramas
3. Used in Naver blog posts by Koreans
4. Pattern matches Sejong Corpus frequencies
5. Korean YouTubers use it naturally
6. Back-translation preserves meaning and structure

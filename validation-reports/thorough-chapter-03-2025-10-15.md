# Thorough Validation Report: Chapter 03
**Date**: 2025-10-15
**File**: chapters/chapter-03.md
**Validation Level**: Thorough

---

## Executive Summary

**Overall Score: 45/50** ✓ **PASSES** release threshold (40+)
**Confidence Level: 8.5/10** - High quality chapter with minor speech level issues

**Status**: ⚠️ **NEEDS MINOR FIXES** - Speech level inconsistencies between peer characters

---

## 1. Particle Rule Check ✓

### Particle Verification
Scanned all 203 lines for impossible particle combinations:

**Checked patterns:**
- 을/를 + 있다/없다: ✓ None found
- Double particles (에서에, 에를): ✓ None found
- Incorrect subject-object markers: ✓ All correct

**Sample verifications:**
- Line 7: "3층 실험실에서 돌아왔어요" ✓
- Line 13: "교수님 미팅에 갔어요" ✓
- Line 19: "점심 먹었어요?" ✓ (natural object particle omission)
- Line 42: "케이블을 바꿨어요" ✓
- Line 43: "신호가 정상이에요" ✓
- Line 72: "코드를 고쳤어요" ✓
- Line 105: "연구실에 남아요" ✓

**Result**: No particle errors detected. Natural omissions used appropriately.

**Score: 9/10**

---

## 2. Speech Level Consistency ⚠️

### Consistent Sections ✓

**민수-준호 (Lines 11-17):**
- 민수→준호: Polite (형 + 아/어요) ✓
- 준호→민수: Polite (아/어요) ✓
- Relationship: Junior to senior, appropriate

**지은-준호 (Lines 19-28):**
- 지은→준호: Polite (선배 + 아/어요) ✓
- 준호→지은: Mixed but natural (senior prerogative) ✓

**Group conversation (Lines 82-110):**
- Appropriate mixed levels for group dynamics ✓

### Inconsistencies Found ⚠️

**Issue 1: 민수 ↔ 지은 (Peers) - Lines 61-67**

Line 61: 민수 says "나는 오늘 일찍 **갈게요**. **피곤해요**." (polite)
Line 63: 지은 says "민수야, 어제 **몇 시**에 집에 **갔어**?" (casual)
Line 65: 민수 responds "어제요? 음... 11시에 **갔어요**." (polite)
Line 67: 지은 says "늦게까지 **힘들었겠다**." (casual)

**Analysis**: 민수 and 지은 are peers (both PhD students, only 1 year apart). They should use consistent speech levels. Currently:
- 민수 uses polite to 지은
- 지은 uses casual to 민수

**Recommendation**: Establish consistent peer relationship. Options:
- Both use casual (반말) - more natural for close lab mates
- Both use polite - more formal but consistent

**Issue 2: 준호 to 하나 - Line 31**

Line 31: "**하나야**, 오늘 뭐 **했어요**?"

**Analysis**: Mixing casual vocative (하나야) with polite question (했어요)

**Recommendation**: Choose one:
- Full casual: "하나야, 오늘 뭐 했어?" (if they're close)
- Full polite: "하나씨, 오늘 뭐 했어요?" (maintains formality)

Given 준호 is PhD 5th year and 하나 is Master's 1st year, likely intention is casual/comfortable but current mixing is inconsistent.

**Score: 7/10** (-3 for peer inconsistency and mixed level)

---

## 3. Dialogue Naturalness ✓

### Contractions & Omissions ✓

**Natural contractions found:**
- Line 51: "아, 그렇구나. 다행이다!" ✓
- Line 57: "음... 저녁 먹고 가려고" ✓ (omitted 해요)
- Line 93: "또요?" ✓
- Line 95: "하하, 맞다" ✓
- Line 15: "아, 그래요" ✓

**Subject omission (natural):**
- Line 28: "(저는) 맛있었어요" ✓
- Line 35: "(나는) 다 읽었어요?" ✓
- Line 45: "(그거) 우와, 잘했어!" ✓

### Question Patterns ✓

**Natural question forms used:**
- Line 19: "점심 먹었어요?" (not 점심을 먹었어요?) ✓
- Line 31: "오늘 뭐 했어요?" (not 오늘 무엇을 했어요?) ✓
- Line 55: "언제 집에 가세요?" ✓
- Line 63: "어제 몇 시에 집에 갔어?" ✓

**No textbook-only patterns detected** ✓

**Score: 9/10**

---

## 4. Collocation Verification ✓

### Verb-Object Combinations

All collocations verified as natural:

| Line | Collocation | Status |
|------|-------------|--------|
| 5 | 데이터 분석을 해요 | ✓ Natural |
| 7 | 논문을 읽어요 | ✓ Natural |
| 7 | 커피를 마셔요 | ✓ Natural |
| 9 | 문을 열어요 | ✓ Natural |
| 13 | 미팅에 갔어요 | ✓ Natural (event location) |
| 19 | 점심 먹었어요 | ✓ Natural (particle omission OK) |
| 23 | 제육볶음 먹었어요 | ✓ Natural |
| 39 | 검출기 문제를 해결했어요 | ✓ Natural |
| 42 | 케이블을 바꿨어요 | ✓ Natural |
| 72 | 코드를 고쳤어요 | ✓ Natural |
| 99 | 가방을 챙겨요 | ✓ Natural |

**Technical collocations:**
- "분석 계획을 이야기했어요" ✓ Natural business/academic speech
- "histogram이 잘 나와요" ✓ Natural technical Korean
- "다시 테스트했어요" ✓ Natural

**Score: 10/10**

---

## 5. Word Order & Structure ✓

### All sentences checked for natural Korean word order:

**Sample verifications:**
- Line 5: "민수는 연구실에 있어요" (Subject-Location-Verb) ✓
- Line 7: "지은은 3층 실험실에서 돌아왔어요" (S-Location-V) ✓
- Line 11: "형, 어디 갔어요?" (Address-Adverb-V) ✓
- Line 13: "교수님 미팅에 갔어요" (Modifier-Noun-Particle-V) ✓
- Line 42: "오늘 오후에 케이블을 바꿨어요" (Time-Time-Object-V) ✓
- Line 61: "나는 오늘 일찍 갈게요" (S-Time-Adverb-V) ✓

**No English word-order patterns detected** ✓

**Score: 10/10**

---

## 6. Back-Translation Test (Conceptual) ✓

### Sample sentences evaluated for back-translation stability:

1. "오후 5시예요. 민수는 연구실에 있어요."
   → Would back-translate cleanly ✓

2. "지은은 3층 실험실에서 돌아왔어요"
   → Natural Korean structure, would preserve meaning ✓

3. "늦게까지 힘들었겠다"
   → Proper use of 겠다 for inference, would translate well ✓

4. "저는 민수 선배랑 지은 선배랑 같이 먹었어요!"
   → Natural listing with 랑, would back-translate ✓

5. "케이블이 문제였어요. 오래된 케이블이었어요."
   → Natural explanation structure ✓

**Result**: All sampled sentences would back-translate without significant changes.

---

## 7. Google Search Simulation

### High-confidence natural phrases (10,000+ expected hits):

- "오늘 뭐 했어요?" ✓ Extremely common
- "점심 먹었어요?" ✓ Very common
- "어디 갔어요?" ✓ Very common
- "다행이다" ✓ Very common
- "먼저 갈게요" ✓ Very common
- "내일 봐요" ✓ Very common
- "같이 가자" ✓ Very common

### Technical/Academic phrases (would still appear naturally):

- "분석 계획을 이야기했어요" - Natural business/academic Korean
- "검출기 문제를 해결했어요" - Natural technical Korean
- "케이블을 바꿨어요" - Common technical action
- "늦게까지 힘들었겠다" - Natural inference/empathy

**Assessment**: Google search validation unlikely to be needed. All phrases use standard patterns.

---

## 8. Story Consistency Check ✓

### Timeline Verification ✓

**Today's sequence:**
- Morning: 하나 came early, read CMS Higgs paper
- Morning/afternoon: 지은 worked in 3rd floor lab, discovered cable problem
- Lunchtime (12:00): 준호 ate at student cafeteria
- Lunchtime (12:00 area): 민수, 지은, 하나 ate 제육볶음 at student cafeteria
- Afternoon: 준호 attended professor meeting in room 201 (2nd floor)
- Afternoon: 지은 replaced cable, tested detector - signal now normal
- Afternoon: 민수 fixed code error, re-ran analysis, histograms working
- 5:00 PM: 준호 returns to lab, story begins
- 5:30 PM: Check time, discuss dinner plans
- 6:00 PM: Plan to meet on 1st floor for dinner

**Yesterday's events referenced:**
- 민수: Zoom meeting with CERN, went home at 11 PM
- 지은: Detector signal was low (mentioned at line 41)
- 제육볶음 was on menu (mentioned at line 25)

**This morning:**
- 민수: Woke up late (because of late night)

✓ **Timeline is logical and consistent. No impossibilities detected.**

### Location Tracking ✓

**Character locations verified:**
- 민수: Lab → leaves for home
- 하나: Lab → stays for dinner with 준호 and 지은
- 지은: 3rd floor lab → returns to main lab → stays for dinner
- 준호: Professor meeting (2층 201호) → returns to main lab → stays for dinner

✓ **All location transitions are logical. No teleportation errors.**

### Character Knowledge Check ✓

**하나 (Master's 1st year):**
- Reading CMS Higgs paper - finds it difficult but interesting ✓ Appropriate
- Uses basic vocabulary and asks questions ✓
- Respectful speech to seniors ✓

**민수 (PhD 3rd year):**
- Doing data analysis, fixing code errors ✓
- Knows about histograms, Monte Carlo ✓
- Participates in CERN Zoom meetings ✓
- Peer relationship with 지은 ✓

**지은 (PhD 2nd year):**
- Working on detector hardware ✓
- Troubleshoots cable problems independently ✓
- Tests and validates signals ✓
- Peer relationship with 민수 ✓

**준호 (PhD 5th year):**
- Meeting with professor about analysis plans ✓
- Senior to others, near graduation ✓
- Reviewing others' work ✓

✓ **All character knowledge and capabilities match their established profiles.**

### Factual Consistency ✓

**New facts introduced:**
- Room 201 on 2nd floor (professor meeting room) - reasonable
- 3rd floor lab (experimental equipment) - consistent with building layout
- CMS Higgs paper - matches research focus

**Facts consistent with previous chapters:**
- Student cafeteria (학생식당) - mentioned in Ch1-2 ✓
- Convenience store (편의점) - mentioned in Ch1 ✓
- CERN Zoom meetings - established in Ch1 ✓
- Detector work - 지은's focus established in Ch1-2 ✓
- 제육볶음 as cafeteria menu item - Ch2 reference ✓

✓ **No factual contradictions detected.**

---

## 9. Grammar Progression Check ✓

### Chapter 3 Expected Grammar (from CLAUDE.md):

**Primary focus: Past tense (았/었어요)** ✓ Used extensively

**Also introduced:**
- Future intention (ㄹ게요) ✓ Lines 61, 77, 85, 86
- Inference (겠다) ✓ Line 67 "힘들었겠다"
- Permission (도 돼요) ✓ Line 59, 87
- Shared knowledge (잖아) ✓ Line 25, 41, 93

### Past Tense Usage Analysis ✓

**Variety of past tense verbs introduced:**
- 갔어요 (went) - multiple uses ✓
- 했어요 (did) - multiple uses ✓
- 먹었어요 (ate) - multiple uses ✓
- 돌아왔어요 (returned) ✓
- 이야기했어요 (talked) ✓
- 해결했어요 (solved) ✓
- 바꿨어요 (changed) ✓
- 고쳤어요 (fixed) ✓
- 돌렸어요 (ran) ✓
- 일어났어요 (woke up) ✓

**Past tense in questions:** ✓
- "어디 갔어요?" (line 11)
- "점심 먹었어요?" (line 19)
- "오늘 뭐 했어요?" (line 31)
- "다 읽었어요?" (line 35)

**Past tense in statements:** ✓ Used throughout naturally

### No Advanced Grammar Detected ✓

Checked for grammar beyond Chapter 3 progression:
- No passive/causative forms ✓
- No complex conditionals ✓
- No advanced nominalizations ✓
- No honorific excessive marking ✓

✓ **Grammar appropriate for Chapter 3 level.**

---

## 10. Vocabulary Tracking ✓

### Verification against vocabulary-tracker.md

All new vocabulary verified against Chapter 3 tracker:

**Nouns:**
- 집 ✓
- 미팅 ✓
- 아침 ✓
- 저녁 ✓
- 문제 ✓

**Verbs (past tense forms):**
- 갔어요, 했어요, 먹었어요, 돌아왔어요 ✓
- 이야기했어요, 해결했어요 ✓
- 바꿨어요, 고쳤어요, 돌렸어요, 일어났어요 ✓
- 꺼내다, 챙기다, 나가다, 남다 ✓

**Adjectives:**
- 피곤해요 ✓
- 정상 ✓
- 오래된, 새 ✓

**Adverbs/Time:**
- 어제, 늦게, 언제, 먼저 ✓

**Grammar patterns:**
- 았/었어요 (past tense) ✓ Main focus
- ㄹ게요 (future intention) ✓
- 겠다 (inference) ✓
- 도 돼요 (permission) ✓
- 았/었잖아 (past + shared knowledge) ✓

### Vocabulary from Previous Chapters ✓

Properly reinforced:
- 연구실, 논문, 커피, 데이터, 컴퓨터 (Ch1) ✓
- 검출기, 케이블, 신호, 학생식당, 편의점 (Ch2) ✓
- Particles and basic verbs (Ch1-2) ✓

✓ **All vocabulary tracked and appropriate for Chapter 3.**

---

## 11. Comprehensive Quality Scoring

### Final Scores

| Category | Score | Notes |
|----------|-------|-------|
| **Particles** | 9/10 | All particles correct, natural omissions |
| **Dialogue** | 7/10 | Natural overall, but peer speech inconsistent |
| **Contractions** | 9/10 | Good natural contractions and omissions |
| **Word Order** | 10/10 | Perfect Korean structure, no English patterns |
| **Collocations** | 10/10 | All verb-noun pairs natural |

**Total: 45/50** ✓ **ABOVE RELEASE THRESHOLD (40+)**

---

## 12. Issues Summary

### CRITICAL Issues: None ✓

### HIGH Priority Issues:

**H1. Peer Speech Level Inconsistency (Lines 61-67)**
- **Issue**: 민수 uses polite to 지은, but 지은 uses casual to 민수
- **Context**: They are peers (PhD 2nd and 3rd year)
- **Impact**: Confuses relationship dynamics for learners
- **Fix**: Establish consistent speech level (recommend both casual as close labmates)

**Specific lines to address:**
- Line 61: 민수 "나는 오늘 일찍 **갈게요**. **피곤해요**."
- Line 63: 지은 "민수야, 어제 몇 시에 집에 **갔어**?"
- Line 65: 민수 "11시에 **갔어요**."
- Line 67: 지은 "늦게까지 **힘들었겠다**."

### MEDIUM Priority Issues:

**M1. Mixed Formality Level (Line 31)**
- **Issue**: "**하나야**, 오늘 뭐 **했어요**?" mixes casual vocative with polite ending
- **Context**: 준호 (senior) to 하나 (junior)
- **Impact**: Minor inconsistency in register
- **Fix Options**:
  - Full casual: "하나야, 오늘 뭐 했어?"
  - Full polite: "하나씨, 오늘 뭐 했어요?"

### LOW Priority Issues: None

---

## 13. Recommendations

### Required Fixes (HIGH):

1. **Standardize 민수-지은 speech level**
   - Recommend: Both use casual (they're close peers, same lab)
   - Change 민수's polite endings to casual when talking to 지은
   - OR change 지은's casual to polite (less natural for close peers)

### Suggested Improvements (MEDIUM):

1. **Fix 준호-하나 mixed formality**
   - Choose consistent level based on their relationship
   - Given 준호 is comfortable senior, casual "하나야, 오늘 뭐 했어?" seems appropriate

### Optional Enhancements (LOW):

None identified.

---

## 14. Validation Conclusion

**Status**: ⚠️ **READY AFTER MINOR FIXES**

**Summary**:
Chapter 03 is high quality with excellent grammar progression, natural dialogue, and perfect story consistency. The past tense introduction is well-executed with good variety and natural contexts. Vocabulary tracking is perfect.

The main issue is speech level inconsistency between peer characters 민수 and 지은. This should be addressed before final release to avoid confusing learners about appropriate relationship speech levels.

**Confidence in naturalness**: 8.5/10 (would be 9.5/10 after speech level fixes)

**Recommended action**: Apply speech level fixes, then ready for release.

---

## Appendix: Pattern Examples

### Excellent Natural Patterns Found:

1. "아, 그렇구나. 다행이다!" - Natural relief expression
2. "점심 먹었어요?" - Natural object particle omission
3. "오늘 뭐 했어요?" - Common casual question
4. "늦게까지 힘들었겠다" - Proper inference/empathy
5. "먼저 갈게요" - Natural leave-taking
6. "같이 가자" - Natural suggestion

### Technical Korean Done Well:

1. "데이터 분석을 해요" - Natural technical collocation
2. "histogram이 잘 나와요" - Natural result description
3. "코드를 고쳤어요" - Natural CS vocabulary
4. "검출기 문제를 해결했어요" - Natural problem-solving phrase

---

**Validator**: Claude Code (Korean Validation System)
**Report Generated**: 2025-10-15
**Next Steps**: Apply recommended speech level fixes

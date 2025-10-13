---
description: Validate the Korean used in an md file
signature: valide_korean <filename> [level]
---
Load validation/korean-validation.md as your validation rulebook.
Extract the base filename from the input path:
- Input: chapters/chapter-02.md → basename: chapter-02
- Input: colloquia/colloquium-01.md → basename: colloquium-01
Determine validation level:
- If [level] is "quick": perform quick validation
- If [level] is "thorough": perform thorough validation  
- If [level] is "basic" or not specified: perform basic validation
Then perform the requested validation level on [filename]:

QUICK VALIDATION (--level quick):
1. Particle Rule Check
   - Load Section 2 "Particle Verification Rules" from korean-validation.md
   - Scan for impossible combinations:
     * 을/를 + 있다/없다
     * Double particles (에서에, 에를, etc.)
     * 이/가 + transitive verb + object
   - Flag any violations with line numbers

2. Speech Level Consistency
   - Within each dialogue, verify consistent formality
   - Check for mixed endings (반말 + 존댓말 in same conversation)
   - Flag: "Line 45: Mixed speech level - '먹어' followed by '주세요'"

3. Common Error Patterns
   - Load Section 9 "Common Unnatural Patterns to Avoid"
   - Check for word-order issues
   - Check for over-translation patterns
   - Flag suspicious patterns

Output: validation-reports/quick-[basename]-[date].md

BASIC VALIDATION (--level basic or default):
Include everything from QUICK plus:

4. Dialogue Naturalness Check
   - Load Section 5 "Dialogue Naturalness Checklist"
   - In casual dialogue, check for:
     * Appropriate contractions (그러면→그럼)
     * Subject omission (natural in Korean)
     * Natural question forms (뭐 해? not 무엇을 해?)
   - Generate naturalness score (0-10)

5. Back-Translation Test (sample)
   - Select 5 random sentences from dialogues
   - Select 3 sentences introducing new grammar
   - Note: "Would need Papago API for actual back-translation"
   - Flag sentences that seem like English word-order

6. Collocation Verification
   - Check common verb-object pairs against Section 2
   - Verify natural combinations:
     * 수업이 있다 ✓ (not 수업을 있다)
     * 밥을 먹다 ✓ (not 밥이 먹다)
     * 커피를 마시다 ✓
   - Flag unusual combinations

Output: validation-reports/basic-[basename]-[date].md

THOROUGH VALIDATION (--level thorough):
Include everything from BASIC plus:

7. Corpus Pattern Analysis
   - Extract all unique sentence patterns
   - Group by grammar structure
   - Flag statistical outliers
   - Note: "In production, would check against Sejong Corpus patterns"

8. Google Search Simulation
   - Extract 10 representative phrases
   - Especially phrases using new grammar
   - Note which phrases would need searching:
     * "Check Google: '도서관에서 만나자'"
     * "Check Google: '수업이 몇 시에 끝나?'"
   - Flag phrases that seem too textbook-like
   - Note, do not report that "google checks pass" or similar, make factual statement as to the extent of the search "Unlikely that google search needed"

9. Story Consistency Check
   CRITICAL: Extract and verify logical consistency:
   
   Time consistency:
   - List all time references (수업 끝나는 시간, 만나는 시간, etc.)
   - Create timeline and check for impossibilities
   - Example check: "If 지은's class ends at 3pm and 민수's at 4pm, they cannot meet at 3pm"
   
   Location tracking:
   - List where each character is throughout the chapter
   - Verify travel time logic (can't instantly move from 연구실 to CERN)
   
   Character knowledge:
   - Track what each character should know at this point
   - Flag if 하나 uses advanced terms she hasn't learned
   - Verify Michael's Korean level is consistent
   
   Factual consistency:
   - List all facts mentioned (room numbers, building names, menu items)
   - Check against previous chapters if available
   - Flag any contradictions
   
   Output specific errors like:
   - "TIMELINE ERROR: 민수 cannot meet at 15:00 if class ends at 16:00"
   - "LOCATION ERROR: 준호 appears in lab (line 23) and CERN (line 25) simultaneously"
   - "CHARACTER ERROR: 하나 uses term 'systematic uncertainty' but hasn't learned it yet"

10. Natural Progression Check
    - Verify vocabulary is from vocabulary-tracker.md
    - Check grammar matches expected chapter level
    - Ensure no advanced grammar accidentally used

11. Comprehensive Scoring
    Rate based on Section 12 "Quality Score Rubric":
    - Particles (0-10)
    - Dialogue (0-10)  
    - Contractions (0-10)
    - Word Order (0-10)
    - Collocations (0-10)
    - Overall confidence score

Output: validation-reports/thorough-[basename]-[date].md


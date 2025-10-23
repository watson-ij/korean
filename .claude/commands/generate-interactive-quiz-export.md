You are creating an interactive HTML export of Korean learning chapters with quiz functionality.

## Task: Generate Interactive Quiz Export

Execute the build script that converts markdown chapters to HTML with interactive True/False quizzes.

## What this does:

1. Converts all markdown chapters to HTML using pandoc
2. Adds interactive JavaScript to True/False questions
3. Includes CSS styling for quiz feedback
4. Loads answer keys from quiz-answers.json
5. Provides immediate feedback when users click answers

## How it works:

The script:
- Finds the "맞아요? 틀려요?" (True or False) section in each chapter
- Converts static questions into interactive radio button quizzes
- Shows green "✓ 맞아요! (Correct!)" for correct answers
- Shows red "✗ 틀려요. (Incorrect. Try again!)" for wrong answers
- Allows users to retry until they get it right

## Steps:

1. Run `./build_site.sh`
2. Confirm the site was built successfully
3. Report the output location (site/index.html)

## Answer Keys:

Answer keys are stored in `quiz-answers.json` in the project root. Format:
```json
{
  "chapter-01": {
    "true_false": [false, true, false, false, false, true, true, true]
  }
}
```

If a new chapter needs answer keys added, analyze the chapter content and add the appropriate true/false array.

## Output:

After running, tell the user:
- Build was successful
- Interactive quizzes are available in the HTML export
- Users can open site/index.html in their browser
- The True/False questions now have clickable radio buttons
- Immediate feedback is provided on each answer

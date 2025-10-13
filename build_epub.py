#!/usr/bin/env python3
"""
Korean Orberg EPUB Generator
Automatically discovers and compiles chapters, colloquia, and supplementary materials into an EPUB.
"""

import os
import re
from pathlib import Path
from typing import List, Tuple
import argparse

try:
    from ebooklib import epub
    import markdown
except ImportError:
    print("Error: Required packages not installed.")
    print("Please install with: pip install ebooklib markdown")
    exit(1)


class ContentFile:
    """Represents a content file with its metadata."""

    def __init__(self, filepath: Path, category: str, sort_key: int = 0):
        self.filepath = filepath
        self.category = category
        self.sort_key = sort_key
        self.title = self._extract_title()

    def _extract_title(self) -> str:
        """Extract title from the first H1 heading in the markdown file."""
        with open(self.filepath, 'r', encoding='utf-8') as f:
            for line in f:
                if line.startswith('# '):
                    return line[2:].strip()
        return self.filepath.stem

    def get_html_content(self) -> str:
        """Convert markdown content to HTML."""
        with open(self.filepath, 'r', encoding='utf-8') as f:
            content = f.read()

        # Convert markdown to HTML with extensions
        html = markdown.markdown(
            content,
            extensions=['tables', 'nl2br', 'sane_lists']
        )
        return html

    def __repr__(self):
        return f"ContentFile({self.category}: {self.title})"


class KoreanOrbергEPUBBuilder:
    """Builds EPUB from Korean Orberg project files."""

    def __init__(self, project_dir: Path):
        self.project_dir = project_dir
        self.content_files: List[ContentFile] = []

    def discover_content(self):
        """Discover all content files in the project."""
        print("Discovering content files...")

        # Chapters
        chapters_dir = self.project_dir / "chapters"
        if chapters_dir.exists():
            for file in sorted(chapters_dir.glob("chapter-*.md")):
                number = self._extract_number(file.stem, "chapter")
                self.content_files.append(ContentFile(file, "chapter", number))

        # Colloquia
        colloquia_dir = self.project_dir / "colloquia"
        if colloquia_dir.exists():
            for file in sorted(colloquia_dir.glob("colloquium-*.md")):
                number = self._extract_number(file.stem, "colloquium")
                self.content_files.append(ContentFile(file, "colloquium", number))

        # Narrationes
        narrationes_dir = self.project_dir / "narrationes"
        if narrationes_dir.exists():
            for file in sorted(narrationes_dir.glob("*.md")):
                number = self._extract_number(file.stem)
                self.content_files.append(ContentFile(file, "narratio", number))

        # Sermones (conversations)
        sermones_dir = self.project_dir / "sermones"
        if sermones_dir.exists():
            for file in sorted(sermones_dir.glob("*.md")):
                number = self._extract_number(file.stem)
                self.content_files.append(ContentFile(file, "sermo", number))

        # Culture notes
        culture_dir = self.project_dir / "culture"
        if culture_dir.exists():
            for file in sorted(culture_dir.glob("*.md")):
                number = self._extract_number(file.stem)
                self.content_files.append(ContentFile(file, "culture", number))

        # Supplements
        supplements_dir = self.project_dir / "supplements"
        if supplements_dir.exists():
            for file in sorted(supplements_dir.glob("*.md")):
                number = self._extract_number(file.stem)
                self.content_files.append(ContentFile(file, "supplement", number))

        print(f"Found {len(self.content_files)} content files")
        for cf in self.content_files:
            print(f"  - {cf}")

    def _extract_number(self, filename: str, prefix: str = "") -> int:
        """Extract numerical ordering from filename."""
        if prefix:
            pattern = f"{prefix}-(\\d+)"
        else:
            pattern = r"(\d+)"

        match = re.search(pattern, filename)
        if match:
            return int(match.group(1))
        return 0

    def build_epub(self, output_file: Path, title: str = "한국어 자연교수법",
                   author: str = "Korean Orberg Project"):
        """Build the EPUB file."""
        print(f"\nBuilding EPUB: {output_file}")

        # Create EPUB book
        book = epub.EpubBook()

        # Set metadata
        book.set_identifier('korean-orberg-001')
        book.set_title(title)
        book.set_language('ko')
        book.add_author(author)

        # Add default CSS for Korean text
        style = '''
        @namespace epub "http://www.idpf.org/2007/ops";
        body {
            font-family: "Noto Sans KR", "Malgun Gothic", "맑은 고딕", sans-serif;
            line-height: 1.8;
            margin: 2em;
        }
        h1 {
            font-size: 2em;
            margin-top: 1em;
            margin-bottom: 0.5em;
            color: #2c3e50;
        }
        h2 {
            font-size: 1.5em;
            margin-top: 1em;
            margin-bottom: 0.5em;
            color: #34495e;
        }
        h3 {
            font-size: 1.2em;
            margin-top: 0.8em;
            margin-bottom: 0.3em;
            color: #7f8c8d;
        }
        p {
            margin: 0.8em 0;
            text-align: justify;
        }
        strong {
            font-weight: bold;
            color: #c0392b;
        }
        table {
            border-collapse: collapse;
            margin: 1em 0;
            width: 100%;
        }
        th, td {
            border: 1px solid #bdc3c7;
            padding: 0.5em;
            text-align: left;
        }
        th {
            background-color: #ecf0f1;
            font-weight: bold;
        }
        '''

        nav_css = epub.EpubItem(
            uid="style_nav",
            file_name="style/nav.css",
            media_type="text/css",
            content=style
        )
        book.add_item(nav_css)

        # Create intro page
        intro_chapter = epub.EpubHtml(
            title='소개',
            file_name='intro.xhtml',
            lang='ko'
        )
        intro_chapter.content = f'''
        <html>
        <head>
            <title>소개</title>
        </head>
        <body>
            <h1>{title}</h1>
            <p>자연교수법(Natural Method)으로 한국어를 배우는 교재입니다.</p>
            <p>이 책은 처음부터 한국어로만 쓰여 있으며, 문맥을 통해 새로운 단어와 문법을 배우게 됩니다.</p>
            <h2>구성</h2>
            <ul>
                <li><strong>과 (Chapters):</strong> 주요 학습 내용</li>
                <li><strong>대화 (Colloquia):</strong> 보충 대화 연습</li>
                <li><strong>이야기 (Narrationes):</strong> 추가 읽기 자료</li>
                <li><strong>대담 (Sermones):</strong> 회화 연습</li>
            </ul>
        </body>
        </html>
        '''
        intro_chapter.add_item(nav_css)
        book.add_item(intro_chapter)

        # Add content files as chapters
        epub_chapters = [intro_chapter]
        spine_items = ['nav', intro_chapter]

        # Group content by category
        categories = {
            'chapter': ('과', []),
            'colloquium': ('대화', []),
            'narratio': ('이야기', []),
            'sermo': ('대담', []),
            'culture': ('문화', []),
            'supplement': ('보충', [])
        }

        for cf in sorted(self.content_files, key=lambda x: (x.category, x.sort_key)):
            if cf.category in categories:
                categories[cf.category][1].append(cf)

        # Add content by category
        chapter_num = 1
        for category_key, (category_name, files) in categories.items():
            if not files:
                continue

            # Add section divider
            section_chapter = epub.EpubHtml(
                title=category_name,
                file_name=f'section_{category_key}.xhtml',
                lang='ko'
            )
            section_chapter.content = f'''
            <html>
            <head>
                <title>{category_name}</title>
            </head>
            <body>
                <h1>{category_name}</h1>
            </body>
            </html>
            '''
            section_chapter.add_item(nav_css)
            book.add_item(section_chapter)
            epub_chapters.append(section_chapter)
            spine_items.append(section_chapter)

            # Add files in this category
            for cf in files:
                chapter = epub.EpubHtml(
                    title=cf.title,
                    file_name=f'chap_{chapter_num:03d}.xhtml',
                    lang='ko'
                )

                html_content = cf.get_html_content()
                chapter.content = f'''
                <html>
                <head>
                    <title>{cf.title}</title>
                </head>
                <body>
                    {html_content}
                </body>
                </html>
                '''
                chapter.add_item(nav_css)

                book.add_item(chapter)
                epub_chapters.append(chapter)
                spine_items.append(chapter)
                chapter_num += 1

                print(f"  Added: {cf.title}")

        # Define Table of Contents
        book.toc = tuple(epub_chapters)

        # Add navigation files
        book.add_item(epub.EpubNcx())
        book.add_item(epub.EpubNav())

        # Define spine
        book.spine = spine_items

        # Write EPUB file
        epub.write_epub(output_file, book)
        print(f"\nEPUB created successfully: {output_file}")
        print(f"Total chapters: {len(epub_chapters)}")


def main():
    parser = argparse.ArgumentParser(
        description='Build EPUB from Korean Orberg project'
    )
    parser.add_argument(
        '--output', '-o',
        type=str,
        default='korean-orberg.epub',
        help='Output EPUB filename (default: korean-orberg.epub)'
    )
    parser.add_argument(
        '--title', '-t',
        type=str,
        default='한국어 자연교수법',
        help='Book title (default: 한국어 자연교수법)'
    )
    parser.add_argument(
        '--author', '-a',
        type=str,
        default='Korean Orberg Project',
        help='Author name (default: Korean Orberg Project)'
    )
    parser.add_argument(
        '--project-dir', '-d',
        type=str,
        default='.',
        help='Project directory (default: current directory)'
    )

    args = parser.parse_args()

    project_dir = Path(args.project_dir).resolve()
    output_file = Path(args.output)

    if not project_dir.exists():
        print(f"Error: Project directory not found: {project_dir}")
        exit(1)

    # Build EPUB
    builder = KoreanOrbергEPUBBuilder(project_dir)
    builder.discover_content()
    builder.build_epub(output_file, title=args.title, author=args.author)


if __name__ == '__main__':
    main()

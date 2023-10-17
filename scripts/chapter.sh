echo "Chapter index (ii): "; read chapter
cp -i template.md chapter_$chapter.md
echo "File path: $(ls chapter_$chapter.md)";
#! /bin/bash
# By Muayyad Alsadi <alsadi@gmail.com>
# based my old article http://www.ojuba.org/wiki/blog/alsadi/14301126-rtl-web

find . -name '*.css' -and -not -name '*.rtl*.css'| while read f
do
f2=${f/.css/.rtl.css}
f2=${f2/.min.rtl.css/.rtl.min.css}
cp "$f" "$f2"
done

find . -name '*.rtl*.css' -print0 | 
  xargs -0 perl -i -lwpe '
    s/copyright/copybogoight/gi;s/copyleft/copyright/gi;s/copybogoight/copyleft/gi;
    s/right/bogoight/gi;s/left/right/gi;s/bogoight/left/gi;
    s/([\w-]*radius)\s*:\s*(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)/${1}: ${3} ${2} ${5} ${4}/gi;
    s/(margin|padding)\s*:\s*(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)/${1}: ${2} ${5} ${4} ${3}/gi;
    s/((?:margin|border|padding)-width)\s*:\s*(thin|medium|thick|inherit|auto|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(thin|medium|thick|inherit|auto|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(thin|medium|thick|inherit|auto|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(thin|medium|thick|inherit|auto|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)/${1}: ${2} ${5} ${4} ${3}/gi;
    s/((?:margin|border|padding)-style)\s*:\s*(none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset|inherit|auto)\s+(none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset|inherit|auto)\s+(none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset|inherit|auto)\s+(none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset|inherit|auto)/${1}: ${2} ${5} ${4} ${3}/gi;'


#! /bin/bash
# By Muayyad Alsadi <alsadi@gmail.com>
# based my old article http://www.ojuba.org/wiki/blog/alsadi/14301126-rtl-web

find . -name '*.css' -and -not -name '*.rtl*.css'| while read f
do
f2=${f/.css/.rtl.css}
f2=${f2/.min.rtl.css/.rtl.min.css}
cp -fv "$f" "$f2"
done

find . -name '*.rtl*.css' -print0 | 
  xargs -0 perl -i -lwpe '
    s/copyright/copybogoight/gi;s/copyleft/copyright/gi;s/copybogoight/copyleft/gi;
    s/right/bogoight/gi;s/left/right/gi;s/bogoight/left/gi;
    s/([\w-]*radius)\s*:\s*(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)/${1}: ${3} ${2} ${5} ${4}/gi;
    s/(margin|padding)\s*:\s*(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(auto|inherit|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)/${1}: ${2} ${5} ${4} ${3}/gi;
    s/((?:margin|border|padding)-width)\s*:\s*(thin|medium|thick|inherit|auto|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(thin|medium|thick|inherit|auto|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(thin|medium|thick|inherit|auto|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)\s+(thin|medium|thick|inherit|auto|[\.\d]+(?:em|ex|px|in|cm|mm|pt|pc|%)?)/${1}: ${2} ${5} ${4} ${3}/gi;
    s/((?:margin|border|padding)-style)\s*:\s*(none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset|inherit|auto)\s+(none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset|inherit|auto)\s+(none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset|inherit|auto)\s+(none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset|inherit|auto)/${1}: ${2} ${5} ${4} ${3}/gi;'

find . -name '*.html' -print0 | xargs -0 perl -i -lwpe '
    s!(<html [^>]*)dir=\S*\s*!$1!g;
    s!<html !<html dir="rtl" !g;
    s!(href="[^"]*?)(\.rtl|\.rtl\.min|\.min\.rtl)\.css!$1.css!g;
    s!(href="\S*)\.css!$1.rtl.css!g;
    s!\.min\.rtl\.css!.rtl.min.css!g;
'

# we either flip the js file (and maintain .rtl.js files) or just patch the following known js bugs
perl -i -wlp0e '
    s!(}\s*\.tooltip\.(?:top|bottom) \.tooltip-arrow\s*{[^}]*)right:\s*50%;!$1left:50%;!gm;
    s!(}\s*\.tooltip\.left \.tooltip-arrow\s*{[^}]*)right:\s*0;!$1left:0;!gm;
    s!(}\s*\.popover\s*{[^}]*)right:\s*0;!$1left:0;!gm;
' docs/assets/css/bootstrap.rtl.css docs/assets/css/bootstrap.rtl.min.css


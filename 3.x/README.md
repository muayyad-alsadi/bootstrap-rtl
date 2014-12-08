# 

## How examples were fixed

    find examples/ -name '*.html' | \
        xargs perl -i -lwpe 's!../../dist/(css|js)/!../../$1/!g;s!../../assets/js/!../../js/!g;s!<html[^>]*>!<html lang="ar" dir="rtl">!g;s!<link href="../../css/bootstrap.min.css" rel="stylesheet">\s*$!<link href="../../css/bootstrap.min.css" rel="stylesheet"><link href="../../css/bootstrap.rtl.css" rel="stylesheet">!g;s!<link href="../../css/bootstrap-theme.min.css" rel="stylesheet">\s*$!<link href="../../css/bootstrap-theme.min.css" rel="stylesheet"><link href="../../css/bootstrap-theme.rtl.css" rel="stylesheet">!g;'



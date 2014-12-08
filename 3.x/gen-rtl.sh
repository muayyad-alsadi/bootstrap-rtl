#! /bin/bash

cd `dirname "$0"`
../RtlCss/RtlCss.py -x blacklist.txt css/bootstrap.min.css css/bootstrap-theme.min.css css/docs.min.css
mv css/bootstrap.rtl.css css/bootstrap.auto.rtl.css
touch css/bootstrap.fix.rtl.css
mv css/bootstrap-theme.rtl.css css/bootstrap-theme.auto.rtl.css
touch css/bootstrap-theme.fix.rtl.css
uglifycss css/rtl-xtra.css > css/rtl-xtra.min.css
uglifycss css/bootstrap.auto.rtl.css css/bootstrap.fix.rtl.css > css/bootstrap.rtl.css
uglifycss css/bootstrap-theme.auto.rtl.css css/bootstrap-theme.fix.rtl.css > css/bootstrap-theme.rtl.css


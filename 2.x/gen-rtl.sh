#! /bin/bash

cd `dirname "$0"`
../RtlCss/RtlCss.py -x blacklist.txt css/bootstrap.min.css css/bootstrap-responsive.min.css
mv css/bootstrap.rtl.css css/bootstrap.auto.rtl.css
touch css/bootstrap.fix.rtl.css
mv css/bootstrap-responsive.rtl.css css/bootstrap-responsive.auto.rtl.css
touch css/bootstrap-responsive.fix.rtl.css
uglifycss css/rtl-xtra.css > css/rtl-xtra.min.css
uglifycss css/bootstrap.auto.rtl.css css/bootstrap.fix.rtl.css > css/bootstrap.rtl.css
uglifycss css/bootstrap-responsive.auto.rtl.css css/bootstrap-responsive.fix.rtl.css > css/bootstrap-responsive.rtl.css

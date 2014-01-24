#!/usr/bin/python

import os
import sys
import urllib2
import simplejson

from escpos import *


gitlab_host     = "http://lpjfr31.pj.fr/"
private_token   = "YhYNmGhfwwqNCfCioHP3"
pagination      = "&per_page=100"
endpoint        = "projects"

projects_url    = gitlab_host + "api/v3/" + endpoint + "?private_token=" + private_token + pagination

proxy       = urllib2.ProxyHandler({'http': 'pmeuel:Pitapita1@cerberus.pj.fr:8080'})
req         = urllib2.Request(projects_url, None)
opener      = urllib2.build_opener(proxy)
res         = opener.open(req)
projects    = simplejson.load(res)

Epson       = printer.Usb(0x04b8,0x0202)
lineWidth   = 42

try:
    Epson.set("center", "a", "normal", 1, 1)
    Epson.image("gitlab.jpg");
    Epson.text("\n\n");

    Epson.set("left", "a", "normal", 1, 1)
    
    for project in projects:
    
        Epson.text(project["name_with_namespace"])
        Epson.text("\n")
    

except Exception:
    print "Unexpected error: " , sys.exc_info()[0]
    
    Epson.text("Oh no, something wrong happened\n\n")

# Apparently, this cut() method is also used to close the USB
# connection to the printer
Epson.cut()

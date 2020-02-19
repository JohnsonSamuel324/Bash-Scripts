#!/bin/bash

User=$(whoami)
Input="/home/Users/johnss2/documents"
Output="/home/Users/johnss2/desktop/$Filename"
Filename=ug-$(date +%-Y-m%-d)-$(date +%-T).tar.gz
tar -czf $Output $Input

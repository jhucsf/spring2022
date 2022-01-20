#! /usr/bin/env ruby

require 'csv'

FRONT_STUFF = <<'EOF1'
---
layout: default
title: "Schedule"
category: "schedule"
---

This page lists topics, readings, and has links to lecture slides.
It also lists assignment due dates.  Dates <span class="tentative">in
gray</span> are tentative.

This schedule could (and probably will) change!  Changes
to the schedule will be announced in class and/or on
[Piazza](https://piazza.com/jhu/spring2022/601229).

Unless otherwise indicated, readings are from Bryant and
O'Hallaron, [Computer Systems: A Programmer's Perspective, 3rd
ed](https://csapp.cs.cmu.edu/).  **Important**: do the reading *before*
you come to class.

The links to slides are provided for reference.  In general, there is no
guarantee that they will be posted before class, or that their content
will not change.

Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Topic/Slides | Reading | Assignment
------------------ | ------------ | ------- | ----------
EOF1

print FRONT_STUFF

first = true
CSV.foreach('schedule.csv') do |row|
  if first
    first = false
  else
    # Date,Topic,Slides,"Example Code",Reading,Assignment
    while row.length < 6
      row.push('')
    end

    row = row.map {|x| x.nil? ? '' : x}

    date, topic, slides, example_code, reading, assignment = row

    #puts date

    print date

    print " | #{topic}"
    if slides != ''
      print ": [slides](#{slides})"
    end

    if example_code != ''
      print ", [#{example_code} (example code)](lectures/#{example_code})"
    end

    print " | #{reading}"

    puts " | #{assignment}"
  end
end

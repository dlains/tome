# frozen_string_literal: true

Date::DATE_FORMATS[:stamp]  = '%b %-d, %Y'          # Jan 1, 1999
Time::DATE_FORMATS[:stamp]  = '%b %-d, %Y %l:%M %p' # Jan 1, 1999 1:15 am
Time::DATE_FORMATS[:dstamp] = '%b %-d, %Y'          # Jan 1, 1999 Sometimes I only want the date part of a Time.

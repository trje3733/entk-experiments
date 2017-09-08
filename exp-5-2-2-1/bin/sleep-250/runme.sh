#!/bin/bash
export RADICAL_ENTK_VERBOSE=INFO
export RADICAL_ENTK_PROFILE=True
export RADICAL_PILOT_PROFILE=True
export RADICAL_PILOT_DBURL=mongodb://user:user@ds153652.mlab.com:53652/test_08_08
export RP_ENABLE_OLD_DEFINES=True

for t in $(seq 2 1 5); do
        mkdir raw_data/sleep-252-trial-$t
        python poe.py 16 252 xsede.supermic
        radicalpilot-fetch-json rp.session.*
        mv *.prof rp.session.* raw_data/sleep-252-trial-$t
done

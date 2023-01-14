#!/bin/sh

wget "https://www.learntoplaymusic.com/blog/music-lessons/guitar/progressive-blues-guitar-licks/progressive-blues-guitar-licks-section-1/"

wget "https://www.learntoplaymusic.com/blog/music-lessons/guitar/progressive-blues-guitar-licks/progressive-blues-guitar-licks-section-2/"

wget "https://www.learntoplaymusic.com/blog/music-lessons/guitar/progressive-blues-guitar-licks/progressive-blues-guitar-licks-section-3/"

wget "https://www.learntoplaymusic.com/blog/music-lessons/guitar/progressive-blues-guitar-licks/progressive-blues-guitar-licks-section-4/"

cat index.html index.html.1 index.html.2 index.html.3 | grep mp3 | sed -r "s/\s+//g" | grep -oe "https.*\.mp3" | sort | uniq > list

wget -i list

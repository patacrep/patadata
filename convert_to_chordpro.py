#!/usr/bin/env python3

from patacrep.songs.latex import LatexSong
import re
import os
import glob

REPLACES = [
    (r"\selectlanguage{", '{language: '),
    (r"\songcolumns{", '{columns: '),
    (r"\capo{", '{capo: '),
    (r"\[", '['),
    (r"\begin{chorus}", '{start_of_chorus}'),
    (r"\end{chorus}", '{end_of_chorus}'),
    (r"\begin{verse}", ''),
    (r"\end{verse}", ''),
    (r"\endsong", ''),
    (r"{\ldots}", "...")
]

def song_metadata(song):
    # titles
    meta = ""
    meta += "{title: " + song.titles[0] + "}\n"
    if len(song.titles) > 1:
        for title in song.titles[1:]:
            meta += "{subtitle: " + title + "}\n"
    # artists
    for artist, _ in song.authors:
        meta += "{artist: " + artist + "}\n"

    # album
    if "album" in song.data.keys():
        meta += "{album: " + song.data["album"] + "}\n"

    return meta

def convert(path):
    with open(path) as in_file:
        content = in_file.read()
    config = {'encoding': "utf8", "titleprefixwords": [], "_compiled_authwords": {}}
    song = LatexSong('.', path, config)
    metadata = song_metadata(song)
    content = re.sub(r"\\beginsong(.*)\n(.*)\]", metadata, content)

    for latex, chordpro in REPLACES:
        content = content.replace(latex, chordpro)

    if "cov" in song.data.keys():
        content = content.replace(r"\cover", "{cover: " + song.data["cov"] + "}")

    with open(path + "c", "w") as out_file:
        out_file.write(content)

if __name__ == '__main__':
    song_folders = glob.glob(os.path.join(os.path.dirname(__file__), "songs", '*'))
    for directory in song_folders:
        for root, _, files in os.walk(directory, topdown=False):
            for file in files:
                if file.endswith(".sg"):
                    path = os.path.join(root, file)
                    try:
                        convert(path)
                    except Exception as e:
                        print("Error while converting {}".format(path))
                        print(str(e))

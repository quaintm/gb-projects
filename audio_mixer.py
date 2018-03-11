"""
For contribution to PowersOfTau, 3/10/2018

Reads in three audio files as binary, applies three different hash functions, 
and feeds to CSPRNG to increase kernel entropy
"""

from hashlib import md5
from hashlib import sha256
from pyblake2 import blake2b
import os

hash_list = [blake2b(), sha256(), md5()]
audio_files = ['audio1.m4a', 'audio2.m4a', 'audio3.m4a']


seed_list = []
for afile, hsh in zip(audio_files, hash_list):
    f = open(afile, 'rb')
    hsh.update(f.read())
    seed_list.append(hsh.hexdigest())


for seed in seed_list:
    os.system("echo '{SEED}' > /dev/random")

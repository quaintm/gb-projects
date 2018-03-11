-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Monica Quaintance
Brooklyn, NY
2018/03/11

For my contribution to Powers of Tau I added additional randomness using audio input.

I downloaded the challenge file at approximately 5pm New York time on 2018/03/10 (22:00 UTC) onto a machine with the following specifications:

Model: MacBook Pro 2017
OS: OSX 10.13.2
Memory: 16Gb
Processor: 3.5 GHz Intel Core i7
Architecture: amd64

Subsequently the machine was disconnected from the internet and remained so until after computation. The entire process occured within the confines of my apartment and my roof with one other trusted person. Using a high-sensitiity microphone, I made three separate audio recordings of:

1) my rendition of a sung bluegrass piece "Annabelle" (Gillian Welch), accompanied on mandolin
2) a reading of "Ozymandias" (Percy Bysshe Shelley) by this other trusted person
3) two mintues of NYC street noise

The binary representation of each audio file was hashed using a different function; BLAKE2, SHA256, and md5, respectively.

The hash from each was added to /dev/random, contributing to the entropy pool of the CSPRNG.
The code for this mixing can be found at https://github.com/quaintm/misc-projects/blob/c586ed2d4a39ecea7dff1dcd95a00ecc8eef2500/audio_mixer.py.

Subsequently, I ran the golang implementation of powersoftau from this commit: https://github.com/FiloSottile/powersoftau/commit/e2af113817477d26e6155f1aae478d3cb58d62c5 and used the go compiler version go1.10. The computation took a shockingly long time to run; it began at 2018/03/11 01:16:30 UTC and completed at 2018/3/11 17:00:56. No hypotheses at this time for why it took so long; taucompute used up 2.18G of memory at peak while kernel_task used 1.4G of memory at peak. There should have been far more memory accessible (16Gb machine), yet the process used up to 1.15G of swap. Despite the lag, it did finally complete.

The generated response was uploaded at 18:15 PM UTC and has been retained. The BLAKE2b hash of `./response` is:

6f2bfecd 1a379246 1a0a4dec 936fccc8
55f97200 d8797912 5eb561dd 1b98d4f0
2e3ed576 27933295 a51d71e1 81863945
cb70d2cf 83f3a3b9 646155fa 0e28d3ac

Public copy of this hash was also posted on twitter: https://twitter.com/QuaintM/status/972961152593465344

After the computation all audio files were saved over in place and the machine was restarted.

Thank you to Jason Davies and Miron Cuperman for answering questions, Filippo Valsorda for your golang implementation, Zcash for this killer project, and Jay Graber for tipping me off in the first place.

Monica Quaintance
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE7tdIUnoiCYMElknHfcsDG8N+hAgFAlqlrawACgkQfcsDG8N+
hAhoTRAAqWQdQihGO4TVPMoVKSoZ5SKndUk8suWJ4sSpF24NCd2kLvCd4CcznZIo
gFjXcMx+2afSUeFzzK1r1Xv0bckKsFMeg29LWLRS/LDcVq10Z1EE5FoYefH1hv3H
Z5Aaym6j/eA4lOaUo4MucXo8fx7m1sZMa531xEYvu5dba3BlZeD32YSN8vd7hA3T
4KFSTpAeO6heJQfJSuodY2nsin5izaDhi2BLIzhOvueXLJa1cQtIQpBkA9k9agTJ
Fa2fg3vojolKQNdDNzb1EOAXrWr+Sg3RrOu0KZcW8iCG7GWYxYJoFH+xCcrJRhRH
AteNQicE1qOuIMSDfRlAhtQweH+yNlljW8MFiYmfZx1NXfB5ODa15rsdSyGZ09ht
foI3sysoYemWNJo0yB+DEr20mFibzAdOWRlxUQ6DXoiiIbXr8FMKUBod3mOPZ0Gy
VSEjuHmAupSOfIq6G/xumNFQOi57Ym3XUOsAyiEcsUTYESpEw7mXNBTR4UUUYeRF
+AWGbOxW8KxDHd8F8RCMdKFg+AxbiJMgx2v3NCUT06UbeAme7XMmrao0vFlyKM+V
ZnIqqYzMsFxCsSD5DEZyqFijkxBMPIibNlxb/HeTTHyN9GhlCYNTIO0+McnsCkQu
Gd6K880UP0SwA9jtcKqj1AxZR2eMqbiOylaRaxvUUOnogelBavQ=
=N2xD
-----END PGP SIGNATURE-----


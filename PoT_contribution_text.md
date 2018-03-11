PoT contribution

For this contribution to Powers of Tau we added randomness using audio input.

I downloaded the challenge file at approximately 5pm New York time onto a machine with the following specifications:

Model: MacBook Pro 2017
OS: OSX 10.13.2 (17C88)
Processor: 3.5 GHz Intel Core i7
Architecture: amd64

Using a high-sensitiity cardioid microphone, I made three separate audio recordings of:

1) a bluegrass song, accompanied on mandolin
2) a reading of "Ozymandias" (Percy Bysshe Shelley) by a separate person
3) NYC street noise

The binary representation of each audio file was hashed using a different function; BLAKE2, SHA256, and md5, respectively.

The hash from each was added to /dev/random, contributing to the entropy pool of the CSPRNG.
The code for this mixing can be found at https://github.com/quaintm/misc-projects/blob/c586ed2d4a39ecea7dff1dcd95a00ecc8eef2500/audio_mixer.py.

Subsequently, I ran the golang implementation of powersoftau from this commit: https://github.com/FiloSottile/powersoftau/commit/e2af113817477d26e6155f1aae478d3cb58d62c5 and used the go compiler version go1.10. The computation took a shockingly long time to run; it began at 2018/03/11 01:16:30 UTC and completed at 2018/3/11 17:00:56. The generated response was uploaded at 18:15 PM UTC and has been retained. The BLAKE2b hash of `./response` is:

	6f2bfecd 1a379246 1a0a4dec 936fccc8
	55f97200 d8797912 5eb561dd 1b98d4f0
	2e3ed576 27933295 a51d71e1 81863945
	cb70d2cf 83f3a3b9 646155fa 0e28d3ac

After this the machine was restarted and all audio files saved over in place.
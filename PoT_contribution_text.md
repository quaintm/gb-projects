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
The code for this mixing can be found at [URL].

Subsequently, I ran the golang implementation of powersoftau from this commit: https://github.com/FiloSottile/powersoftau/commit/e2af113817477d26e6155f1aae478d3cb58d62c5 and used the go compiler version go1.10. The generated response  was uploaded at [XXXXXX]PM EST and has been retained. The BLAKE2 hash of the response is:

[]

After this the machine was restarted and all audio files saved over in place.


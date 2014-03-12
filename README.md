DANcompression
==============

A lua script and key list for encrypting and then decrypting individual files, resulting in smaller file sizes.

This is an experimental project that (last checked) Runs on Lua 5.2.

The original idea was to create a DNA inspired data compression method, but i continously mispelled it as DAN, so i just left it like that.

How DANcompression works:

Running the lua script offers a series of options. The two options that actually do work are 'encrypt' and 'decrypt'.
Encryt will encrypt a file to .dan by name.
Decrypt will decrypt a file from .dan by name.

The keylist.txt file is a list of keys and values that are used to create the .dan files. The repetitive nature of using only numbers to represent any values creates larger files when encrypted, but relatively compressible when zipped, resulting in smaller files when sent. The Lua version of this program does not offer any recommendable level of protection, as patterns can be established relatively quickly. However there is a Java version I wrote with superior levels of obfuscation which I may include in the future.

Once the files are decrypted they will be about 10-20% smaller than the original file size. This is a very nice little effect if your issue is size and you will not be needing the files to be in a human-readable format. Theoretically this could be included in a system which automatically generates files for it's own use, freeing up some extra space.

As I mentioned before that this project was built on the idea of DNA I intended to be able to create a 'nucleus' of sorts, which would just be one fat zip of .dan files. These could then be decompressed when needed and then decrypted to regenerate the original source code they were created from. The implementations would be in any volatile sort of environment, perhaps a Ramdisc of sorts? In this environment the source code would be erased when the disc was removed, and would have to be copied back into the drive once it restarts. The purpose of a DAN nucleus would be restoration of original functionality in most imagined cases.

This has been a personal toy of mine for some time, and there are many versions of this written in many other languages attempting to look around for performance. At some point I will most likely release a C++ version which I would deem the fastest at this time. Feel free to tinker with what I have provided you until then. Enjoy!

NOTE::
I am aware there is a little bug in the % completion statements, it goes to 100% and then restarts at 0%. This isn't actually what it's doing, just a little mistake on my part, everything is functioning normally if you are wondering.

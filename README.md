DANcompression
==============

A lua script and key list for encrypting and then decrypting individual files, resulting in smaller file sizes.

This is a <i>concept</i> project that Runs on Lua 5.3.3 and as far back as lua 5.2 (potentially farther but I haven't tested). Please don't take anything in here assuming it actually works as detailed.

<h2>What is this?</h2>

The original idea was to create a DNA inspired data compression method, but i continously mispelled it as DAN, so i just left it like that.

<h2>How DANcompression Works</h2>

Running the lua script offers a series of options. The two options that actually do work are 'encrypt' and 'decrypt'.
Encryt will encrypt a file to .dan by name.
Decrypt will decrypt a file from .dan by name.

The keylist.txt file is a list of keys and values that are used to create the .dan files. The repetitive nature of using only numbers to represent any values creates larger files when encrypted, but relatively compressible when zipped, resulting in smaller files when sent. The Lua version of this program does not offer any recommendable level of protection, as patterns can be established relatively quickly.

Once the files are decrypted they will be about 10-20% smaller than the original file size. Basically this is a glorified whitespace eliminator, but puts files into an intermediary format to perform the process.

As I mentioned before that this project was built on the idea of DNA I intended to be able to create a 'nucleus' of sorts, which would just be one fat zip of .dan files. These could then be decompressed when needed and then decrypted to regenerate the original source code they were created from. The implementations would be in any volatile sort of environment, perhaps a Ramdisc of sorts? In this environment the source code would be erased when the disc was removed, and would have to be copied back into the drive once it restarts. The purpose of a DAN nucleus would be restoration of original functionality in most imagined cases.

This has been a personal toy of mine for some time, and there are many versions of this written in many other languages attempting to look around for performance. At some point I will most likely release a C++ version which I would deem the fastest at this time. Feel free to tinker with what I have provided you until then. Enjoy!

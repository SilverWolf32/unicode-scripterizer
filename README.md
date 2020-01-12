# Unicode Scripterizer

Convert regular letters to fancy ones!

## Compilation

You'll need Swift. You can get it from https://swift.org, or by installing Xcode if you're on a Mac.

Then simply run `make`. There are no other dependencies.

## Usage

Examples:
```
unicode-scripterizer
echo 'Whee, blackletter!' | unicode-scripterizer -b
```

## Available conversions

- Script letters
  - Default
  - Missing lowercase h  
    𝐴𝐵𝐶𝐷𝐸𝐹𝐺𝐻𝐼𝐽𝐾𝐿𝑀𝑁𝑂𝑃𝑄𝑅𝑆𝑇𝑈𝑉𝑊𝑋𝑌𝑍  
    𝑎𝑏𝑐𝑑𝑒𝑓𝑔_𝑖𝑗𝑘𝑙𝑚𝑛𝑜𝑝𝑞𝑟𝑠𝑡𝑢𝑣𝑤𝑥𝑦𝑧
- Blackletter Bold
  - `-b`
  - No gaps  
    𝕬𝕭𝕮𝕯𝕰𝕱𝕲𝕳𝕴𝕵𝕶𝕷𝕸𝕹𝕺𝕻𝕼𝕽𝕾𝕿𝖀𝖁𝖂𝖃𝖄𝖅  
    𝖆𝖇𝖈𝖉𝖊𝖋𝖌𝖍𝖎𝖏𝖐𝖑𝖒𝖓𝖔𝖕𝖖𝖗𝖘𝖙𝖚𝖛𝖜𝖝𝖞𝖟
  - Fallback for Blackletter Light
- Blackletter Light
  - `-B`
  - Missing several capital letters  
    𝔄𝔅_𝔇𝔈𝔉𝔊__𝔍𝔎𝔏𝔐𝔑𝔒𝔓𝔔_𝔖𝔗𝔘𝔙𝔚𝔛𝔜_  
    𝔞𝔟𝔠𝔡𝔢𝔣𝔤𝔥𝔦𝔧𝔨𝔩𝔪𝔫𝔬𝔭𝔮𝔯𝔰𝔱𝔲𝔳𝔴𝔵𝔶𝔷
  - Missing letters will be substituted with Blackletter Bold, which may look funny
- Runes
  - `-r` or `-R`
  - Mostly Elder Futhark, with some substitutions for letters with no equivalent
  - Case is lost in the conversion!
  - Converts spaces to runic punctuation dots
  - `-R` will add hair spaces around the space dots for readability

## License

This is free and unencumbered software released into the public domain.
See [COPYING.md](COPYING.md) for more information.

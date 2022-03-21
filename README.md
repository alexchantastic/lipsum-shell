# lipsum-shell

A shell script to generate [lorem ipsum](https://en.wikipedia.org/wiki/Lorem_ipsum) dummy text.

## Installation

1. Clone or download the repo
2. Create a symlink from the script to your `/usr/local/bin` folder
   ```sh
   ln -s $PATH_TO_REPO/lipsum.sh /usr/local/bin/lipsum
   ```

Or run the script directly:

```sh
sh lipsum.sh
```

## Usage

```sh
lipsum [-t] [-c] [-m|M|w|W|h|v]

# Generate 10 characters
lipsum -t characters -c 10

# Generate 10 words
lipsum -t words -c 10

# Generate 10 sentences with 8 to 12 words
lipsum -t sentences -c 10 -m 8 -M 12

# Generate 10 paragraphs with 4 to 6 sentences that are 8 to 10 words
lipsum -t paragraphs -c 10 -m 4 -M 6 -w 8 -W 10
```

### Options

| Name | Description |
| --- | --- |
| `-t` | Type of text structure to generate (see [Type Keywords](#type-keywords)) |
| `-c` | Number of structures to generate |
| `-m` | Minimum number of structures to generate (applies to sentence and paragraph only) |
| `-M` | Maximum number of structures to generate (applies to sentence and paragraph only) |
| `-w` | Minimum number of words to generate per sentence (applies to paragraph only) |
| `-W` | Maximum number of words to generate per sentence (applies to paragraph only) |
| `-v` | Print version |
| `-h` | Print help |

#### Type Keywords

| Type | Keywords |
| --- | --- |
| Characters | `characters`, `character`, `char`, `c` |
| Words | `words`, `word`, `w` |
| Sentences | `sentences`, `sentence`, `sent`, `s` |
| Paragraphs | `paragraphs`, `paragraph`, `para`, `p` |

#### Defaults

| Type | Option | Value |
| --- | --- | --- |
| Sentences | `-m` | 4 |
| Sentences | `-M` | 8 |
| Paragraphs | `-m` | 5 |
| Paragraphs | `-M` | 10 |
| Paragraphs | `-w` | 4 |
| Paragraphs | `-W` | 8 |

## License

Code released under the [MIT License](https://github.com/alexchantastic/lipsum-shell/blob/master/LICENSE).
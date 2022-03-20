# lipsum-shell

A shell script to generate [lorem ipsum](https://en.wikipedia.org/wiki/Lorem_ipsum) dummy text.

## Usage

```sh
lipsum [-t] [-c] [-m|M|w|W|h|v]
```

### Options

| Name | Description |
| --- | --- |
| `t` | Type of text structure to generate (characters|words|sentences|paragraphs) |
| `c` | Number of structures to generate |
| `m` | Minimum number of structures to generate (applies to sentence and paragraph only) |
| `M` | Maximum number of structures to generate (applies sentence and paragraph only) |
| `w` | Minimum number of sentence words to generate (applies to paragraph only) |
| `W` | Maximum number of sentences words to generate (applies to paragraph only) |
| `v` | Print the software version |
| `h` | Print help |

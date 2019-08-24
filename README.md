# Polyglot
[![Build Status](https://travis-ci.org/PolyMathOrg/Polyglot.svg?branch=master)](https://travis-ci.org/PolyMathOrg/Polyglot)
[![Build status](https://ci.appveyor.com/api/projects/status/nk84odcludj242lw?svg=true)](https://ci.appveyor.com/project/nikhilpinnaparaju/Polyglot)
[![Coverage Status](https://coveralls.io/repos/github/PolyMathOrg/Polyglot/badge.svg?branch=master)](https://coveralls.io/github/PolyMathOrg/Polyglot?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PolyMathOrg/Polyglot/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

A library for Natural Language Processing implemented in Pharo. To get more information, check out the [Polyglot Booklet](https://github.com/SquareBracketAssociates/Booklet-Polyglot).

## Installation
To install Polyglot, go to the Playground (`Ctrl+OW`) in your fresh Pharo image and execute the following Metacello script (select it and press Do-it button or `Ctrl+D`):

```smalltalk
Metacello new
  baseline: 'Polyglot';
  repository: 'github://PolyMathOrg/Polyglot/src';
  load.
```

## List of Supported Features

- Tokenization
- N-grams
- Term Frequency-Inverse Document Frequency Scoring
- N-Gram Language Modelling
- Stemming
- Part of Speech Tagging
- Named Entity Recognizer
- Dependency Parser
- Modified Atlas Bridge
- Common Vector Metrics

## More
For more resources checkout the [Project Report](https://gist.github.com/nikhilpinnaparaju/1ebdc5899e5f9bc90c64b92d3d4cde54)

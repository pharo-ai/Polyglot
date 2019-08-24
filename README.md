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

## Google Summer of Code 2019 Report
### Author: Nikhil Pinnaparaju

Organisation: [Pharo](https://pharo.org/)

Project: [Polyglot](https://github.com/PolyMathOrg/Polyglot)

Mentors: Oleksandr Zaitsev, Alexandre Bergel


A library for Natural Language Processing implemented in Pharo. 

## Features Implemented
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


## Code Contribution
- [Commits - Polyglot](https://github.com/PolyMathOrg/Polyglot/commits/master?author=nikhilpinnaparaju).

- [Pull Requests - Polyglot](https://github.com/PolyMathOrg/Polyglot/pulls?utf8=%E2%9C%93&q=is%3Apr+author%3Anikhilpinnaparaju+).

- [Issues Raised - PolyMath](https://github.com/PolyMathOrg/PolyMath/issues?utf8=%E2%9C%93&q=is%3Aissue+author%3Anikhilpinnaparaju+).

- [Pull Requests - PolyMath](https://github.com/PolyMathOrg/PolyMath/pulls?utf8=%E2%9C%93&q=is%3Apr+author%3Anikhilpinnaparaju+).

## Documentation

### Blog Posts

- [Representing Documents as Vectors and Visualizing them Using Polyglot in Pharo](https://medium.com/@nikhilpinnaparaju/representing-documents-as-vectors-and-visualizing-them-using-polyglot-in-pharo-73887e8bb418)
- [Stemming in Polyglot](https://medium.com/@nikhilpinnaparaju/stemming-in-polyglot-2672a349e15)
- [Working with the Atlas Pharo-Python Bridge](https://medium.com/@nikhilpinnaparaju/working-with-the-atlas-pharo-python-bridge-1ad6ba356f7)
- [Polyglot for Large Corpora](https://medium.com/@nikhilpinnaparaju/polyglot-for-large-corpora-71267c525876)
- [Introducing Polyglot](https://link.medium.com/XrrMmBsfPX)
- [Tokenization  — GSoC with Pharo Consortium](https://link.medium.com/YlaK5QtfPX)
- [Community Bonding Period — GSoC with Pharo Consortium](https://link.medium.com/WyjlwqwfPX)
- [Architecture Design For an NLP Library](https://link.medium.com/Az8fikxfPX)
- [PCA in Pharo using PolyMath, DataFrame and Roassal](https://link.medium.com/qcRTM0yfPX)
- [My Journey Into Google Summer of Code — 2019](https://link.medium.com/PZ6Zd4zfPX)

### Booklets

- [The Polyglot Booklet](https://github.com/SquareBracketAssociates/Booklet-Polyglot)
- [Documentation for Polyglot](https://github.com/nikhilpinnaparaju/Polyglot-Documentation)

## Project Demonstration/Presentation
- [Polyglot ESUG Presention V1.0](https://drive.google.com/file/d/18J2bgdrJ6Dhbaxg1-N3hC8-ZD7y0P9yp/view?usp=sharing)
- [Polyglot ESUG Presention V2.0](https://drive.google.com/file/d/1PgNS1xpwos1txeclhbzFfVlbrbs54pGs/view?usp=sharing)

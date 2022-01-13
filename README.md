
<!-- README.md is generated from README.Rmd. Please edit that file -->

# FastTrack-Workshop

<!-- badges: start -->
<!-- badges: end -->

# Welcome to the FastTrack Workshop repository!

This is the repository for the workshop on using FastTrack for the
Phonetics lab meeting on 1st February, 2022.

# Overview

Fast Track is a (nearly) automated formant tracking tool that enables
you to extract the formant contours quickly and easily. The tool
functions based on a number of praat scripts and as a plug-in in Praat,
so there is no need for you to code anything. There is also room for
customising the scripts to make more individualised tool. Fast Track is
developed by Santiago Barreda at UC Davies and more information can be
found here: <https://github.com/santiagobarreda/FastTrack>

Also, the following paper explains the tool in more details:

[Barreda, S. (2021). Fast Track: fast (nearly) automatic
formant-tracking using Praat. Linguistics Vanguard, 7(1), 20200051.
https://doi.org/10.1515/lingvan-2020-0051](https://www.degruyter.com/document/doi/10.1515/lingvan-2020-0051/html)

# Preliminaries: About the workshop

## Aims and objectives

After the workshop, you will be able to perform formant extraction on
already segmented sound files.

## What will be covered

In the workshop, I will explain and demonstrate the following things:

1.  **Functions** - what can we do with Fast Track?
2.  **Output** - what information does it provide us?
3.  **Extracting vowels** - what is an efficient way to extract vowels
    and create an audio file for each of them for formant analysis?
4.  **Folder structure** - what do we need to do to get the automatic
    formant tracking to work?

Time permitting, I will also try to show:

5.  **Tidying the Fast Track Output in R** - how do we tidy up the Fast
    Track output into a clean data using tidyverse?
6.  **Visualisation in R** - This is the most exciting phase!
7.  **Some tips for optimal formant analysis (e.g. adjusting formant
    thresholds, analysing liquids)**

## What will not be covered

For reasons of time and my lack of knowledge, the following will not be
covered:

1.  Segmenting audio files into phonemes using [Montreal Forced
    Aligner](https://montreal-forced-aligner.readthedocs.io/en/latest/) -
    You need audio files and acoomanying Praat TextGrids that contain a
    tier with phonemically segmented intervals and I find it useful to
    use Montreal Forced Aligner (MFA) to prepare the files. However,
    explaining how to use MFA is well beyond the scope of the workshop.
    Eleanor Chodroff recently held a workshop on using MFA at Rutgers
    University and the video can be found
    [here](https://www.youtube.com/watch?v=Zhj-ccMDj_w&t=531s). She also
    develops [a comprehensive user manual for
    MFA](https://eleanorchodroff.com/tutorial/montreal-forced-aligner-v2.html).
2.  Installation of the tool - A detailed step-by-step guide is
    available in Santiago’s website above with some video
    illlustrations. See the
    [wiki](https://github.com/santiagobarreda/FastTrack/wiki) on his
    website for the turorial on installation (and many other things!)
3.  Computations behind the operations - I tried to understand it but
    there is still a long way to grasp it fully.

## About the speech data

For demonstration, I’m going to use recordings of the well-known passage
“The North Wind and the Sun” that are publicly available in [the ALLSTAR
Corpus](https://groups.linguistics.northwestern.edu/speech_comm_group/allsstar2/#!/).
The ALLSTAR Corpus, an acronym for **A**rchive of **L**1 and **L**2
**S**cripted and Spontaneous **T**ranscripts **A**nd **R**ecordings,
contains a number of spontaneous and scripted speech that were produced
by English speakers from different language backgrounds.

# Disentangling the Fast Track output (Aggreagate\_data.csv)

<https://github.com/santiagobarreda/FastTrack/wiki/Aggregate-data>

![image H =
100](https://user-images.githubusercontent.com/73927499/148821906-c487863c-d16a-498d-9277-fff0cb729208.png)

# References

Bradlow, A. R. (n.d.) ALLSSTAR: Archive of L1 and L2 Scripted and
Spontaneous Transcripts And Recordings. Retrieved from
<https://oscaar3.ling.northwestern.edu/ALLSSTARcentral/#!/recordings>.

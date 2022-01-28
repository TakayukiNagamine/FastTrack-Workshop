
<!-- README.md is generated from README.Rmd. Please edit that file -->

# FastTrack-Workshop

<!-- badges: start -->
<!-- badges: end -->
<!-- README.md is generated from README.Rmd. Please edit that file -->

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

Also, the following paper explains the tool in more detail:

[Barreda, S. (2021). Fast Track: fast (nearly) automatic
formant-tracking using Praat. Linguistics Vanguard, 7(1), 20200051.
https://doi.org/10.1515/lingvan-2020-0051](https://www.degruyter.com/document/doi/10.1515/lingvan-2020-0051/html)

# Preliminaries: About the workshop

In the workshop, I will explain and demonstrate the following things:

1.  **The fun bit**: Extracting formant frequency using pre-clipped
    vowel tokens
2.  **Another fun bit**: Plotting vowels using R
3.  **Slightly tedious bit**: Structuring folders properly to extract
    formant frequencies and clip out vowels

If you would like to follow along, you can install FastTrack beforehand.
A detailed step-by-step guide is available in [Santiago’s Github
repository](https://github.com/santiagobarreda/FastTrack) with some
video illustrations. See the
[wiki](https://github.com/santiagobarreda/FastTrack/wiki) on his Github
repository for the tutorial on installation (and many other things!)

The data I use in the demonstration are stored in the ‘zip’ folder in my
Github repository, where you can find a few zip files. Each corresponds
to different stages I plan to go through during the demonstration:

-   **NWS.zip**: The NWS recording audio files and accompanying
    textgrids stored in one file. Quite a normal way of storing audio
    files and textgrids I guess.
-   **NWS\_vowel\_extraction.zip**: Similar to the ‘NWS.zip’ file but,
    once you develop it, you can find the audio and textgrid files
    stored in separate folders. This is the folder structure required to
    extract vowels.
-   **NWS\_formant\_estimation.zip**: The folder contains the product of
    the vowel extraction. Therefore, each sound file corresponds to a
    vowel and is stored in the ‘sounds’ folder. There are also two csv
    files that are helpful for tidying up the data afterwards.

<!--
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

3.  Computations behind the operations - I tried to understand it but
    there is still a long way to grasp it fully.

--->

## About the speech data

For demonstration, I’m going to use recordings of the well-known passage
“The North Wind and the Sun” that are publicly available in [the ALLSTAR
Corpus](https://groups.linguistics.northwestern.edu/speech_comm_group/allsstar2/#!/).
The ALLSTAR Corpus contains a number of spontaneous and scripted speech
that were produced by English speakers from different language
backgrounds.

# The fun bit: Tracking a folder that contains clipped vowels

The highlight of using FastTrack is that it enables you to extract
formant frequencies from multiple files automatically. So, skipping all
the preparation, here is one thing that you can expect from FastTrack:

-   FastTrack does a lot of regressions and chooses the best analysis
    out of multiple candidates automatically. It can also return images
    of all candidates and the winners for visual inspection.

-   It estimates the formant frequencies at the multiple time points
    throughout the vowel duration.

-   The output is a csv file summarising the analysis, which can then be
    imported into R for tidy up, visualisation, statistics, etc.

Demonstration:

1.  Download **NWS\_formant\_estimation.zip** and save it somewhere on
    your computer.

2.  Open Praat and throw a random file in the object window. This will
    trigger the FastTrack functions to appear in the menu section.

3.  Select **Track folder..**.

4.  Specify the path to **NWS\_formant\_estimation.zip** in the “Folder”
    section. You can also adjust some other functions if prefer. For
    more details, please consult Sandiego’s Github page

<p align="center">
<img src="https://github.com/TakayukiNagamine/FastTrack-Workshop/blob/baefed6e4a16e2d3b4d24cc280743bee8c3f4dfe/images/trackfolder01.png" width = 50%>
</p>
<p align="center">
<img src="https://github.com/TakayukiNagamine/FastTrack-Workshop/blob/6a5ab4e82ad7ef17021eb3fa7fbfae4262c8bc7d/images/071_F_ENG_0025_comparison.png" width = 50%>
</p>

This operation yields quite a few output files, for which we don’t have
enough time to look through all. The results of the formant estimation
can be found as **aggregate\_data.csv** in **processed\_data** folder.
Here is the glimpse of it:

<p align="center">
<img src="https://github.com/TakayukiNagamine/FastTrack-Workshop/blob/51f898dc45415f4d5f22719334d37dc2e7d62cb1/images/aggregate_data.png" width = 100%>
</p>

# Another fun bit: Plotting vowels using R

I think FastTrack becomes even more powerful if combined with R. This,
however, requires you to figure out how to tidy up the data for a more
R-friendly data frame. If interested, you can look at my R code
(**FastTrack.R**) to tidy up the data, which I wrote based on Sam’s
script for the same purpose.

Below is my attempt to visualise vowels of nonnative English speakers
from the Asian countries (Asian Englishes speakers).

# Slightly tedious bit: Structuring folders properly to extract formant frequencies and clip out vowels

OK, we have seen that FastTrack is a very powerful tool in automatic
formant estimation for a bulk of vowels and then R could also be used to
play around with the data. Formant estimation requires each audio file
to contain vocalic components throughout the duration, which means that
we need to clip out every vowel token from the recording. Thankfully,
FastTrack is also ready to do this for us.

If you wish to follow along, the following instructions should work:

1.  Download **NWS\_vowel\_extraction.zip** and save it somewhere on
    your computer. Again, I have already made the structure optimal for
    the vowel extraction.

2.  Open Praat and throw a random file in the object window. This will
    trigger the FastTrack functions to appear in the menu section.

3.  Select **Tools…**, then **Extract vowels with TextGrids**.

4.  Specify the following:

    -   **Sound folder**: Path to the “sounds” folder containing .wav
        files.
    -   **TextGrid folder**: Path to the “textgrids” folder containing
        .TextGrid files.
    -   **Output folder**: Path to the folder where you wish to save the
        outputs. You could specify an existing location or create one by
        typing it there.
    -   **Which tier contains segmentation information?**: Specify the
        tier in which phonemic transcription/segmentation has been
        performed. In the current example, the segmentation is done in
        Tier 2 so type 2.
    -   **Which tier contains word information?**: Specify the tier with
        words. Type 1 in this case.
    -   **Is stress marked on vowels?**: Tick the box if you wish to
        take stress into account. If you use forced alignment to segment
        the speech, stress is marked alongside each vowel. For example,
        you will find “AE1”, which means a TRAP vowel that bears the
        primary stress, or “AE2” the secondary stress, etc.

# References

Bradlow, A. R. (n.d.) ALLSSTAR: Archive of L1 and L2 Scripted and
Spontaneous Transcripts And Recordings. Retrieved from
<https://oscaar3.ling.northwestern.edu/ALLSSTARcentral/#!/recordings>.

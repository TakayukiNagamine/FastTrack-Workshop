# Welcome to the FastTrack Workshop repo!
This is the repository for the workshop on using FastTrack for the Phonetics lab meeting on 1st February, 2022. 

# Overview
Fast Track is (nearly) automated formant tracking tool that enables you to extract the formant contours quickly and easily. The tool functions based on a number of praat scripts and as a plug-in in Praat, so there is no need for you to code anything. There is also room for customising the scripts to make more individualised tool. Fast Track is developed by Santiago Barreda at UC Davies and more information can be found here: https://github.com/santiagobarreda/FastTrack

Also, the following paper explains the tool in more details:

[Barreda, S. (2021). Fast Track: fast (nearly) automatic formant-tracking using Praat. Linguistics Vanguard, 7(1), 20200051. https://doi.org/10.1515/lingvan-2020-0051](https://www.degruyter.com/document/doi/10.1515/lingvan-2020-0051/html)

# Preliminaries: About the workshop
## Aims and objectives
After the workshop, you will be able to perform formant extraction on already segmented sound files.

## What will be covered
In the workshop, I will explain and demonstrate the following things:

1. **Functions** - what can we do with Fast Track?
2. **Output** - what information does it provide us?
3. **Extracting Vowels** - what is an efficient way to extract vowels for formant analysis?
4. **Folder Structure** - what do we need to do to get the automatic formant tracking to work?

Time permitting, I will also try to show:

5. **Tidying the Fast Track Output in R**
6. **Visualisation in R**
7. **Some tips for optimal formant analysis (e.g. adjusting formant thresholds, analysing liquids)**

## What will not be covered
For reasons of time and my lack of knowledge, the following will not be covered:

1. Segmenting audio files into phonemes using [Montreal Forced Aligner](https://montreal-forced-aligner.readthedocs.io/en/latest/) - You need audio files and acoomanying Praat TextGrids that contain a tier with phonemically segmented intervals and I find it useful to use Montreal Forced Aligner (MFA) to prepare the files. However, explaining how to use MFA is well beyond the scope of the workshop. Eleanor Chodroff recently held a workshop on using MFA at Rutgers University and the video can be found [here](https://www.youtube.com/watch?v=Zhj-ccMDj_w&t=531s). She also develops [a comprehensive user manual for MFA](https://eleanorchodroff.com/tutorial/montreal-forced-aligner-v2.html).
3. Installation of the tool - A detailed step-by-step guide is available in Santiago's website above with some video illlustrations. See the [wiki](https://github.com/santiagobarreda/FastTrack/wiki) on his website for the turorial on installation (and many other things!)
4. Computations behind the operations - I tried to understand it but there is still a long way to grasp it fully.




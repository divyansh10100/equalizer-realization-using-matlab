# equalizer-realization-using-matlab
This project involves designing and implementing an audio equalizer using MATLAB. An audio equalizer is a tool used to adjust the balance of different frequency components in an audio signal.

## About the code
This is a MATLAB script for implementing digital signal processing (DSP) filters on an audio file. The script loads a pre-defined set of filters from a file, prompts the user to select an audio file, and then applies the selected filters to the audio data. The user can choose the gain for each frequency band and the type of filter (either IIR or FIR).

The script uses the filter() function to apply each filter to the input audio data. It then multiplies the filtered data by the gain specified by the user for each band. Finally, the script sums the results of all filters to produce the final output.

The script also calls a function called analyseFilter() to analyze and plot the frequency spectrum of each filtered output. This function uses the MATLAB fft() function to calculate the frequency spectrum and then plots the result using MATLAB's built-in plot() function.

To use this script, you need to have MATLAB installed on your computer, and the filters used in the script must be stored in a separate file called "filters.mat" in the same directory as the script. You also need to have an audio file in the .wav format that you want to filter. When you run the script, it will prompt you to select the audio file and enter the gain for each frequency band.
### Usage
[Screencast from 2023-03-15 01-58-03.webm](https://user-images.githubusercontent.com/77502911/225208796-3c9de521-8c71-4898-bb99-934edd629a0d.webm)

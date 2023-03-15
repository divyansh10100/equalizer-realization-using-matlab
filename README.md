# equalizer-realization-using-matlab
![Screenshot from 2023-03-15 10-51-58](https://user-images.githubusercontent.com/77502911/225214958-30a9d21d-fe06-4af6-9fe8-c631515ad141.png)



This project involves designing and implementing an audio equalizer using MATLAB. An audio equalizer is a tool used to adjust the balance of different frequency components in an audio signal.

## Introduction
Audio equalization is the process of adjusting the balance between frequency components within an audio signal. The purpose of equalization is to make an audio signal sound better, more clear, and more balanced. In this project, we will implement an audio equalizer using MATLAB. We will use MATLAB's digital signal processing toolbox to implement various filter designs, such as low-pass, high-pass, and band-pass filters, to shape the frequency response of the audio signal.

## Theory
Audio equalizers work by manipulating the frequency response of an audio signal. A frequency response curve shows how much of each frequency in an audio signal is present after processing. The frequency response curve is typically displayed using a graph that shows the amplitude (loudness) of each frequency component in the audio signal.

The goal of an audio equalizer is to modify the frequency response curve to achieve a desired sound. This is accomplished by applying filters to the audio signal. Filters are designed to allow or block certain frequency components of an audio signal. A low-pass filter, for example, will allow low-frequency components to pass through while blocking high-frequency components. Similarly, a high-pass filter will allow high-frequency components to pass through while blocking low-frequency components.

In audio equalization, a common approach is to use a parametric equalizer, which consists of several band-pass filters that can be adjusted to target specific frequency ranges. Each band-pass filter has a center frequency, bandwidth, and gain. The center frequency specifies the frequency at which the filter has its maximum effect. The bandwidth specifies how wide the range of frequencies affected by the filter is. The gain specifies how much the filter amplifies or attenuates the frequency components within the bandwidth.

In summary, audio equalization involves manipulating the frequency response curve of an audio signal by applying filters that allow or block certain frequency components. A parametric equalizer uses several band-pass filters that can be adjusted to target specific frequency ranges.

### FIR Filters
FIR filters are digital filters that use a finite number of coefficients to create a convolution sum. The coefficients determine the impulse response of the filter, which is the output when a unit impulse is applied to the input. The filter output is obtained by convolving the input signal with the impulse response.

FIR filters have several advantages over IIR filters, including stability, linear phase response, and the ability to achieve a sharp cutoff frequency. They are also easy to design and implement. FIR filters are widely used in audio and image processing applications, where a linear phase response is essential to preserve the signal's time-domain characteristics.

### IIR Filters
IIR filters, on the other hand, use feedback in their design and have an infinite impulse response. The feedback loop in the filter allows it to have a smaller number of coefficients compared to FIR filters, making them computationally efficient. The impulse response of an IIR filter is infinite, but the magnitude of the impulse response decreases exponentially as time goes on.

IIR filters are commonly used in applications where low computational resources are available, such as embedded systems. However, they can be unstable and exhibit nonlinear phase response, which can distort the output signal. IIR filters are used in applications such as speech and image processing, where phase distortion is acceptable.

### FFT
Fast Fourier Transform (FFT) is a widely used algorithm for signal processing that allows us to efficiently compute the Discrete Fourier Transform (DFT) of a signal. The DFT is a mathematical tool used to convert a signal from the time domain to the frequency domain. It is a fundamental concept in signal processing, as many signals of interest, such as audio and video signals, are analyzed in the frequency domain.

The FFT algorithm was first described by Cooley and Tukey in 1965, and it is based on the idea of decimation in time. The algorithm reduces the number of computations required to compute the DFT from O(N^2) to O(N log N), where N is the number of samples in the input signal. This makes it possible to compute the DFT in real-time, even for large signals.

The FFT algorithm is implemented in many programming languages, including MATLAB. In MATLAB, the fft function is used to compute the FFT of a signal. The function takes a time-domain signal as input and returns the corresponding frequency-domain signal. The output is a complex vector containing the amplitudes and phases of the signal's frequency components.

### Sampling
Sampling is the process of converting a continuous-time signal into a discrete-time signal by taking samples at regular intervals. The purpose of sampling is to enable the processing and transmission of signals using digital techniques.

In practical systems, signals are often sampled at a rate that is higher than the minimum required by the Nyquist-Shannon sampling theorem. This is to ensure that the signal is accurately represented in the digital domain, and to provide some margin of error for the effects of quantization and noise. The rate at which a signal is sampled is known as the sampling rate, and is usually expressed in units of samples per second (Hz).

The Nyquist-Shannon sampling theorem states that in order to accurately reconstruct a continuous-time signal from its discrete-time samples, the sampling rate must be at least twice the highest frequency present in the original signal. This is known as the Nyquist rate. Sampling at a rate lower than the Nyquist rate results in aliasing, which is the folding of higher frequencies into lower frequencies in the sampled signal.

## About the code
This is a MATLAB script for implementing digital signal processing (DSP) filters on an audio file. The script loads a pre-defined set of filters from a file, prompts the user to select an audio file, and then applies the selected filters to the audio data. The user can choose the gain for each frequency band and the type of filter (either IIR or FIR).

The script uses the filter() function to apply each filter to the input audio data. It then multiplies the filtered data by the gain specified by the user for each band. Finally, the script sums the results of all filters to produce the final output.

The script also calls a function called analyseFilter() to analyze and plot the frequency spectrum of each filtered output. This function uses the MATLAB fft() function to calculate the frequency spectrum and then plots the result using MATLAB's built-in plot() function.

To use this script, you need to have MATLAB installed on your computer, and the filters used in the script must be stored in a separate file called "filters.mat" in the same directory as the script. You also need to have an audio file in the .wav format that you want to filter. When you run the script, it will prompt you to select the audio file and enter the gain for each frequency band.
### Usage
[Screencast from 2023-03-15 01-58-03.webm](https://user-images.githubusercontent.com/77502911/225208796-3c9de521-8c71-4898-bb99-934edd629a0d.webm)


### How to use in your PC

This project implements an audio equalizer using MATLAB, which can be used to modify the gain of various frequency bands in an audio signal. The equalizer consists of several filters, each with its own frequency response characteristics. The user can select the type of filter, gain for each frequency band, and output sampling rate.

*Prerequisites*

> MATLAB 2018b or later
> An audio file in .wav format

### Getting Started
> Clone the repository:

`git clone https://github.com/divyansh10100/equalizer-realization-using-matlab.git`

> Load the filters into the workspace by navigating to the project location and running:

`load('filters.mat')`

> Launch the application by running app.m in MATLAB.

> Choose the type of filter to be used (IIR or FIR) and enter the gain for each frequency band.

> Select the input audio file by clicking the "Open" button and choosing  .wav file.

> Enter the output sampling rate.

## Features
- Choice of IIR or FIR filter implementation.
- Gain control for nine frequency bands ranging from 0 to 16 kHz.
- Preview of each filter's effect on the input signal.
- Output signal at user-specified sampling rate.

### Sample Audio file

https://user-images.githubusercontent.com/77502911/225213128-31ec8838-19ec-486a-94fa-01e43e98e073.mp4

### Generated audio with IIR filter

https://user-images.githubusercontent.com/77502911/225213399-f4c11764-09ef-4385-9a61-8493cb38fb09.mp4

### Generated audio with FIR filter

https://user-images.githubusercontent.com/77502911/225213477-70d99f2e-704a-440a-b978-70fd71db4010.mp4

## Plots









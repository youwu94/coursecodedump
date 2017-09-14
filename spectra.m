function [H,fvec,df1]=spectra(input,Fs,df);

ts=1/Fs;

[H,m,df1]=fseq(input,ts,df);

fvec=[0:df1:df1*(length(m)-1)]-Fs/2;
H=H/Fs;

function [M,m,df]=fseq(m,ts,df) 
%       [M,m,df]=fftseq(m,ts,df)
%       [M,m,df]=fftseq(m,ts)
%FFTSEQ     generates M, the FFT of the sequence m.
%       The sequence is zero padded to meet the required frequency resolution df.
%       ts is the sampling interval. The output df is the final frequency resolution.
%       Output m is the zero padded version of input m. M is the FFT.
fs=1/ts;
if nargin == 2
  n1=0;
else
  n1=fs/df;
end
n2=length(m);
n=2^(max(nextpow2(n1),nextpow2(n2)));
M=fft(m,n);
m=[m,zeros(1,n-n2)];
df=fs/n;
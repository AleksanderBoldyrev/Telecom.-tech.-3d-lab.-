Fn = 25;
Fd = Fn * 100;
Td = 1/Fd;
t = 0:Td:0.4;
signal = cos(2*pi*Fn.*t);

figure;
plot(t,signal);

Fn2 = 200;
signal = signal + cos(2*pi*Fn2.*t);
signal_f = fft(signal);

figure;
plot(t,signal);
figure;
plot(1./t,abs(signal_f)), axis ([0 500 0 600]);

[b, a] = butter (4, Fn*2/Fd);
y_signal = filter (b, a, signal);
y_signal_f = fft(y_signal);

figure;
plot(t, y_signal);
figure;
plot(1./t, abs(y_signal_f));
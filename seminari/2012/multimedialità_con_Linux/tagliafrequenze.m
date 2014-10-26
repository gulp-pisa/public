% Simple audio processing in Octave

function tagliafrequenze (infile, outfile, low_cut, high_cut)

    % Apre il file "infile" e scrive "outfile", passando solo le frequenze che
    % stanno tra low_cut e high_cut. low_cut e high_cut sono espressi come
    % numeri normalizzati tra 0.0 e 1.0.
    %
    % I file in entrata e uscita sono WAV mono.

    [samples, samplerate, bits] = wavread (infile);
    wavwrite (cut (samples, low_cut, high_cut), samplerate, bits, outfile);

endfunction

function mask = gen_mask (n, low_cut, high_cut)

    halflen = ceil(n/2);
    halfmask = zeros(halflen, 1);
    halfmask(floor(halflen * low_cut)+1 : floor(halflen * high_cut), 1) = 1;
    mask = zeros(n, 1);
    mask(1:halflen) = halfmask;
    mask(n:-1:n-halflen+1) = halfmask;

endfunction

function new_samples = cut (samples, low_cut, high_cut)

    % Numero di sample
    n = max (size (samples));
    
    % Trasformata di fourier
    ft = fft (samples);
    
    % Maschera per azzerare un po' di valori all'inizio e alla fine.
    mask = gen_mask (n, low_cut, high_cut);
    trunc = ft .* mask;
    
    % Salviamo e normalizziamo per compensare la perdita di norma :)
    new_samples = ifft (trunc);
    normalizer = norm (samples, 2) / norm (new_samples, 2);
    new_samples *= normalizer;

endfunction

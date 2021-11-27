function Pw_average = Pw_average(Tp, Hs)
    % Receives a list of peak periods (Tp) and significant heights (Hs),
    % compute the average wave power per unit length

    p = 1025; % seawater density, in kg/m^3
    g = 9.81; % gravitational accelaration o earth's surface, in m/s^2

    % Multiplying factor for every computed Pw (wave power per unit crest length)
    Pw_multiplying_factor = p * (g^2) / (64 * pi);

    # Te is the energetic periods for a JONSWAP peak enhancement of 𝛾 = 3.3
    Te = Tp .* 0.9; Hs_squared = Hs.^2;
    Pw_sum = sum(Pw_multiplying_factor .* Hs_squared .* Te); N = length(Te);
    Pw_average = Pw_sum / N;
    disp(Pw_average);
endfunction

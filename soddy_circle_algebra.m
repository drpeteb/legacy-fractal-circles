%%

syms e e1 e2 e3 h ha hb hc

%%

sol = solve('e1^2=h*ha+ha*hb+hb*h',...
            'e2^2=h*ha+ha*hc+hc*h',...
            'e3^2=h*hb+hb*hc+hc*h',...
            'ha', 'hb', 'hc');

ha = sol.ha(1);
hb = sol.hb(1);
hc = sol.hc(1);

e = ha*hb+hb*hc+hc*ha;

pretty(simple(e))

%%

sol = solve('h^2=e1*e2+e2*e3+e3*e1',...
            'e^2=e1^2+e3^2+e3^2-2*sqrt((h^2+e1^2)*(h^2+e2^2)*(h^2+e3^2))*(1/(h^2+e1^2)+1/(h^2+e2^2)+1/(h^2+e3^2))',...
            'e','h');

pretty(simple(sol.e(1)));

%%
hsq = e1*e2+e2*e3+e3*e1;
% (hsq+e1^2)*(hsq+e2^2)*(hsq+e3^2)
% (1/(hsq+e1^2)+1/(hsq+e2^2)+1/(hsq+e3^2))*hsq
(1/((hsq+e1^2)*(hsq+e2^2))+1/((hsq+e2^2)*(hsq+e3^2))+1/((hsq+e3^2)*(hsq+e1^2)))*(e1+e2)^2*(e2+e3)^2*(e3+e1)^2

%%

sol = solve('e1^2=h*ha+ha*hb+hb*h',...
            'e2^2=h*ha+ha*hc+hc*h',...
            'e3^2=h*hb+hb*hc+hc*h',...
            'ha', 'hb', 'hc');

ha = sol.ha(1);
hb = sol.hb(1);
hc = sol.hc(1);

e = ha*hb+hb*hc+hc*ha;

pretty(simple(e))

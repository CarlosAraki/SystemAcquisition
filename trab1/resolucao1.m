%% resolução - Pad Carlos Araki
clc
clear all
close all
%%1- 
%forma recursiva
%funcao [valor] = fibo(n)
%     if(n<2)
%         valor = n;
%     else
%         valor = fibo(n-1)+fib(n-2);
%     end
% end

%forma iterativa

%valor de pontos
 n = 15;
 i = 0;
 j = 1;
 valor = 0;
 razao = 0;
 for k = 1:n
     valor = i+j;
     i = j;
     razao = valor/j;
     j = valor;
 end
 valor
 razao
 razao_comparacao = (1+sqrt(5))/2
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 %%2-
 clear
 dt = .01;
 min = 0;
 max = 2;
 f1 = 5;
 f2 = 45;
 
 n = min:dt:max;
 
 x  = cos(2*pi*f1.*n)+cos(2*pi*f2.*n);
 figure()
 plot(n,x)
 title('Sinal X[n]')
 xlabel('tempo[s]')
 ylabel('Amplitude')
 
 %2a -
 %nao é necessária correçao de eixos mas importante saber que houve uma
 %conversão do tempo para frequência
 
 figure()
 plot(abs(fft(x)))
 title('FFT de x[n]')
 xlabel('pontos')
 ylabel('Amplitude')
 
 %2b -
 z = tf('z');
 H = z/(z+.7);
 y = lsim(H,x,n);
 
 %2c - %passa alta
 figure()
 subplot(2,1,1)
 plot(n,y)
 title('Sinal Y1[n]')
 xlabel('tempo[s]')
 ylabel('Amplitude')
 subplot(2,1,2)
 plot(abs(fft(y)))
 title('FFT de x[n]')
 xlabel('pontos')
 ylabel('Amplitude')
 
 %2d - 
 H = z/(z-.7);
 y = lsim(H,x,n);
 
 %2e - %passa baixa
 figure()
 subplot(2,1,1)
 plot(n,y)
 title('Sinal Y2[n]')
 xlabel('tempo[s]')
 ylabel('Amplitude')
 subplot(2,1,2)
 plot(abs(fft(y)))
 title('FFT de x[n]')
 xlabel('pontos')
 ylabel('Amplitude')
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 %3 - 
 %tem um bloco no simulink que simula ruido branco, o comando noise também
 %faz isso
 
 %3a -
 clear 
 
 for i = 1:1024
    w(i)=randn(); 
 end
 
 %3b - 
 %Ruído branco atua em todas as faixas de frequência mas como passa por um
 %passa alta só as freq altas passam
 
 figure()
 plot(w)
 
 z = tf('z');
 H = z/(z+.7);
 y = lsim(H,w);
 figure()
 plot(abs(fft(y)))
 
 
 
 %4a -
 clear
 syms z;
 %H1 = z² + 2z +z / z² - 3/4 z +1/2 
 [R,P,K] = residue([1 2 1],[1 -(3/4) (1/2)])
 %resposta = u(-n) - ((-25 i (1/8 (3 - i sqrt(23)))^n + sqrt(23) (1/8 (3 - i sqrt(23)))^n + 25 i (1/8 (3 + i sqrt(23)))^n + sqrt(23) (1/8 (3 + i sqrt(23)))^n) (1 - u(-n)))/(2 sqrt(23))
 
 
 %H2 = z / (z- 1/4)(z+ 1/2)
 
 [R2,P2,K2] = residue([1],[1 .25 -.125])
 
 F2 = ((R2(1)*z)/(z - P2(1))) + ((R2(2)*z)/(z - P2(2))) 
 iztrans(F2)
 
 
%clear all
%PPW1={}
t=tnb1;
ppw2_1=zeros(length(w2_1),32)
clear mask
%ppw1=zeros(len)
for i=1:32
    figure
    y=w2_1(:,i);
    subplot(3,1,1)
    plot(t,y);
   
    dtx=1/freq;
    L=length(y);
    
    Y = fft(y);
    f = freq*(0:(L/2))/L;
    fo= freq*(0:L-1)/L;
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1)
    
    subplot(3,1,2);
    plot(f,P1); 
  
    xlabel('f (Hz)')
    ylabel('|P1(f)|')
  
  
    subplot(3,1,3);
    plot(fo,P2);
    
    %%%%%%%%%%%%%%%%%%%%%
    figure;
    mn = min(y); mx = max(y);

     % Initialise. The starting point for the reconstruction is the 
     % "zero-frequency" or constant component held in X(1).
    
      reconstruction = Y(1)/L;
      p = 2*pi*(0:L-1)/L;

      for k = 1:L/2
           % Compute the component for the frequency that gives k cycles in the
           % width of the image.
             a = Y(k+1);    % complex amplitude of this component
             phi = k*p;     % phase array
            % Take advantage of the symmetry that results from x being real to
            % ignore the top half of X. Must therefore double the intermediate
            % components.
            if k < L/2; s = 2; else s = 1; end

            % This is the core equation for the Fourier transform: a single
            % component is a harmonic (sin or cosine) wave
            component = s*(real(a)*cos(phi) - imag(a)*sin(phi))/L;

            % and add the component to the reconstruction so far
            reconstruction = reconstruction + component;

            % Plot the results, but not for every iteration
            if ismember(k, [1:7 8:16:63 64:32:L/2])
            subplot(2,1,1);
            plot(component);
            axis([1 length(y) mn mx]);
            title(['Spatial frequency ' num2str(k) ' cycles across the signal']);
            subplot(2,1,2);
            plot(t,reconstruction);
            %axis([mn mx]);
            title('Reconstruction so far');
            %pause;
            end

            % Show that we have reconstructed the original profile accurately from the
            % components
            length(y)
            length(reconstruction)
            error = max(abs(reconstruction - y'));
            fprintf('Maximum error in reconstruction is %g\n', error);
      end
    %%%%%%%%%%%%%%%%%%%%%
    cut=0
    for zj=1:length(f)
        f(zj)
        if f(zj)>45
            cut=zj
            break
        end
    end
    cut
    %cut
    %cut
    %cfreq = L/4; % Centre frequency in cycles/width of image
    figure
    
    mask(1:20)=0.0;
    mask(21:cut) = 1.0; %exp(-((f-cfreq)/(2*sigmaf)).^2);
    mask(cut+1:L/2+1)=0.0;
    mask(L:-1:L/2+2) = mask(2:L/2);
    subplot(3,1,1); plot(mask); title('Mid-pass mask');
    size(Y)
    size(mask')
    Xfilt = Y .* mask';
    subplot(3,1,2); plot(abs(Xfilt)); title('Weighted transform');
    xfilt = ifft(Xfilt);
    subplot(3,1,3); plot(xfilt); title('Mid-pass filtered signal');
    %close all
    %pause
    ppw2_1(:,i)=xfilt
    
end
%close all
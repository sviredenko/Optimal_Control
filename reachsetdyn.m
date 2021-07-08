function mov = reachsetdyn(alpha,t1,t2,N,filename)
    mov(1:N) = struct('cdata', [],'colormap', []);
    h=(t2-t1)/N;
     
    for i=1:N
        [X,Y]=reachset(alpha,t1+i*h);
       
        plot(X,Y,'k','LineWidth',1);
        hold on
        mov(i)=getframe();
    end
    vid=VideoWriter(filename);
    vid.FrameRate=1;
    open(vid);
    writeVideo(vid,mov);
    close(v)
end
        
       
    



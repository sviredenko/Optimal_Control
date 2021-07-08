%% 
alpha =1;
T=0.5;
t1=0.5;
t2=1;
N=100;
% [X,Y]=reachset(alpha,T);
%mov=reachsetdyn(alpha,t1,t2,N,'my_video');

[X,Y]=reachset(alpha,0.3);
hold on;
plot(X,Y,'k','LineWidth',1);
xlabel('x1');
ylabel('x2');
plot([X,X(1)],[Y,Y(1)],'k');


[X,Y]=reachset(alpha,0.5);
hold on;
plot(X,Y,'k','LineWidth',1);
xlabel('x1');
ylabel('x2');
plot([X,X(1)],[Y,Y(1)],'r');


[X,Y]=reachset(alpha,1);
hold on;
plot(X,Y,'k','LineWidth',1);
xlabel('x1');
ylabel('x2');
plot([X,X(1)],[Y,Y(1)],'g');


function [X_res,Y_res] = reachset(alpha,T)
    options1=odeset('Events',@(t,y)Event1(t,y,alpha),'RelTol',1e-3,'AbsTol',1e-3);
    options2=odeset('Events',@(t,y)Event2(t,y,alpha),'RelTol',1e-3,'AbsTol',1e-3);
    X=[];
    Y=[];
    delta_step=4;
    interval=[0,T];
    v0=[0;0];
    [t,y,te,ye,ie]=ode45(@(t,y)main_syst(t,y,alpha),interval,v0,options1)
    figure(1)
    
     X_new=[X,y(:,1)'];
     Y_new=[Y,y(:,2)'];
     clear X Y
     X=X_new;
     Y=Y_new;
     clear X_new Y_new
     
    plot(y(:,1),y(:,2),'ro');
    hold on
    for i=2:size(t)
        t_n=t(i);
        v0_n=[y(i,1);y(i,2);1;0]
        buf_alpha=-alpha;
        
        while(t_n<T)
             [t_2,y_2,te_n,ye_n,ie_n]=ode45(@(t,y)syst(t,y,buf_alpha),interval,v0_n,options2);
             
%              plot(y_2(:,1),y_2(:,2),'y');
             X_new=[X,y_2(:,1)'];
             Y_new=[Y,y_2(:,2)'];
             clear X Y
             X=X_new;
             Y=Y_new;
             clear X_new Y_new
             hold on
             t_n=t_2(end);
             v0_n=[y_2(end,1);y_2(end,2);-1*sign(buf_alpha);0];
             buf_alpha=-buf_alpha;
             clear t_2 y_2
              
        end
        
    end
 
    interval=[0,T];
   clear t y
   alpha=-alpha;
    [t,y,te,ye,ie]=ode45(@(t,y)main_syst(t,y,alpha),interval,v0,options1)
     figure(1)
     X_new=[X,y(:,1)'];
     Y_new=[Y,y(:,2)'];
     clear X Y
     X=X_new;
     Y=Y_new;
     clear X_new Y_new
    plot(y(:,1),y(:,2),'go');
     for i=2:size(t)
        t_n=t(i);
        v0_n=[y(i,1);y(i,2);1;0];
        buf_alpha=-alpha;
        
        while(t_n<T)
             [t_2,y_2,te_n,ye_n,ie_n]=ode45(@(t,y)syst(t,y,buf_alpha),interval,v0_n,options2);
%              plot(y_2(:,1),y_2(:,2),'y');
             X_new=[X,y_2(:,1)'];
             Y_new=[Y,y_2(:,2)'];
             clear X Y
             X=X_new;
             Y=Y_new;
             clear X_new Y_new
             t_n=t_2(end);
             v0_n=[y_2(end,1);y_2(end,2);-1*sign(buf_alpha);0];
             buf_alpha=-buf_alpha;
             clear t_2 y_2
              
        end
        
     end
     j = boundary(X',Y');
     X_res=X(j);
     Y_res=Y(j);

end


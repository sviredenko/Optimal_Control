function dy = diff(t,y,alpha)
    dy=ones(2,1);
    dy(1)=y(2);
    dy(2)=alpha-y(2)+2*y(1)+y(1)*sin(y(1)^2)-2*y(1)*y(1)*cos(y(1));
end


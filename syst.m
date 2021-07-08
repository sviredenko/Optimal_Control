function dy = diff(t,y,alpha)
dy=ones(4,1);
dy(1)=y(2);
dy(2)=alpha-y(2)+2*y(1)+y(1)*sin(y(1)^2)-2*y(1)*y(1)*cos(y(1));
dy(3)=-2*y(4)-y(4)*sin(y(1)^2)-2*y(4)*y(1)^2*cos(y(1)^2)+4*y(4)*y(1)*cos(y(1))-2*y(4)*y(1)^2*sin(y(1));
dy(4)=-y(3)+y(4);
end


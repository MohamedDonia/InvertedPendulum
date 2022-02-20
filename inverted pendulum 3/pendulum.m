function []=pendulum(l,time,position,angle1,angle2, angle3)  %cart(pendulum length,time vector,position vector,angle vector)
  % general figure configuration 
%   close all;
% figure('Renderer','zbuffer','PaperType','A3');
% axis tight manual
% set(gca,'NextPlot','replaceChildren');
% % ved= VideoWriter('Inverted Pendulum');
% ved.Quality=100;
% ved.FrameRate=10;
% open(ved);
  cart=figure('color','white');
  ax = axes('Parent', cart);
  hold(ax, 'on');
  axis(ax, 'equal');
  axis(ax,[-5 5 -5 5]);
  title(ax, 'double Pendulum Plotting', 'Color', [.6 0 0],'LineWidth',4);
   %plotting opjects 
  line([-3 3], [0 0], 'color', [0 0 0], 'LineWidth', 2, 'Parent', ax);
  body_y = [.05 .25 .25 .05];
  wheel1_y = .025;
  wheel2_y = .025;
  for i=1:length(time)
     body_x = [position(i)-.2 position(i)-.2 position(i)+.2 position(i)+.2];
     wheel1_x = position(i)-.15;
     wheel2_x = position(i)+.15;
     % pendulum (1) co-ordinates ::
     xp1 = position(i) + l*sin(angle1(i));
     yp1 = .16 + l*cos(angle1(i));
     lh_x = [position(i) xp1];
     lh_y = [.16 yp1];
     % pendulum (2) co_ordinates ::
     xp2=xp1+l*sin(angle2(i));
     yp2=yp1+l*cos(angle2(i));
     l2_x=[xp1 xp2];
     l2_y=[yp1 yp2];
     
     % pendulum (3) co_ordinates ::
     xp3=xp2+l*sin(angle3(i));
     yp3=yp2+l*cos(angle3(i));
     l3_x=[xp2 xp3];
     l3_y=[yp2 yp3];
     if i == 1
       body = fill(body_x, body_y , 'r');
       wheel1 = plot(wheel1_x, wheel1_y, 'o', 'MarkerFaceColor', 'g',...
                                   'MarkerSize',10);
       wheel2 = plot(wheel2_x, wheel2_y, 'o', 'MarkerFaceColor', 'g',...
                                   'MarkerSize', 10);
       link1 = line( lh_x, lh_y, 'color', [0 1 0], 'LineWidth', 3);
       point1 = plot(xp1, yp1, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 12);
       link2 = line( l2_x, l2_y, 'color', [0 0 1], 'LineWidth', 3);
       point2 = plot(xp2, yp2, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 12);
       link3 = line( l3_x, l3_y, 'color', [0 0 1], 'LineWidth', 3);
       point3 = plot(xp3, yp3, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 12);
     else
       set(body, 'Vertices', [body_x(:), body_y(:)]);
       set(wheel1, 'XData', wheel1_x);
       set(wheel2, 'XData', wheel2_x);
       set(link1, 'XData', lh_x, 'YData', lh_y);
       set(point1, 'XData', xp1, 'YData', yp1);
       set(link2, 'XData', l2_x, 'YData', l2_y);
       set(point2, 'XData', xp2, 'YData', yp2);
       set(link3, 'XData', l3_x, 'YData', l3_y);
       set(point3, 'XData', xp3, 'YData', yp3);
     end
     drawnow
     pause(15/201/1.3);
% F(i) = getframe;
% writeVideo(ved, F(i));
  end
end

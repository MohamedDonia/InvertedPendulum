% % cart plotting
function []=pendulum_plot(l1,time,position,angle1)  %cart(pendulum length,time vector,position vector,angle vector)
  cart_w = 0.4;
  cart_h = 0.2;
  cart_wheel_d = 0.05; 
  % general figure configuration 
  % close all previous figures 
  close all;
  % define mew figure with background white 
  cart=figure('color','white');
  % define childern axes from figure
  ax = axes('Parent', cart);
  % hold axes on 
  hold(ax, 'on');
  % det exes equal scale 
  axis(ax, 'equal');
  % set axis limit [xmin=-2, xmax=2, ymin=-2, ymax=2] 
  axis(ax,[-2 2 -2 2]);
  % set axes title 
  title(ax, 'Pendulum Plotting', 'Color', [.6 0 0],'LineWidth',2);
  %plotting opjects:
  % plot horizontal line that the cart will move on
  line([-2 2], [0 0], 'color', [0 0 0], 'LineWidth', 2, 'Parent', ax);
  % define your body coordinates:
  %{
    point1 --- > 0.05
    point2 --- > 0.25
    point3 --- > 0.25
    point4 --- > 0.05
  %}
  body_y = [cart_wheel_d, cart_wheel_d+cart_h, cart_wheel_d+cart_h, cart_wheel_d];
  % y of wheel1
  wheel1_y = cart_wheel_d/2;
  % y of wheel2
  wheel2_y = cart_wheel_d/2;
  % iterate over time to get animation:
  for i=1:length(time)
      % x position of the body 
     body_x = [position(i)-cart_w/2, ...
               position(i)-cart_w/2, ...
               position(i)+cart_w/2, ...
               position(i)+cart_w/2];
     % x position of the wheel1
     wheel1_x = position(i)-cart_w/3;
     % x position of tyhe wheel2
     wheel2_x = position(i)+cart_w/3;
     % pendulum (1) co-ordinates ::
                
     xp1 = position(i) + l1*sin(angle1(i));
     yp1 = cart_h/2+cart_wheel_d + l1*cos(angle1(i));
     lh_x = [position(i), xp1];
     lh_y = [cart_h/2+cart_wheel_d, yp1];
     if i == 1
       % body : 
       body = fill(body_x, body_y , 'r');
       % wheel1 :
       wheel1 = plot(wheel1_x, wheel1_y, 'o', 'MarkerFaceColor', 'g',...
                                              'MarkerSize',10);
       % wheel2 :
       wheel2 = plot(wheel2_x, wheel2_y, 'o', 'MarkerFaceColor', 'g',...
                                              'MarkerSize', 10);
       % link : 
       link1 = line(lh_x, lh_y, 'color', [0 0 0], 'LineWidth', 3);
       % point mass : 
       point1 = plot(xp1, yp1, 'o', 'MarkerFaceColor', 'k', 'MarkerSize', 10);
     % update body, wheel1, wheel2, link1, pointmass
     else
       set(body,   'XData', body_x(:), 'YData', body_y(:));
       set(wheel1, 'XData', wheel1_x);
       set(wheel2, 'XData', wheel2_x);
       set(link1,  'XData', lh_x,      'YData', lh_y);
       set(point1, 'XData', xp1,       'YData', yp1);
     end
     drawnow
     % pause about 
     pause(max(time)/length(time));
  end
end
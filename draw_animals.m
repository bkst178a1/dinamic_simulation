function [frame] = draw_animals(animals)
    cla;
    [n,~] = size(animals);
    for i = 1:n
        a = animals(i,:);
        color = get_color(a(5));
        plot(a(1), a(2), 'o', 'color', color, 'markerfacecolor', color);
        hold on;
    end
    axis([-10, 1010, -10, 1010]);
    pause(1/100);
    frame = getframe(gcf);
end


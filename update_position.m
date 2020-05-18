function [new_animals] = update_position(animals)
    predators_speed = 5;
    victims_speed = 2;
    alive = find(animals(:,5) == 0 | animals(:,5) == 1);
    [n, ~] = size(alive);
    for i = 1:n
        a = animals(alive(i),:);
        if ((a(1) == a(3)) && (a(2) == a(4)))
            a(3) = randi([0, 3000]);
            a(4) = randi([0, 3000]);
        end
        if (a(5) == 1)
            a(1) = a(1) + predators_speed*sign(a(3) - a(1));
            a(2) = a(2) + predators_speed*sign(a(4) - a(2));
        end
        if (a(5) == 0)
            a(1) = a(1) + victims_speed*sign(a(3) - a(1));
            a(2) = a(2) + victims_speed*sign(a(4) - a(2));
        end
        animals(alive(i),:) = a;
    end
    new_animals = animals;
end


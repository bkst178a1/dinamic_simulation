function [new_animals] = update_status(animals,success_hunt_rate,hunting_radius,hunger_up_time,hunger_death_rate)
    predators = find(animals(:,5) == 1);
    [n, ~] = size(predators);
    victims = find(animals(:,5) == 0);
    [k, ~] = size(victims);
    for i = 1:n
        p = animals(predators(i),:);
        p(7) = p(7) + 1;
        for j = 1:k
            v = animals(victims(j),:);
            if (norm(p(1:2)-v(1:2)) <= hunting_radius && rand <= success_hunt_rate)
                v(5) = 2;
                animals(victims(j),:) = v;
                p(6) = 0;
                p(7) = 0;
                animals(predators(i),:) = p;
            end
        end
        if (p(7) == hunger_up_time)
            p(6) = p(6) + hunger_death_rate;
            p(7) = 0;
        end
        animals(predators(i),:) = p;
    end
    new_animals = animals;
end


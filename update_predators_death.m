function [new_animals] = update_predators_death(animals)
    predators = find(animals(:,5) == 1);
    [n, ~] = size(predators);
    for i = 1:n
        p = animals(predators(i),:);
        if(rand <= p(6))
            p(5) = 3;
            animals(predators(i),:) = p;
        end
    end
    new_animals = animals;
end


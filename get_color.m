function [color] = get_color(animal)
    switch animal
        case 0
            color = [0, 1, 0];
        case 1
            color = [1, 0, 0];
        case 2
            color = [0, 0, 0];
        case 3
            color = [0.5, 0.1, 0.1];
        otherwise
            color = [0.7, 0.7, 0.7];
end


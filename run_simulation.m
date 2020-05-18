function [result] = run_simulation(predators, victims, simulation_length,...
    success_hunt_rate, hunting_radius, hunger_death_rate, hunger_up_time)

total_animals = victims + predators;

% 4 координаты
% отметка: 0 - жерва, 1 - хищник, 2 - мертвая жертва, 3 - мертвый хищник
% показатель голода хищника
% время, в течении которого хищник не питался

animals = zeros(total_animals, 7);
animals(:,1:4) = randi([0, 1000], [total_animals, 4]);
animals(1:predators,5) = 1;

video = VideoWriter('Output');
open(video);
for i = 1:simulation_length
    frame = draw_animals(animals);
    writeVideo(video, frame);
    animals = update_position(animals);
    animals = update_status(animals,success_hunt_rate,hunting_radius,...
        hunger_up_time,hunger_death_rate);
    animals = update_predators_death(animals);
end
close(video);

result = [sprintf("Survived victims : %d\n", nnz(animals(animals(:,5) == 0))),...
    sprintf("Survived predators : %d\n", nnz(animals(animals(:,5) == 1))),...
    sprintf("Dead victims : %d\n", nnz(animals(animals(:,5) == 2))),...
    sprintf("Dead predators : %d\n", nnz(animals(animals(:,5) == 3)))];
end
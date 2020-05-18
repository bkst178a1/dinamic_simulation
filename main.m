close all;
clear all;
clc;

predators = 7;
victims = 21;
total_animals = victims + predators;
simulation_length = 100;
success_hunt_rate = 0.7;
hunting_radius = 200;
hunger_death_rate = 0.01;
hunger_up_time = 20;

% 4 координаты
% отметка: 0 - жерва, 1 - хищник, 2 - мертвая жертва, 3 - мертвый хищник
% показатель голода хищника
% время, в течении которого хищник не питался

animals = zeros(total_animals, 7);
animals(:,1:4) = randi([0, 3000], [total_animals, 4]);
animals(1:predators,5) = 1;

video = VideoWriter('Output');
video.FrameRate = 60;
open(video);
for i = 1:simulation_length
    draw_animals(animals);
    animals = update_position(animals);
    animals = update_status(animals,success_hunt_rate,hunting_radius,hunger_up_time,hunger_death_rate);
    animals = update_predators_death(animals);
end
close(video);

sprintf("Total victims : %d", victims)
sprintf("Total predators : %d", predators)
sprintf("Survived victims : %d", nnz(animals(animals(:,5) == 0)))
sprintf("Survived predators : %d", nnz(animals(animals(:,5) == 1)))
sprintf("Dead victims : %d", nnz(animals(animals(:,5) == 2)))
sprintf("Dead predators : %d", nnz(animals(animals(:,5) == 3)))
clc;
close all;
clear all;

global predators victims simulation_length...
    success_hunt_rate hunting_radius hunger_death_rate hunger_up_time...
    result

predators = 25;
victims = 35;
simulation_length = 200;
success_hunt_rate = 0.6;
hunting_radius = 200;
hunger_death_rate = 0.002;
hunger_up_time = 15;


ui = figure('Visible', 'off', 'Position', [360, 500, 720, 480]);

start_button = uicontrol('Style', 'pushbutton', 'String', 'Start Simulation',...
    'Position', [500, 50, 160, 30], 'FontSize', 12,...
    'callback', {@start_simulation});

uicontrol('Style', 'text', 'String', 'Predators:',...
    'Position', [490, 400, 160, 20], 'FontSize', 12,...
    'HorizontalAlignment', 'Left');

uicontrol('Style', 'text', 'String', 'Victims:',...
    'Position', [490, 360, 160, 20], 'FontSize', 12,...
    'HorizontalAlignment', 'Left');

uicontrol('Style', 'text', 'String', 'Successful hunt chance:',...
    'Position', [490, 320, 250, 20], 'FontSize', 12,...
    'HorizontalAlignment', 'Left');

uicontrol('Style', 'text', 'String', 'Hunting radius:',...
    'Position', [490, 280, 160, 20], 'FontSize', 12,...
    'HorizontalAlignment', 'Left');

uicontrol('Style', 'edit', 'String', predators, 'Position',...
    [680, 400, 30, 20], 'FontSize', 12, 'callback', {@change_predators});

uicontrol('Style', 'edit', 'String', victims, 'Position',...
    [680, 360, 30, 20], 'FontSize', 12, 'callback', {@change_victims});

uicontrol('Style', 'edit', 'String', success_hunt_rate, 'Position',...
    [680, 320, 30, 20], 'FontSize', 12, 'callback', {@change_hunt_rate});

uicontrol('Style', 'edit', 'String', hunting_radius, 'Position',...
    [680, 280, 30, 20], 'FontSize', 12, 'callback', {@change_hunting_radius});

result = uicontrol('Style', 'text', 'String', [],...
    'Position', [490, 80, 160, 160], 'FontSize', 12,...
    'HorizontalAlignment', 'Left');


ha = axes('Units', 'pixels', 'Position', [50, 50, 400, 400]);

set(ui, 'Name', 'Predator-Victim Simulation');
movegui(ui, 'center');
set(ui, 'Visible', 'on');

function start_simulation(~, ~)
    global predators victims simulation_length...
        success_hunt_rate hunting_radius hunger_death_rate hunger_up_time...
        result

    result.String = run_simulation(predators, victims, simulation_length,...
        success_hunt_rate, hunting_radius, hunger_death_rate, hunger_up_time);
end

function change_predators(source, ~)
    global predators
    predators = round(str2double(source.String)); 
end


function change_victims(source, ~)
    global victims
    victims = round(str2double(source.String)); 
end

function change_hunt_rate(source, ~)
    global success_hunt_rate;
    success_hunt_rate = str2double(source.String);
end

function change_hunting_radius(source, ~)
    global hunting_radius;
    hunting_radius = str2double(source.String);
end
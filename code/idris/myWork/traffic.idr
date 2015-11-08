module traffic

data color = red | green | amber

nextColor: color -> color
nextColor red = green
nextColor green = amber
nextColor amber = red

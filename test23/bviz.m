clear
if exist('ros_bag.mat',"file")
    load ros_bag.mat
else
    addpath('..')
    bag_loader
end

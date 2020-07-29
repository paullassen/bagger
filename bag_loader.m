%% Load bagfile if ros_data does not already exist
if ~exist('ros_data')
    ros_data = rosbag('bagfile.bag');
end
%% Extract Data from Bagfile
clearvars -except ros_data
disp('Not Using: ')
for i = 1:size(ros_data.AvailableTopics.Row,1)
    topic = ros_data.AvailableTopics.Row{i};
    [~, name, ~] = fileparts(topic);
    
    switch(name)
        case 'att_in'
            msgs = select(ros_data, 'Topic', topic);
            att_in_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_att_in = msgs.MessageList{:,1} - ros_data.StartTime;
            
            att_in.X = [];
            att_in.Y = [];
            att_in.Z = [];
            for j = 1:size(att_in_tmp,1)
                att_in.X = [att_in.X att_in_tmp(j).Point.X];
                att_in.Y = [att_in.Y att_in_tmp(j).Point.Y];
                att_in.Z = [att_in.Z att_in_tmp(j).Point.Z];
            end
            clear att_in_tmp 
        
        case 'attitude'
            msgs = select(ros_data, 'Topic', topic);
            attitude_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_attitude = msgs.MessageList{:,1} - ros_data.StartTime;
            
            attitude.X = [];
            attitude.Y = [];
            attitude.Z = [];
            for j = 1:size(attitude_tmp,1)
                attitude.X = [attitude.X attitude_tmp(j).Point.X];
                attitude.Y = [attitude.Y attitude_tmp(j).Point.Y];
                attitude.Z = [attitude.Z attitude_tmp(j).Point.Z];
            end
            clear attitude_tmp   
            
        case 'err'
            msgs = select(ros_data, 'Topic', topic);
            err_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_err = msgs.MessageList{:,1} - ros_data.StartTime;
            
            err.X = [];
            err.Y = [];
            err.Z = [];
            for j = 1:size(err_tmp,1)
                err.X = [err.X err_tmp(j).Point.X];
                err.Y = [err.Y err_tmp(j).Point.Y];
                err.Z = [err.Z err_tmp(j).Point.Z];
            end
            clear err_tmp
            
        case 'erd'
            msgs = select(ros_data, 'Topic', topic);
            erd_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_erd = msgs.MessageList{:,1} - ros_data.StartTime;
            
            erd.X = [];
            erd.Y = [];
            erd.Z = [];
            for j = 1:size(erd_tmp,1)
                erd.X = [erd.X erd_tmp(j).Point.X];
                erd.Y = [erd.Y erd_tmp(j).Point.Y];
                erd.Z = [erd.Z erd_tmp(j).Point.Z];
            end
            clear erd_tmp

        case 'eri'
            msgs = select(ros_data, 'Topic', topic);
            eri_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_eri = msgs.MessageList{:,1} - ros_data.StartTime;
            
            eri.X = [];
            eri.Y = [];
            eri.Z = [];
            for j = 1:size(eri_tmp,1)
                eri.X = [eri.X eri_tmp(j).Point.X];
                eri.Y = [eri.Y eri_tmp(j).Point.Y];
                eri.Z = [eri.Z eri_tmp(j).Point.Z];
            end
            clear eri_tmp
            
        case 'mocap_att'
            msgs = select(ros_data, 'Topic', topic);
            mocap_att_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_mocap_att = msgs.MessageList{:,1} - ros_data.StartTime;
            
            mocap_att.X = [];
            mocap_att.Y = [];
            mocap_att.Z = [];
            for j = 1:size(mocap_att_tmp,1)
                mocap_att.X = [mocap_att.X mocap_att_tmp(j).Point.X];
                mocap_att.Y = [mocap_att.Y mocap_att_tmp(j).Point.Y];
                mocap_att.Z = [mocap_att.Z mocap_att_tmp(j).Point.Z];
            end
            clear mocap_att_tmp

        case 'mocap'
            msgs = select(ros_data, 'Topic', topic);
            mocap_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_mocap = msgs.MessageList{:,1} - ros_data.StartTime;
            
            mocap.X = [];
            mocap.Y = [];
            mocap.Z = [];
            for j = 1:size(mocap_tmp,1)
                mocap.X = [mocap.X mocap_tmp(j).Pose.Position.X];
                mocap.Y = [mocap.Y mocap_tmp(j).Pose.Position.Y];
                mocap.Z = [mocap.Z mocap_tmp(j).Pose.Position.Z];
            end
            clear mocap_tmp

        case 'kp'
            msgs = select(ros_data, 'Topic', topic);
            kp_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_kp = msgs.MessageList{:,1} - ros_data.StartTime;
            
            kp.X = [];
            kp.Y = [];
            kp.Z = [];
            for j = 1:size(kp_tmp,1)
                kp.X = [kp.X kp_tmp(j).X];
                kp.Y = [kp.Y kp_tmp(j).Y];
                kp.Z = [kp.Z kp_tmp(j).Z];
            end
            clear kp_tmp

        case 'kd'
            msgs = select(ros_data, 'Topic', topic);
            kd_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_kd = msgs.MessageList{:,1} - ros_data.StartTime;
            
            kd.X = [];
            kd.Y = [];
            kd.Z = [];
            for j = 1:size(kd_tmp,1)
                kd.X = [kd.X kd_tmp(j).X];
                kd.Y = [kd.Y kd_tmp(j).Y];
                kd.Z = [kd.Z kd_tmp(j).Z];
            end
            clear kd_tmp
            
        case 'ki'
            msgs = select(ros_data, 'Topic', topic);
            ki_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_ki = msgs.MessageList{:,1} - ros_data.StartTime;
            
            ki.X = [];
            ki.Y = [];
            ki.Z = [];
            for j = 1:size(ki_tmp,1)
                ki.X = [ki.X ki_tmp(j).X];
                ki.Y = [ki.Y ki_tmp(j).Y];
                ki.Z = [ki.Z ki_tmp(j).Z];
            end
            clear ki_tmp
            
        case 'target'
            msgs = select(ros_data, 'Topic', topic);
            target_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_target = msgs.MessageList{:,1} - ros_data.StartTime;
            
            target.X = [];
            target.Y = [];
            target.Z = [];
            for j = 1:size(target_tmp,1)
                target.X = [target.X target_tmp(j).X];
                target.Y = [target.Y target_tmp(j).Y];
                target.Z = [target.Z target_tmp(j).Z];
            end
            clear target_tmp
            
        case 'thrust'
            msgs = select(ros_data, 'Topic', topic);
            thrust_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_thrust = msgs.MessageList{:,1} - ros_data.StartTime;
            
            thrust = [];
            for j = 1:size(thrust_tmp,1)
                thrust = [thrust thrust_tmp(j).Data];
            end
            clear thrust_tmp
            
        case 'baseline'
            msgs = select(ros_data, 'Topic', topic);
            baseline_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_baseline = msgs.MessageList{:,1} - ros_data.StartTime;
            
            baseline = [];
            for j = 1:size(baseline_tmp,1)
                baseline = [baseline baseline_tmp(j).Data];
            end
            clear baseline_tmp
            
        case 'yaw_target'
            msgs = select(ros_data, 'Topic', topic);
            yaw_target_tmp = cell2mat(readMessages(msgs, 'DataFormat', 'struct'));
            t_yaw_target = msgs.MessageList{:,1} - ros_data.StartTime;
            
            yaw_target = [];
            for j = 1:size(yaw_target_tmp,1)
                yaw_target = [yaw_target yaw_target_tmp(j).Data];
            end
            clear yaw_target_tmp
        
        otherwise
            disp(topic)
    end
end
clear msgs name topic i j ros_data
%%
save ros_bag
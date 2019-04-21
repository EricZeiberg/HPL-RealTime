s=Bluetooth('R1',1);
fopen(s);
j=1;


a1 = animatedline('Color',[1 0 0]); %establishes animated for accel x  data
a2 = animatedline('Color',[0 1 0]); %establishes animated for accel y  data
a3 = animatedline('Color',[0 0 1]); %establishes animated for accel z  data
%legend('Accel_x','Accel_y','Accel_z')  %generates the legend of the accelerometer data



    out=fscanf(s);
    disp(out);
%     remout=[];
%     ACCX=[];
%     ACCY=[];
%     ACCZ=[];
%     
%         SS1=strrep(out,'Accelerometer: X = ','');
%         [ACCXt,r1]=strtok(SS1,' |');
%         SS2=strrep(r1,' | Y = ','');
%         [ACCYt,r2]=strtok(SS2,' |');
%         ACCZt=strrep(r2,' | Z = ','');
%         Data(j,:)=[str2double(ACCXt)/16384,str2double(ACCYt)/16384,str2double(ACCZt)/16384];
%         ACCX=Data(j,1);
%         ACCY=Data(j,2);
%         ACCZ=Data(j,3);
% 
      Data(j,1)=str2double(out);

%     remout=rem(j,3);
%     if remout==1
        addpoints(a1,j,str2double(out));
%         addpoints(a2,ceil(j/3),ACCY);
%         addpoints(a3,ceil(j/3),ACCZ);
        drawnow limitrate  
%     end
    j=j+1;
end

%%
figure(10)
plot(Data)

%%
Data1 = Data(2:end);

l = length(Data1);
f = 1/Fs;
FullTime = l/Fs
t = (0:f:FullTime-f);

plot(t, Data1)

% % fclose(s);
% % delete(s);
% % clear s;
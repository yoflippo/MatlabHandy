function animateStickFigure(KinectData,apData,saveAviFile,speed)
oldDir = pwd;

if not(exist('saveAviFile','var'))
    saveAviFile = 1;
end

if not(exist('speed','var'))
    speed = 1;
end
sJointBoneInfo = getJointsAndBonesFromIBT();

hfigure = figure('Position', [10 10 600 600],'Visible','on');

KinectMatrix = convertTableToMatrix(KinectData);
hp = plotJoints(KinectMatrix(1,:),sJointBoneInfo);
hl = plotBones(KinectMatrix(1,:),sJointBoneInfo);

if not(exist('apData','var'))
    saveAviFile = 0;
    filename = mfilename;
else
    [dir,filename] = fileparts(apData);
    cd(dir);
end

setFigure(filename);

if saveAviFile == 1
    set(hfigure,'color',[1 1 1])
    mov = VideoWriter(filename,'MPEG-4');
    mov.FrameRate = 15;
    mov.Quality = 75;
    open(mov);
else
    mov=[]; set(hfigure,'doublebuffer','on');
end

setAxisBasedOnValues(KinectMatrix,sJointBoneInfo);
animateIterate(KinectMatrix,sJointBoneInfo)

if isempty(mov)==0
    close(mov);
else
    set(findall(0,'type','figure'),'doublebuffer','off');
end

cd(oldDir);


    function plotJointsWithHandle(handle,Kinect,sJointInfo)
        set(handle,'xdata',Kinect(sJointInfo.JointsCoordinates.X), ...
            'ydata',Kinect(sJointInfo.JointsCoordinates.Y), ...
            'zdata',Kinect(sJointInfo.JointsCoordinates.Z))
        set(gca,'BoxStyle','back');
    end

    function plotBonesWithHandle(handle,Kinect,sJointInfo)
        for nB = 1:length(sJointInfo.Bones)
            c = sJointInfo.Bones(:,nB);
            d = [c.prox.vector; c.dist.vector];
            set(handle(nB),'xdata',Kinect(d(:,1)),...
                'ydata',Kinect(d(:,2)),...
                'zdata',Kinect(d(:,3)));
        end
    end

    function [hp] = plotJoints(Kinect,sJointInfo)
        hp = plot3(Kinect(sJointInfo.JointsCoordinates.X), ...
            Kinect(sJointInfo.JointsCoordinates.Y), ...
            Kinect(sJointInfo.JointsCoordinates.Z), ...
            'o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',2);
        hold on
    end

    function [hl] = plotBones(Kinect,sJointInfo)
        for nB = 1:length(sJointInfo.Bones)
            c = sJointInfo.Bones(:,nB);
            d = [c.prox.vector; c.dist.vector];
            hl(nB) = plot3(Kinect(d(:,1)), Kinect(d(:,2)), Kinect(d(:,3)));
            hold on;
        end
    end

    function setFigure(Title)
        axis equal;
        xlabel('x');ylabel('y');zlabel('z'); title(replace(Title,'_','\_'));
        %         set(gca,'xlim',[-2000,2000])
        %         set(gca,'ylim',[-1000,1000])
        % set(gca,'zlim',[1000,2000])
        set(gca,'box','on','View',[0 90]);
        % set(gca, 'ZTickLabelMode', 'manual', 'ZTickLabel', []);
        % set(gca, 'XTickLabelMode', 'manual', 'XTickLabel', []);
        % set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', []);
        %         set(gca, 'xtick', [], 'ytick', [], 'ztick', []) ;
        % set(gca,'ydir','reverse');
        % set(gca,'xdir','reverse');
        set(gca,'FontSize', 10);
        grid on; grid minor;
    end

    function setAxisBasedOnValues(data,sInfo)
        xmax = max(max(data(:,sInfo.JointsCoordinates.X)));
        ymax = max(max(data(:,sInfo.JointsCoordinates.Y)));
        zmax = max(max(data(:,sInfo.JointsCoordinates.Z)));
        xmin = min(min(data(:,sInfo.JointsCoordinates.X)));
        ymin = min(min(data(:,sInfo.JointsCoordinates.Y)));
        zmin = min(min(data(:,sInfo.JointsCoordinates.Z)));
        set(gca,'xlim',[xmin-200,xmax+200])
        set(gca,'ylim',[ymin-200,ymax+200])
    end

    function vector =  convertTableToMatrix(tab)
        vector = table2array(tab);
    end


    function animateIterate(KinectMatrix,sJointBoneInfo)
        frameDuration = mean(diff(KinectMatrix(:,1)))/1000; %seconds
        for nF = 2:length(KinectMatrix(:,1))
            tic;
            kinectVector = KinectMatrix(nF,:);
            plotJointsWithHandle(hp,kinectVector,sJointBoneInfo);
            plotBonesWithHandle(hl,kinectVector,sJointBoneInfo);
            drawnow;
            
            if isempty(mov)==0
                set(hfigure,'Renderer','zbuffer');
                writeVideo(mov, getframe(hfigure));
            end
            
            t = toc;
            if t < frameDuration && isequal(get(gcf,'Visible'),'on')
                pause(((speed*1)/30)-t)
            end
        end
        close(hfigure);
    end
end %function

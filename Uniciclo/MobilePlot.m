function  Mobile_Graph=MobilePlot(dx,dy,angz)
global  Uniciclo;

% Matriz de rotación z

Rz=[ cos(angz) -sin(angz) 0; sin(angz) cos(angz) 0; 0 0 1];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
robotPatch = Rz* Uniciclo.platformVertices;
robotPatch(1,:)=robotPatch(1,:)+dx;
robotPatch(2,:)=robotPatch(2,:)+dy;

Mobile_Graph(1) = patch('Faces',Uniciclo.platformFaces,'Vertices',robotPatch','FaceColor',[0.3 0.75 0.93],'EdgeColor','none');

robotPatch = Rz* Uniciclo.platformfVertices;
robotPatch(1,:)=robotPatch(1,:)+dx;
robotPatch(2,:)=robotPatch(2,:)+dy;

Mobile_Graph(2) = patch('Faces',Uniciclo.platformfFaces,'Vertices',robotPatch','FaceColor','green','EdgeColor','none');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

robotPatch = Rz* Uniciclo.wheelVertices;
robotPatch(1,:)=robotPatch(1,:)+dx;
robotPatch(2,:)=robotPatch(2,:)+dy;

Mobile_Graph(3) = patch('Faces',Uniciclo.wheelFaces,'Vertices',robotPatch','FaceColor',[0.8 0.8 0.8],'EdgeColor','none');

robotPatch = Rz* Uniciclo.wheelBVertices;
robotPatch(1,:)=robotPatch(1,:)+dx;
robotPatch(2,:)=robotPatch(2,:)+dy;

Mobile_Graph(4) = patch('Faces',Uniciclo.wheelBFaces,'Vertices',robotPatch','FaceColor','black','EdgeColor','none');








function  MobileRobot
load('UnicicloDimensions.mat')
global Uniciclo;

% 1 m de largo.
% 0.5 m de ancho
Uniciclo.platformVertices=PlatformUniciclo.vertices';
Uniciclo.platformFaces=PlatformUniciclo.faces;

Uniciclo.platformfVertices=PlatformFront.vertices';
Uniciclo.platformfFaces=PlatformFront.faces;

%0.15 m radio
Uniciclo.wheelVertices=wheelUniciclo.vertices';
Uniciclo.wheelFaces=wheelUniciclo.faces;

Uniciclo.wheelBVertices=wheelUnicicloB.vertices';
Uniciclo.wheelBFaces=wheelUnicicloB.faces;




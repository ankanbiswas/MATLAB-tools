function R = EulToRotZYX(phi, theta, psi)
% Rot = EulToRotZYX(phi, theta, psi)
%
% This function returns a rotation matrix based on the Euler angles
% provided.  It uses the ZYX convention.
%
% syms phi theta psi
% R = Rot(psi, 'z') * Rot(theta, 'y') * Rot(phi, 'x');

if length(phi) > 1
    
    phi = permute(phi,[3,2,1]);
    theta = permute(theta, [3,2,1]);
    psi = permute(psi, [3,2,1]);
    
end

R = [...
    cos(psi)*cos(theta), ...
    cos(psi)*sin(phi)*sin(theta) - cos(phi)*sin(psi), ...
    sin(phi)*sin(psi) + cos(phi)*cos(psi)*sin(theta); ...
    cos(theta)*sin(psi), ...
    cos(phi)*cos(psi) + sin(phi)*sin(psi)*sin(theta), ...
    cos(phi)*sin(psi)*sin(theta) - cos(psi)*sin(phi); ...
    -sin(theta), ...
    cos(theta)*sin(phi), ...
    cos(phi)*cos(theta)];

end
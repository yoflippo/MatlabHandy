function x = normalizeAngleRadian(x)

x = mod(x,2*pi); % force in range 0..2pi
if x > pi
    x = x - 2*pi;
end

% def normalize_angle(x):
%     x = x % (2 * np.pi)    # force in range [0, 2 pi)
%     if x > np.pi:          # move to [-pi, pi)
%         x -= 2 * np.pi
%     return x
end


function hsi_image = rgb2hsi(rgb_image)
    % 检查图像是否为 RGB 图像
    if size(rgb_image, 3) ~= 3
        error('输入图像必须是 RGB 图像');
    end
    
    % 将 RGB 图像转换为双精度浮点类型，并归一化到 [0, 1]
    rgb_image = im2double(rgb_image);
    R = rgb_image(:, :, 1);
    G = rgb_image(:, :, 2);
    B = rgb_image(:, :, 3);
    
    % 初始化 HSI 图像
    [rows, cols, ~] = size(rgb_image);
    H = zeros(rows, cols);
    S = zeros(rows, cols);
    I = (R + G + B) / 3; % Intensity 分量
    
    % 计算 Saturation 分量
    min_rgb = min(min(R, G), B);
    S = 1 - 3 .* min_rgb ./ (R + G + B + eps); % 防止除以零
    
    % 计算 Hue 分量
    numerator = 0.5 * ((R - G) + (R - B));
    denominator = sqrt((R - G).^2 + (R - B) .* (G - B));
    theta = acos(numerator ./ (denominator + eps)); % 防止除以零
    
    % 将 Hue 分量根据条件调整
    H(B > G) = 2 * pi - theta(B > G);
    H(B <= G) = theta(B <= G);
    H = H / (2 * pi); % 归一化到 [0, 1]
    
    % 将 H, S, I 合并为 HSI 图像
    hsi_image = cat(3, H, S, I);
end

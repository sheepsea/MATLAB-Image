function img_blocks = image_blocking(img)
    I = img;
    
    % 获取图像大小
    [rows, cols] = size(I);
    
    % 块的大小
    blockSize = 64;
    
    % 初始化块的存储
    numBlocksRow = rows / blockSize; % 计算行方向上的块数
    numBlocksCol = cols / blockSize; % 计算列方向上的块数
    blocks = cell(numBlocksRow, numBlocksCol);
    
    % 分割图像
    for i = 1:numBlocksRow
        for j = 1:numBlocksCol
            % 计算当前块的起始和结束索引
            rowStart = (i - 1) * blockSize + 1;
            rowEnd = i * blockSize;
            colStart = (j - 1) * blockSize + 1;
            colEnd = j * blockSize;
            
            % 提取当前块
            blocks{i, j} = I(rowStart:rowEnd, colStart:colEnd);
        end
    end
    
    img_blocks = blocks;
end

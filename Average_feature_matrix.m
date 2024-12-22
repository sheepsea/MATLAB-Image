function mean_M = Average_feature_matrix(S1)
    % 定义处理函数，用于计算每个块的平均值
    meanFunc = @(block_struct) mean(block_struct.data(:));
    % 使用 blockproc 函数进行处理
    B = blockproc(S1, [2 2], meanFunc);
    mean_M = B;
end


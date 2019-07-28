cop = ["airline" "KOR" "CHN" "ELSE"];
indexOfAirline=0;
for index = 1:1:2 
    [num, txt, raw] = xlsread(strcat("F:\PFMS\T", num2str(index),".xlsx"));
    data = string(raw);
    rowMax = length(data(:,1))
    for row= 2:1:rowMax
        if ismember(data(row,1),cop(:,1))
            indexOfAirline = find(cop(:,1)==data(row,1));
            cop(indexOfAirline,2) = str2double(cop(indexOfAirline,2))+str2double(data(row,2));
            cop(indexOfAirline,3) = str2double(cop(indexOfAirline,3))+str2double(data(row,3));
            cop(indexOfAirline,4) = str2double(cop(indexOfAirline,4))+str2double(data(row,4));
        else
            cop = [cop; data(row,:)];
        end
    end
end
disp("Done!")


 
indexOfAirline=0;
for index = 1:1:2 
    [num, txt, raw1] = xlsread(strcat("F:\PFMS\T1.xlsx"));
    [num, txt, raw2] = xlsread(strcat("F:\PFMS\T2.xlsx"));
    T1= string(raw1);
    T2= string(raw2);
    rowMax = length(T2(:,1))
    for row= 2:1:rowMax
        if ismember(T2(row,1),T1(:,1))
            indexOfAirline = find(T1(:,1)==T2(row,1));
            T1(indexOfAirline,2) = str2double(T1(indexOfAirline,2))+str2double(T2(row,2));
            T1(indexOfAirline,3) = str2double(T1(indexOfAirline,3))+str2double(T2(row,3));
            T1(indexOfAirline,4) = str2double(T1(indexOfAirline,4))+str2double(T2(row,4));
        else
            T1 = [T1; T2(row,:)];
        end
    end
end
disp("Done!")


 
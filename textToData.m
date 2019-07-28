dayArr  = [31 28 31 30 31 30 31 31 30 31 30 31];
data = ["airline", "nation"];
cop = ["airline" "KOR" "CHN" "ELSE"];
lenErrorCount = 0;
for month =1:1:1
    dayMax = 11
    %dayMax = dayArr(1,month);
    for day = 11:1:dayMax
        %�����̸�����
        if month<10
            if day<10
                filename = strcat("20180", num2str(month), "0",num2str(day),".xls");
            else
                filename = strcat("20180", num2str(month), num2str(day),".xls");
            end
        else
            if day<10
                filename = strcat("2018", num2str(month), "0",num2str(day),".xls");
            else
                filename = strcat("2018", num2str(month), num2str(day),".xls");
            end
        end
        
        %�����б�
        if month<10
             [num, txt] = xlsread(strcat("F:\PFMS\T1\2018�� 0",num2str(month),"��\",filename));
        else
            [num, txt] = xlsread(strcat("F:\PFMS\T1\2018�� ",num2str(month),"��\",filename));
        end
        
        %[�װ���, ����] ����
        data = [txt(:,2) txt(:,8)]; 
        
        %�м��ϱ�
        rowMax = length(data);
        for row= 2:1:rowMax
            %�������� ��� row�� ���ؼ�
            if strlength(data(row,1)) == 6 %�װ��� �ڵ� ���� üũ
                airline = extractBefore(data(row,1),3); %�װ��� �ڵ� ����
                if ismember(airline,cop)%�̹� ������ �װ����� ���
                    %���� �Ǵ�
                    indexOfAirline = find(cop(:,1)==airline);
                    if isempty(indexOfAirline)
                        disp(fliename)
                        disp("indexOfAirlineError!")
                        continue
                    end
                    
                    if data(row,2) == "KOR"
                        cop(indexOfAirline,2) = str2double(cop(indexOfAirline,2))+1;
                    elseif data(row,2) == "CHN"
                        cop(indexOfAirline,3) = str2double(cop(indexOfAirline,3))+1;
                    else
                        cop(indexOfAirline,4) = str2double(cop(indexOfAirline,4))+1;
                    end    
                else%ó�� ������ �װ����� ���
                    cop = [cop; airline "0" "0" "0"];%�װ��� �߰�
                    
                    %���� �Ǵ�
                    indexOfAirline = find(cop(:,1)==airline);
                    if data(row,2) == "KOR"
                        cop(indexOfAirline,2) = str2double(cop(indexOfAirline,2))+1;
                    elseif data(row,2) == "CHN"
                        cop(indexOfAirline,3) = str2double(cop(indexOfAirline,3))+1;
                    else
                        cop(indexOfAirline,4) = str2double(cop(indexOfAirline,4))+1;
                    end    
                end
            else
%                 disp("@@@@@@Error!@@@@@@");
%                 disp(filename);
%                 disp(data(row,1));
                lenErrorCount = lenErrorCount +1;
            end
            
        end%�м� ��
        disp("day ")
        disp(day)
        disp("end")
    end
    disp("month ")
    disp(month)
    disp("end")
end

%xlswrite(strcat("T1_",num2str(month),"��"), cop);
disp("done!")
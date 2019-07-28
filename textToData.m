dayArr  = [31 28 31 30 31 30 31 31 30 31 30 31];
data = ["airline", "nation"];
cop = ["airline" "KOR" "CHN" "ELSE"];
lenErrorCount = 0;
for month =1:1:1
    dayMax = 11
    %dayMax = dayArr(1,month);
    for day = 11:1:dayMax
        %파일이름생성
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
        
        %파일읽기
        if month<10
             [num, txt] = xlsread(strcat("F:\PFMS\T1\2018년 0",num2str(month),"월\",filename));
        else
            [num, txt] = xlsread(strcat("F:\PFMS\T1\2018년 ",num2str(month),"월\",filename));
        end
        
        %[항공편, 국적] 추출
        data = [txt(:,2) txt(:,8)]; 
        
        %분석하기
        rowMax = length(data);
        for row= 2:1:rowMax
            %데이터의 모든 row에 대해서
            if strlength(data(row,1)) == 6 %항공사 코드 길이 체크
                airline = extractBefore(data(row,1),3); %항공사 코드 추출
                if ismember(airline,cop)%이미 등장한 항공사인 경우
                    %국적 판단
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
                else%처음 나오는 항공사인 경우
                    cop = [cop; airline "0" "0" "0"];%항공사 추가
                    
                    %국적 판단
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
            
        end%분석 끝
        disp("day ")
        disp(day)
        disp("end")
    end
    disp("month ")
    disp(month)
    disp("end")
end

%xlswrite(strcat("T1_",num2str(month),"월"), cop);
disp("done!")
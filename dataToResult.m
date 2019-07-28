[num, txt, raw] = xlsread("F:\Alliance.xlsx");
data = string(raw);

SKY = data(:,1);
sky_len = length(SKY(~ismissing(SKY)));
SKY = data(2:sky_len,1);
sky_result = [0 0 0];

STAR = data(:,2);
star_len = length(STAR(~ismissing(STAR)));
STAR = data(2:star_len,2);
star_result = [0 0 0];

OW = data(:,3);
ow_len = length(OW(~ismissing(OW)));
OW = data(2:ow_len,3);
ow_result = [0 0 0];

LCC = data(:,4);
lcc_len = length(LCC(~ismissing(LCC)));
LCC = data(2:lcc_len,4);
lcc_result = [0 0 0];

FLCC = data(:,5);
flcc_len = length(FLCC(~ismissing(FLCC)));
FLCC = data(2:flcc_len,5);
flcc_result = [0 0 0];

NA = data(:,6);
na_len = length(NA(~ismissing(NA)));
NA = data(2:na_len,6);
na_result = [0 0 0];

else_result = [0 0 0];

[num, txt, raw] = xlsread("F:\PFMS\airline.xlsx");
data = string(raw);
rowMax = length(data);
error_count=0;
result = ["Airline" "KOR" "CHN" "ELSE"];
for row= 2:1:rowMax
    if ismember(data(row,1), SKY)
        sky_result(1,1) = sky_result(1,1)+ str2double(data(row,2));
        sky_result(1,2) = sky_result(1,2)+ str2double(data(row,3));
        sky_result(1,3) = sky_result(1,3)+ str2double(data(row,4));
    elseif ismember(data(row,1), STAR)
        star_result(1,1) = star_result(1,1)+ str2double(data(row,2));
        star_result(1,2) = star_result(1,2)+ str2double(data(row,3));
        star_result(1,3) = star_result(1,3)+ str2double(data(row,4));
    elseif ismember(data(row,1), OW)
        ow_result(1,1) = ow_result(1,1)+ str2double(data(row,2));
        ow_result(1,2) = ow_result(1,2)+ str2double(data(row,3));
        ow_result(1,3) = ow_result(1,3)+ str2double(data(row,4));
    elseif ismember(data(row,1), LCC)
        result = [result; data(row,:)];
    elseif ismember(data(row,1), FLCC)
        flcc_result(1,1) = flcc_result(1,1)+ str2double(data(row,2));
        flcc_result(1,2) = flcc_result(1,2)+ str2double(data(row,3));
        flcc_result(1,3) = flcc_result(1,3)+ str2double(data(row,4));
    elseif ismember(data(row,1), NA)
        na_result(1,1) = na_result(1,1)+ str2double(data(row,2));
        na_result(1,2) = na_result(1,2)+ str2double(data(row,3));
        na_result(1,3) = na_result(1,3)+ str2double(data(row,4));
    else
        error_count = error_count+1;
        else_result(1,1) = else_result(1,1)+ str2double(data(row,2));
        else_result(1,2) = else_result(1,2)+ str2double(data(row,3));
        else_result(1,3) = else_result(1,3)+ str2double(data(row,4));
    end
end

result = [result;"STAR" star_result; "SKY" sky_result; "OW" ow_result; "FLCC" flcc_result; "NA" na_result; "ELSE" else_result];


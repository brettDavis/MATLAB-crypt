function [message] = decrypt(nugget,key)

%read files
%test_one = input('file?')
%test_two = input('key?')


fid1    = fopen(nugget);
nugget  = fscanf(fid1,'%x',243);

fid2    = fopen(key);
key     = fscanf(fid2,'%x',243);


% assemble imported elements into the correct matrix

for n = 1:243

        if n >= 1 & n <= 9

                trix_a(1,n) = nugget(n);

        elseif n >=10 & n <= 18

                trix_a(2,n-9) = nugget(n);

        elseif n >= 19 & n <= 27

                trix_a(3,n-18) = nugget(n);

        elseif n >= 28 & n <= 36

                trix_a(4,n-27) = nugget(n);

        elseif n >= 37 & n <= 45

                trix_a(5,n-36) = nugget(n);

        elseif n >= 46 & n <= 54

                trix_a(6,n-45) = nugget(n);

        elseif n >= 55 & n <= 63

                trix_a(7,n-54) = nugget(n);

        elseif n >= 64 & n <= 72

                trix_a(8,n-63) = nugget(n);

        elseif n >= 73 & n <= 81

                trix_a(9,n-72) = nugget(n);

        elseif n >= 82 & n <= 90

                trix_a(10,n-81) = nugget(n);

        elseif n >= 91 & n <= 99

                trix_a(11,n-90) = nugget(n);

        elseif n >= 100 & n <= 108

                trix_a(12,n-99) = nugget(n);

        elseif n >= 109 & n <= 117
	 
		trix_a(13,n-108) = nugget(n);

        elseif n >= 118 & n <= 126

                trix_a(14,n-117) = nugget(n);

        elseif n >= 127 & n <= 135

                trix_a(15,n-126) = nugget(n);

        elseif n >= 136 & n <= 144

                trix_a(16,n-135) = nugget(n);

        elseif n >= 145 & n <= 153

                trix_a(17,n-144) = nugget(n);

        elseif n >= 154 & n <= 162

                trix_a(18,n-153) = nugget(n);

        elseif n >= 163 & n <= 171

                trix_a(19,n-162) = nugget(n);

        elseif n >= 172 & n <= 180

                trix_a(20,n-171) = nugget(n);

        elseif n >= 181 & n <= 189

                trix_a(21,n-180) = nugget(n);

        elseif n >= 190 & n <= 198

                trix_a(22,n-189) = nugget(n);

        elseif n >= 199 & n <= 207

                trix_a(23,n-198) = nugget(n);

        elseif n >= 208 & n <= 216

                trix_a(24,n-207) = nugget(n);

        elseif n >= 217 & n <= 225

                trix_a(25,n-216) = nugget(n);

        elseif n >= 226 & n <= 234

                trix_a(26,n-225) = nugget(n);

        elseif n >= 235 & n <= 243

		trix_a(27,n-234) = nugget(n);
	end
end

key_A_trix = vec2mat(key,9,27);

%Re-assemble Properly formed nugget

nuggetP = ones(27,9);

for n = 1:243;

	nuggetP(key_A_trix(n)) = trix_a(n);
end

%Re-assemble nugglet

key_B = [nuggetP(10,:),nuggetP(11,:),nuggetP(12,:),nuggetP(13,:),nuggetP(14,:),nuggetP(15,:),nuggetP(16,:),nuggetP(17,:),nuggetP(18,:)];

nuglet = [nuggetP(19,:),nuggetP(20,:),nuggetP(21,:),nuggetP(22,:),nuggetP(23,:),nuggetP(24,:),nuggetP(25,:),nuggetP(26,:),nuggetP(27,:)];

nugletP = ones(1,81);

for n = 1:81

	 nugletP(n) = nuglet(key_B(n)); 
end

%convert to characters

nugletC = char((nugletP ./ 85));

mess_length = sum([nuggetP(1,:),nuggetP(2,:),nuggetP(3,:),nuggetP(4,:),nuggetP(5,:),nuggetP(6,:),nuggetP(7,:),nuggetP(8,:),nuggetP(9,:)]);

message = nugletC((1:mess_length));

%disp

fprintf('\n MESSAGE:>  ')
fprintf('%c',message)
fprintf('\n\n')

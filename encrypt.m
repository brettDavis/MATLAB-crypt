function [output] = encrypt(message,fileName,keyName)

mess_length = numel(char(message));

%taking the actual characters and putting them into the first trix

trix_a = ones(9,9);

for n = 1:mess_length;

	if n >= 1 & n <= 9 
	
		trix_a(1,n) = message(n);

	elseif n >=10 & n <= 18

		trix_a(2,n-9) = message(n);

	elseif n >= 19 & n <= 27

		trix_a(3,n-18) = message (n);

	elseif n >= 28 & n <= 36

		trix_a(4,n-27) = message (n);
	
	elseif n >= 37 & n <= 45

		trix_a(5,n-36) = message (n);

	elseif n >= 46 & n <= 54

		trix_a(6,n-45) = message (n);
	
	elseif n >= 55 & n <= 63

		trix_a(7,n-54) = message (n);

	elseif n >= 64 & n <= 72

		trix_a(8,n-63) = message (n);

	elseif n >= 73 & n <= 81

		trix_a(9,n-72) = message (n);
	end
end

%generate first key - MESSAGE LENGTH

for n = 1:81;

	if n >= 1 & n <= 9
		
		if trix_a(1,n) == 1
	
			key_1(n) = 0;

		else
			key_1(n) = 1;
		end
	
	elseif n >=10 & n <= 18

		if trix_a(2,n-9) == 1;

			key_1(2,n-9) = 0;

		else
			key_1(2,n-9) = 1;
		end

	elseif n >= 19 & n <= 27;

		if trix_a(3,n-18) == 1;

			key_1(3,n-18) = 0;
		else
			key_1(3,n-18) = 1;
		end
		
	elseif n >= 28 & n <= 36;

		if trix_a(4,n-27) == 1;

			key_1(4,n-27) = 0;
		else
			key_1(4,n-27) = 1;
		end
	elseif n >= 37 & n <= 45;

		if trix_a(5,n-36) == 1;
			
			key_1(5,n-36) = 0;
		else
			key_1(5,n-36) = 1;
		end	

	elseif n >= 46 & n <= 54;

		if trix_a(6,n-45) == 1;

			key_1(6,n-45) = 0;
		else
			key_1(6,n-45) = 1;
		end

	elseif n >= 55 & n <= 63;
		
  		if trix_a(7,n-54) == 1;
			
			key_1(7,n-54) = 0;
		else
			key_1(7,n-54) = 1;
		end

	elseif n >= 64 & n <= 72;

	  	if trix_a(8,n-63) == 1;	

			key_1(8,n-63) = 0;
		else
			key_1(8,n-63) = 1;
		end

	elseif n >= 73 & n <= 81;

	  	if trix_a(9,n-72) == 1;
			
			key_1(9,n-72) = 0;
		else
			key_1(9,n-72) = 1;
		end

	end	
end

%Generate random a-z unicode values to fill in the space

rng(1);

key_a = randi([41 122],1,81);

vec_a = [trix_a(1,:),trix_a(2,:),trix_a(3,:),trix_a(4,:),trix_a(5,:),trix_a(6,:),trix_a(7,:),trix_a(8,:),trix_a(9,:)];

disp (mess_length);
for n = 1:81

	if n < mess_length + 1

		vec_b(n) = vec_a(n);
	else
	
		vec_b(n) = vec_a(n) * key_a(n);
	end
end

%generates random key for index values

rng(1);
b     = 1:81;
key_b = b(randperm(length(b)));

%contstruct matrix c

for n = 1:81;

	vec_c(key_b(n)) = vec_b(n);
end

trix_c = vec2mat(vec_c,9);

trix_d = trix_c * 85;

%CONSTRUT THE NUGGET 

nugget_a = [vec2mat(key_1,9);vec2mat(key_b,9);trix_d];

%rearrange das nugget - forming final key

b         = 1:243;
key_final = b(randperm(length(b)));

nugget_b = ones(27,9);

for n = 1:243;

	nugget_b(n) = nugget_a(key_final(n));
end

%demonstration switch
if 0
disp('trix c')
disp(char(trix_c))
disp('key b')
disp(key_b)
disp('trix_d')
disp(trix_d)
disp('nugget')
disp(nugget_a)


disp('key_final')
disp(key_final)
disp(' ')
disp('nugget_b')
disp(nugget_b)
disp(' ')
end

%write to file

nugget_out = fopen(fileName,'w');
key_out    = fopen(keyName,'w');

fprintf(key_out,'%x %x %x %x %x %x %x %x %x \n',key_final);
fprintf(nugget_out,'%x %x %x %x %x %x %x %x %x \n',nugget_b);

%disp

fprintf('\n|<<:|<*!WRITE SUCCESSFUL!*>|:>> \n\n')
%switchlet
end



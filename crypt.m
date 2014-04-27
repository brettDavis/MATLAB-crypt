%%The Crypt is a matrix based encryption program. 

fprintf('\nWelcome to de crypt!\n')
fprintf('\n 1) Encrypt 2) Decrypt\n')

choice = input('\n Which is your choice?  >>>  ');


if choice == 1
	
	fprintf('\n\n      [||:|_ENCRYPT_|:||]\n\n')
		
	fileName    = input('\n FILENAME://:>  ','s');
	
	keyName     = input('\n KEYNAME:///:>  ','s');	
	
	message     = input('\n MESSAGE:///:>  ','s');

	encrypt(message,fileName,keyName);

elseif choice == 2
	
	fprintf('\n\n       [||:|_DECRYPT_|:||]\n\n')
	
	nugget  = input('\n FILE://:>  ','s');
	
	key     = input('\n KEY:///:>  ','s');
	
	decrypt(nugget,key);
	
else

	fprintf('pick a real choice ya dingus!')
	break
end






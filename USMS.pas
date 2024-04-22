unit USMS;

interface

uses StrUtils,SysUtils;

    function stringToPDU( bitSize:integer;inpString:string;phoneNumber:string;var Mes_SMS1:string; var Mes_SMS2:string):string;
    function semiOctetToString(inp:string) :string;
    function ToHex(i:INTEGER):STRING;
    function getSevenBit(character:char):integer; //sp
    function intToBin(x:integer;size:integer) :string;
    function binToInt(x:string):integer;
    function intpower2(base,power1:integer):integer;
var


  sevenbitdefault : Array[0..127]of char =('@',
   '£',
   '$',
   '¥',
   'è',
   'é',
   'ù',
   'ì',
   'ò',
   'Ç',
   'è',
   'Ø',
   'ø',
   'è',
   'Å',
   'å',
   'è',
   '_',
   'è',
   'è',
   'è',
   'è',
   'è',
   'è',
   'è',
   'è',
   'è',
   '€',
   'Æ',
   'æ',
   'ß',
   'É',
   ' ',
   '!',
   '"',
   '#',
   '¤',
   '%',
   '&',
   '\',
   '(',
   ')',
   '*',
   '+',
   ',',
   '-',
   '.',
   '/',
   '0',
   '1',
   '2',
   '3',
   '4',
   '5',
   '6',
   '7',
   '8',
   '9',
   ':',
   ';',
   '<',
   '=',
   '>',
   '?',
   '¡',
   'A',
   'B',
   'C',
   'D',
   'E',
   'F',
   'G',
   'H',
   'I',
   'J',
   'K',
   'L',
   'M',
   'N',
   'O',
   'P',
   'Q',
   'R',
   'S',
   'T',
   'U',
   'V',
   'W',
   'X',
   'Y',
   'Z',
   'Ä',
   'Ö',
   'Ñ',
   'Ü',
   '§',
   '¿',
   'a',
   'b',
   'c',
   'd',
   'e',
   'f',
   'g',
   'h',
   'i',
   'j',
   'k',
   'l',
   'm',
   'n',
   'o',
   'p',
   'q',
   'r',
   's',
   't',
   'u',
   'v',
   'w',
   'x',
   'y',
   'z',
   'ä',
   'ö',
   'ñ',
   'ü',
   'à');



implementation
//************************************************************
// function to convert semioctets to a string
function semiOctetToString(inp:string) :string;
var out1 :string;
temp:string;
l,i:integer;
begin
	out1 := '';
  temp:='';
  l:=length(inp);
  i:=1;
	While ( i< L) do
	begin
   temp := inp[i]+inp[i+1];
   out1 := out1 + temp[2] + temp[1];
   i:=i+2;
   temp:='';
	end;
	result:= out1;
end;
//************************************************************
function intpower2(base,power1:integer):integer;
var i,bas2:integer;
begin
i:=1;
bas2:=1;
while i<=power1 do
 begin
  bas2:=bas2*base;
  inc(i);
 end;
 result:=bas2;
end;
//************************************************************
// function te convert a bit string into a integer
function binToInt(x:string):integer;
var total :integer;
   power1:integer;
   i:integer;
begin
	 total := 0;
	 power1 := length(x)-1;

	for i:=1 to length(x) do
	begin
		if(x[i] = '1') then
		begin
		  total := total +intpower2(2,power1);
		end;
		power1:=power1-1 ;
	end;

	result:= total;
end;
//************************************************************
// function to convert a integer into a bit String
function intToBin(x:integer;size:integer) :string;
	var
   base :integer;
	 num :integer;
	 bin :string;
   i,y:integer;
begin
	 base := 2;
	 num := x;
   bin:='';
   while(num<>0) do
   begin
     y:=num and 1 ;
     if y=1 then
      bin:='1'+bin
     else bin:='0'+bin;
     num:=num shr 1;
   end;
 // bin := num .toString(base);
	for i:=length(bin) to size do
	begin
		bin := '0' + bin;
	end;
	result:= bin;
end;
//************************************************************

function getSevenBit(character:char):integer; //sp
var k,i:integer;
begin
k:=0;
	for i:=0 to length(sevenbitdefault) do
	begin
		if(sevenbitdefault[i] = character) then
		begin
			k:= i;
		end;
	end;
	//alert("No 7 bit char!");
	result:= k;
end;
//************************************************************
function ToHex(i:INTEGER):STRING;
var sHex :STRING;
 Out :STRING;

BEGIN
	sHex := '0123456789ABCDEF';
	Out := '';

	Out := sHex[i AND $f];
	i:=I SHR 4;
	Out := sHex[i AND $f] + Out;

	result:= Out;
END;

//************************************************************
function stringToPDU( bitSize:integer;inpString:string;phoneNumber:string;var Mes_SMS1:string; var Mes_SMS2:string):string;
var
	 octetFirst :STRING;
	 octetSecond :STRING;
	 output :STRING;
	//Make header
	SMSC_INFO_LENGTH :INTEGER;
  SMSC_INFO_LENGTHS:string;
	SMSC_LENGTH :INTEGER;
	SMSC_NUMBER_FORMAT:STRING;
	SMSC :STRING;
  smscNumber:string;
  firstOctet:string;
  REIVER_NUMBER_FORMAT:string;
  REIVER_NUMBER_LENGTH:string;
  REIVER_NUMBER:string;
  PROTO_ID:string;
  DATA_ENCODING:string;
  VALID_PERIOD:string;
  userDataSize:string;
  i:integer;
  current:string;
  currentOctet:string;
  CurrentByte:integer;
  CurrentByteHex:string;
  myChar:integer;
  header:string;
  PDU:string;
  AT:string;
BEGIN
  sevenbitdefault[10]:=chr(10);
  sevenbitdefault[13]:=chr(13);
  sevenbitdefault[26]:=chr(26);

  smscNumber:='';
  SMSC_INFO_LENGTH:=0;
	if (smscNumber <>'') then
	BEGIN
		SMSC_NUMBER_FORMAT := '92'; // national
		if (smscNumber[1] = '+') then
		BEGIN
			SMSC_NUMBER_FORMAT := '91'; // international
      smscNumber :=RightStr(smscNumber , length(smscNumber )-1);
		END
		else if (smscNumber[1] <> '0' ) then
		BEGIN
			SMSC_NUMBER_FORMAT := '91'; // international
		END;
		if(length(smscNumber) mod 2 <> 0) then
		BEGIN
			// add trailing F
			smscNumber :=smscNumber+'F';
		END;
		SMSC := semiOctetToString(smscNumber);
		SMSC_INFO_LENGTH := ((length(SMSC_NUMBER_FORMAT + '' + SMSC))div 2);
		SMSC_LENGTH := SMSC_INFO_LENGTH;
	END;
  //******************************************
	if(SMSC_INFO_LENGTH < 10) then
	BEGIN
		SMSC_INFO_LENGTHS := '0' + '0';
	END;
  //******************************************
	firstOctet := '1100';
  REIVER_NUMBER_FORMAT := '92'; // national

	if (phoneNumber[1] = '+') then
	BEGIN
		REIVER_NUMBER_FORMAT := '91'; // international
    phoneNumber:=RightStr(phoneNumber, length(phoneNumber)-1);//,phoneNumber.length-1);
//    ss:=copy(ss,0,7);
    phoneNumber:=RightStr(phoneNumber, length(phoneNumber)-1);
	end
	else if (phoneNumber[1] <>'0')then
	BEGIN
		REIVER_NUMBER_FORMAT := '91'; // international
	end;

	REIVER_NUMBER_LENGTH := intToHex(length(phoneNumber),2);

	if(length(phoneNumber)MOD 2 <> 0) THEN
	BEGIN
		// add trailing F
		phoneNumber :=phoneNumber+'F';
	end;

	REIVER_NUMBER := semiOctetToString(phoneNumber);
	PROTO_ID := '00';
	DATA_ENCODING := '00'; // Default
	if (bitSize = 8)THEN
	BEGIN
		DATA_ENCODING := '04';
	end
	else if (bitSize = 16) then
	BEGIN
		DATA_ENCODING := '08';
	end;

	VALID_PERIOD:= 'AA';


	if (bitSize = 7) THEN
	BEGIN

		userDataSize:= intToHex(LENGTH(inpString),2);
    i:=1;
		WHILE  I-1<= LENGTH(inpString) do
		BEGIN
			if(i-1=LENGTH(inpString)) then
			BEGIN
				if (octetSecond <> '') then// AJA Fix overshoot
				BEGIN
					output := output + '' + (intToHex(binToInt(octetSecond),2));
				end;
			 	 BREAK;
			end;
			current:= intToBin(getSevenBit(inpString[i]),7);


			if (i-1<>0) and (((i-1) mod 8)<>0) then
			BEGIN
				octetFirst := RightStr(current, length(current)-1-(7-((i-1) mod 8)));//current.substring(7-(i)%8);
				currentOctet := octetFirst + octetSecond;	//put octet parts together

				output := output + '' + (intToHex(binToInt(currentOctet),2));
//        octetSecond :=RightStr(current,(7-((i-1) mod 8)));	//set net second octet
        octetSecond := copy(current,2,(7-((i-1)mod 8)));
			end
			else
			BEGIN
//				octetSecond := copy(current,1,(7-((i-1)mod 8)));
          octetSecond :=RightStr(current,(7-((i-1) mod 8)));
			end;
     I:=I+1;
		end;//END WHILE
	end
	else if (bitSize = 8) then
	BEGIN
  	userDataSize := intToHex(length(inpString),2);
  	CurrentByte := 0;
		for i:=1   to length(inpString) do
		BEGIN
			CurrentByte := ORD(inpString[i]);
      CurrentByteHex:=inttohex(ORD(inpString[i]),2);
//			output := output + '' + ( ToHex( CurrentByte ) );
      output := output + '' +CurrentByteHex;
		end
	end
	else if (bitSize = 16) THEN
	begin
		userDataSize := intToHex(LENGTH(inpString) * 2,2);

		myChar:=0;
		for i:=1 to length(inpString) do
		begin
			myChar :=  ord(inpString[i]);
			output := output + '' +  intToHex(((myChar and $ff00) shr 8 ),2) +  intToHex(( myChar and $ff ) ,2);
		end
	end;
	 header := SMSC_INFO_LENGTHS + SMSC_NUMBER_FORMAT + SMSC + firstOctet + REIVER_NUMBER_LENGTH + REIVER_NUMBER_FORMAT  + REIVER_NUMBER +  PROTO_ID + DATA_ENCODING + VALID_PERIOD + userDataSize;

	PDU := header + output;
	AT := 'AT+CMGS=' + inttostr((length(PDU) div 2 - SMSC_LENGTH - 1)) ; // Add /2 for PDU length AJA - I think the SMSC information should also be excluded
  Mes_SMS1:=AT ;
  Mes_SMS2:=PDU ;
	//CMGW
	result:= AT +chr(10) + PDU;
END;

end.

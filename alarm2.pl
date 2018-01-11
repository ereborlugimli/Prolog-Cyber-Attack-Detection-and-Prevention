%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% alarm2.pl
%
% SİBER SALDIRILARIN TESPİTİ ve ENGELLENMESİ İÇİN UZMAN SİSTEM (US)
% TASARIMI: SİBER SAVUNMA UZMAN SİSTEMİ (SİSU)
% 
% Büşra Yenidoğan
% 14010011018
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

notice:-
	nl,
	write(' ------------'),nl,
	write('| Alarm2	    |'),nl,
	write(' ------------'),nl.

question(q1) :-
	write(' -------------------------------------'),nl,
	write('| Detect the purpose of the attack    |'),nl,
	write(' -------------------------------------'),nl.	

resolve(r1) :-
	write("Information theft 									    							 COMMUNICATION"),nl,
	write("To bring down the system  <---  Request expert support | Detect where attacked  --->  HIGHWAYS"),nl,
	write("To control UDHB systems 																 the SEA"),nl,
	write("				|																		 AIRLINES"),nl,
	write("				|"),nl,
	write("				v"),nl.

question(q2) :-
	write(' ----------------------------------'),nl,
	write(' | Has the attack been blocked?    |'),nl,
	write(' ----------------------------------'),nl.

resolve(r2) :-
	write("											COMMUNICATION"),nl, 
	write("											HIGHWAYS"),nl, 
	write("											the SEA"),nl,
	write("											AIRLINES"),nl,
	write("											^"),nl,
	write("											|"),nl,
	write("											|"),nl,
	write("Report to SSKB  --->  Check UDHB systems"),nl.


question(q3) :-
	write(' ------------------------'),nl,
	write(' | Turn off UDHB systems |'),nl,
	write(' ------------------------'),nl.	

resolve(r3) :-
	write('Alarm3'),nl,
	halt.
	


security(State, r1):-
			control(State, q1).

security(State, r2):-
			control(State, q2).

security(State, r3):-
			control(State, q3).

control(P, Val):-
		ask('',Val).

ask(Obj, Val):-
		known(Obj, Val, true),!.

ask(Obj, Val):-
		known(Obj, Val, false),!, fail.

ask(Obj, Val):-
			nl,
			write(Obj),question( Val) ,
			write(' (Y/N)'),
			read(Ans), !,
			((Ans=y, assert(known(Obj, Val, true)));
			(assert(known(Obj, Val, false)),fail)).
			
diagnose:-	
	security(control,Security) ,!,
	nl,
	resolve(Security).

diagnose:- 
	nl,
	write('We didnt find what is the problem !').

start:-
	notice,
	repeat,
	abolish(known/3),dynamic(known/3),
	retractall(known/3),
	diagnose,
	nl,nl,
	write('Try again ? (Y/N)'),
	read(Resp),\+ Resp=y,
	nl,
	write('Bye ! Thanks for using this system'),
	abolish(known,3).
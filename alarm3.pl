%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% alarm3.pl
%
% SİBER SALDIRILARIN TESPİTİ ve ENGELLENMESİ İÇİN UZMAN SİSTEM (US)
% TASARIMI: SİBER SAVUNMA UZMAN SİSTEMİ (SİSU)
% 
% Büşra Yenidoğan
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

notice:-
	nl,
	write(' ------------'),nl,
	write('| Alarm3	    |'),nl,
	write(' ------------'),nl.

question(q1) :-
	write(' -------------------------------------'),nl,
	write('| Running backup UDHB systems         |'),nl,
	write(' -------------------------------------'),nl.	

resolve(r1) :-
	write('Check the actual systems  ---> Check all UDHB systems'),nl,
	write('														|'),nl,
	write('														|'),nl,
	write('														v'),nl.

question(q2) :-
	write(' -------------------------------------'),nl,
	write(' | Has the attackers been detected ?  |'),nl,
	write(' -------------------------------------'),nl.

resolve(r2) :-
	write('Report'),nl.

question(q3) :-
	write(' -------------------------------------'),nl,
	write(' | Are the systems active ?			 |'),nl,
	write(' -------------------------------------'),nl.

resolve(r3) :-
	write('								|'),nl,
	write('								|'),nl,
	write('								v'),nl,
	write('Request technical support  <---  Compared to actual system data'),nl,
	write('								|'),nl,
	write('								|'),nl,
	write('								v'),nl,
	write('					Activate the main system'),nl.

question(q4) :-
	write(' -------------------------------------'),nl,
	write(' | Is the actual system active ?      |'),nl,
	write(' -------------------------------------'),nl.

resolve(r4) :-
	write('Close backup system'),nl.

question(q5) :-
	write('Return to normal'),nl.
	
resolve(r5) :-
	write('Alarm3'),nl,
	halt.

security(State, r1):-
			control(State, q1).

security(State, r2):-
			control(State, q2).

security(State, r3):-
			control(State, q3).

security(State, r4):-
			control(State, q4).

security(State, r5):-
			control(State, q5).

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

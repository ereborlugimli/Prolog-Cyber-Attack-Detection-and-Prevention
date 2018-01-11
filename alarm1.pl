%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% alarm.pl
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
	write('--- Start UDHB Siber Attack Restoration System ---'),nl,nl,
	write("				|"),nl,
	write("				|"),nl,
	write("				v"),nl.

question(q1) :-
	write(' ------------'),nl,
	write('| New attack |'),nl,
	write(' ------------'),nl.	

resolve(r1) :-
	write("Attack registry information bank (SKBB) <---  Add new attack system information bank"),nl,
	write("				|"),nl,
	write("				|"),nl,
	write("				v"),nl.

question(q2) :-
	write(' --------------------'),nl,
	write(' | Date of Attack    |'),nl,
	write(' | Time of Attack    |'),nl,
	write(' | Address of Attack |'),nl,
	write(' | IP of Attack      |'),nl,
	write(' --------------------'),nl.

resolve(r2) :-
	write("QUERY !  <---  Check the latest status of the systems --->  Compared to previous attacks"),nl,
	write("				|"),nl,
	write("				|"),nl,
	write("				v"),nl,
	write("COMMUNICATION"),nl, 
	write("HIGHWAYS"),nl, 
	write("the SEA"),nl,
	write("AIRLINES"),nl.

question(q3) :-
	write(' -----------------------------------------------'),nl,
	write(' | Determine what system the attack was made on |'),nl,
	write(' -----------------------------------------------'),nl.	

resolve(r3) :-
	write('Query the systems to be attacked'),nl,
	write("				|"),nl,
	write("				|"),nl,
	write("				v"),nl.
	

question(q4) :-
	write(' --------------------'),nl,
	write(' |Is there problem ? |'),nl,
	write(' --------------------'),nl.

resolve(r4) :-
	write(''),nl.

question(q5) :-
	write(' ---------------------------'),nl,
	write(' | Is the attack type new ? |'),nl,
	write(' ---------------------------'),nl.

resolve(r5) :-
	write("				|"),nl,
	write("				|"),nl,
	write("				v"),nl.

question(q6) :-
	write(' ---------------------------'),nl,
	write(' | Dos or network attack ? |'),nl,
	write(' ---------------------------'),nl.

resolve(r6) :-
	write('--- >').

question(q7) :-
	write(' --------------------------------'),nl,
	write(' | Can the attack be prevented ? |'),nl,
	write(' --------------------------------'),nl.

resolve(r7) :-
	write('Attack registration database (SSKB)<--------------'),nl,
	write('													^'),nl,
	write('													|'),nl,
	write('													|'),nl,
	write('Deny.Save import record information to SSKB ---->'),nl.

question(r8) :-
	write('Alarm2'),nl,
	halt.
resolve(r8) :-
	write('').

question(r9) :-
	write(' --------------------------------'),nl,
	write(' | Virus, malware, logic bomb?   |'),nl,
	write(' --------------------------------'),nl.

resolve(r9) :-
	write('--- >').

question(s10) :-
	write(' ------------------------------------------'),nl,
	write(' | Is Troy a social engineering venture ? |'),nl,
	write(' ------------------------------------------'),nl.

resolve(r10) :-
	write('Attack registration database (SSKB)<--------------'),nl,
	write('													^'),nl,
	write('													|'),nl,
	write('													|'),nl,
	write('Deny.Save import record information to SSKB ---->'),nl.	

question(q11) :-
	write('Alarm2'),nl,
	halt.

resolve(r11) :-
	write('').

question(q12) :-
	write("COMMUNICATION"),nl, 
	write("HIGHWAYS"),nl, 
	write("the SEA"),nl,
	write("AIRLINES"),nl,
	write('^'),nl,
	write('|'),nl,
	write('|'),nl,
	write('Check the security levels of UDHB systems'),nl,
	write('^'),nl,
	write('|'),nl,
	write('|'),nl,
	write('<---  Scan the SSKB to determine the attack type. '),nl.
	

resolve(r12) :-
	write('Alarm2'),nl,
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

security(State, r6):-
			control(State, q6).

security(State, r7):-
			control(State, q7).

security(State, r8):-
			control(State, q8).

security(State, r9):-
			control(State, q9).

security(State, r10):-
			control(State, q10).

security(State, r11):-
			control(State, q11).

security(State, r12):-
			control(State, q12).

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

/*
	------------------------------ MCO3 Prolog Expert System ------------------------------ 
	
	Names:		Castro, Steven Jentyn
				Li, Roymaxson C.

	Section:	CSINTSY S15
	Domain:		Urinary System
	Illnesses:	
*/


/* Facts */



/* Rules */

%% Start Setup & Queries
instructions :-
	write('| ------------------------------ MCO3 Prolog Expert System ------------------------------ |'), nl,
	write('| Domain: Urinary Systems                                                                 |'), nl,
	write('|      You will be asked a series of questions regarding your well being for diagnosis    |'), nl,
	write('|      Answers must only be in (y/n) only                                                 |'), nl,
	write('| --------------------------------------------------------------------------------------- |'), nl, nl, nl.

start :-
	instructions,
	askname,
	patient(Name),
	diagnose(Illness),
	write(Name), write(', I believe you have '), write(Illness).

askname :-
	write('| What is your name?'), nl,
	read(Name), nl,
	assertz(patient(Name)).

:- dynamic yes/1, no/1.


%% Diagnosis / Illness
diagnose(kidneystones) :-						% 1. Kidney Stones
	symptoms(vomitting),
	symptoms(pain),
	symptoms(chills),
	symptoms(fever),
	symptoms(nausea).

/*
diagnose(urinarytractinfection) :-				% 2. Urinary Tract Infection (UTI)
	symptoms(temp).

diagnose(chronickidneydisease) :-				% 3. Chronic Kidney Disease
	symptoms(temp).

diagnose(acutekidneyinjury) :-					% 4. Acute Kidney Injury
	symptoms(temp).

diagnose(electrolyteimbalance) :-				% 5. Electrolyte Imbalance
	symptoms(temp).

diagnose(benignprostatehypertrophy) :-			% 6. Benign Prostate Hyperthrophy
	symptoms(temp).

diagnose(obstructiveuropathy) :-				% 7. Urinary Obstruction / Obstructive Uropathy
	symptoms(temp).

diagnose(tubulointerstitialnephritis) :-		% 8. Tubulointerstitial Nephritis
	symptoms(temp).

diagnose(diabeticnephropathy) :-				% 9. Diabetic Nephropathy
	symptoms(temp).

diagnose(hypertensivenephrosclerosis) :-		% 10. Hypertensive Nephrosclerosis
	symptoms(temp).
*/

%% Symptoms
symptoms(vomitting) :-
	((yes(vomitting)) -> true ; (no(vomitting) -> fail ; question(vomitting))).

symptoms(pain) :-
	((yes(pain)) -> true ; (no(pain) -> fail ; question(pain))).

symptoms(chills) :-
	((yes(chills)) -> true ; (no(chills) -> fail ; question(chills))).

symptoms(fever) :-
	((yes(fever)) -> true ; (no(fever) -> fail ; question(fever))).

symptoms(nausea) :-
	((yes(nausea)) -> true ; (no(nausea) -> fail ; question(nausea))).


%% Queries
question(vomitting) :-
	write('| Have you been vomitting lately?'), nl,
	read(Reply), nl,
	((Reply == y) -> assert(yes(vomitting)) ; assert(no(vomitting)), fail).

question(pain) :-
	write('| Have you beem feeling abdominal pain lately?'), nl,
	read(Reply), nl,
	((Reply == y) -> assert(yes(pain)) ; assert(no(pain)), fail).

question(chills) :-
	write('| Have you felt the chills lately?'), nl,
	read(Reply), nl,
	((Reply == y) -> assert(yes(chills)) ; assert(no(chills)), fail).

question(fever) :-																			%% Temperature
	write('| Have you felt feverish lately?'), nl,
	read(Reply), nl,
	((Reply == y) -> assert(yes(fever)) ; assert(no(fever)), fail).

question(nausea) :-
	write('| Have you felt nauseated lately?'), nl,
	read(Reply), nl,
	((Reply == y) -> assert(yes(nausea)) ; assert(no(nausea)), fail).




%% Templates

%% symptoms(sample_symptom) :-
%% 	((yes(sample_symptom)) -> true ; (no(sample_symptom) -> fail ; question(sample_symptom))).

%% question(sample_symptom) :-
%% 	write('| Have you ?'), nl,
%% 	read(Reply), nl,
%% 	((Reply == y) -> assert(yes(sample_symptom)) ; assert(no(sample_symptom)), fail).













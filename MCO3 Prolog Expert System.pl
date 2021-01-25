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
	symptoms(abdomenpain),
	symptoms(chills),
	symptoms(fever),
	symptoms(nausea).

diagnose(urinarytractinfection) :-				% 2. Urinary Tract Infection (UTI)
	symptoms(frequenturination),
	symptoms(urinatepain),
	symptoms(abdomenpain),
	(symptoms(nausea) ; symptoms(vomitting)),
	(symptoms(cloudyurine) ; symptoms(bloodyurine) ; symptoms(foulurine)).

diagnose(chronickidneydisease) :-				% 3. Chronic Kidney Disease
	symptoms(fatigue),
	symptoms(insomnia),
	symptoms(abdomenpain),
	symptoms(poorappetite),
	symptoms(frequenturination),
	symptoms(itchyskin).

diagnose(acutekidneyinjury) :-					% 4. Acute Kidney Injury
	symptoms(fatigue),
	symptoms(nausea),
	symptoms(shortbreath),
	symptoms(lowurine),
	symptoms(fluidretention).

diagnose(electrolyteimbalance) :-				% 5. Electrolyte Imbalance
	symptoms(irregularheartbeat),
	symptoms(fatigue),
	symptoms(lethargy),
	(symptoms(nausea) ; symptoms(vomitting)),
	(symptoms(diarrhea) ; symptoms(constipation)).

/*
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

symptoms(abdomenpain) :-
	((yes(abdomenpain)) -> true ; (no(abdomenpain) -> fail ; question(abdomenpain))).

symptoms(chills) :-
	((yes(chills)) -> true ; (no(chills) -> fail ; question(chills))).

symptoms(fever) :-
	((yes(fever)) -> true ; (no(fever) -> fail ; question(fever))).

symptoms(nausea) :-
	((yes(nausea)) -> true ; (no(nausea) -> fail ; question(nausea))).

symptoms(urinatepain) :-
	((yes(urinatepain)) -> true ; (no(urinatepain) -> fail ; question(urinatepain))).

symptoms(frequenturination) :-
	((yes(frequenturination)) -> true ; (no(frequenturination) -> fail ; question(frequenturination))).

symptoms(foulurine) :-
	((yes(foulurine)) -> true ; (no(foulurine) -> fail ; question(foulurine))).

symptoms(cloudyurine) :-
	((yes(cloudyurine)) -> true ; (no(cloudyurine) -> fail ; question(cloudyurine))).

symptoms(bloodyurine) :-
	((yes(bloodyurine)) -> true ; (no(bloodyurine) -> fail ; question(bloodyurine))).

symptoms(insomnia) :-
	((yes(insomnia)) -> true ; (no(insomnia) -> fail ; question(insomnia))).

symptoms(fatigue) :-
	((yes(fatigue)) -> true ; (no(fatigue) -> fail ; question(fatigue))).

symptoms(poorappetite) :-
	((yes(poorappetite)) -> true ; (no(poorappetite) -> fail ; question(poorappetite))).

symptoms(itchyskin) :-
	((yes(itchyskin)) -> true ; (no(itchyskin) -> fail ; question(itchyskin))).

symptoms(shortbreath) :-
	((yes(shortbreath)) -> true ; (no(shortbreath) -> fail ; question(shortbreath))).

symptoms(fluidretention) :-
	((yes(fluidretention)) -> true ; (no(fluidretention) -> fail ; question(fluidretention))).

symptoms(chestpain) :-
	((yes(chestpain)) -> true ; (no(chestpain) -> fail ; question(chestpain))).

symptoms(lowurine) :-
	((yes(lowurine)) -> true ; (no(lowurine) -> fail ; question(lowurine))).

symptoms(irregularheartbeat) :-
	((yes(irregularheartbeat)) -> true ; (no(irregularheartbeat) -> fail ; question(irregularheartbeat))).

symptoms(diarrhea) :-
	((yes(diarrhea)) -> true ; (no(diarrhea) -> fail ; question(diarrhea))).

symptoms(constipation) :-
	((yes(constipation)) -> true ; (no(constipation) -> fail ; question(constipation))).

symptoms(lethargy) :-
	((yes(lethargy)) -> true ; (no(lethargy) -> fail ; question(lethargy))).



%% Queries
question(vomitting) :-
	write('| Have you been vomitting lately?                                                         |'), nl,	% Vomitting
	read(Reply), nl,
	((Reply == y) -> assert(yes(vomitting)) ; assert(no(vomitting)), fail).

question(abdomenpain) :-
	write('| Does your abdominal region hurt?                                                        |'), nl,	% Abdomenal Pain
	read(Reply), nl,
	((Reply == y) -> assert(yes(abdomenpain)) ; assert(no(abdomenpain)), fail).

question(chills) :-
	write('| Do you feel the chills often?                                                           |'), nl,	% Chills
	read(Reply), nl,
	((Reply == y) -> assert(yes(chills)) ; assert(no(chills)), fail).

question(fever) :-																			
	write('| Do you have a fever?                                                                    |'), nl,	% Fever
	read(Reply), nl,
	((Reply == y) -> assert(yes(fever)) ; assert(no(fever)), fail).

question(nausea) :-
	write('| Do you feel nauseous?                                                                   |'), nl,	% Nausea
	read(Reply), nl,
	((Reply == y) -> assert(yes(nausea)) ; assert(no(nausea)), fail).

question(urinatepain) :-
	write('| Does it hurt when you urinate?                                                          |'), nl,	% Painful Urination
	read(Reply), nl,
	((Reply == y) -> assert(yes(urinatepain)) ; assert(no(urinatepain)), fail).

question(frequenturination) :-
	write('| Have you been urinating more frequently?                                                |'), nl,	% Frequent Urination
	read(Reply), nl,
	((Reply == y) -> assert(yes(frequenturination)) ; assert(no(frequenturination)), fail).

question(foulurine) :-
	write('| Does your urine have a strong stench?                                                   |'), nl,	% Foul Urine (Stench)
	read(Reply), nl,
	((Reply == y) -> assert(yes(foulurine)) ; assert(no(foulurine)), fail).

question(cloudyurine) :-
	write('| Does your urine appear cloudy?                                                          |'), nl,	% Cloudy Urine
	read(Reply), nl,
	((Reply == y) -> assert(yes(cloudyurine)) ; assert(no(cloudyurine)), fail).

question(bloodyurine) :-
	write('| Do you have bloody urine?                                                               |'), nl,	% Bloody Urine
	read(Reply), nl,
	((Reply == y) -> assert(yes(bloodyurine)) ; assert(no(bloodyurine)), fail).

question(insomnia) :-
	write('| Do you have trouble sleeping lately?                                                    |'), nl,	% Insomnia
	read(Reply), nl,
	((Reply == y) -> assert(yes(insomnia)) ; assert(no(insomnia)), fail).

question(fatigue) :-
	write('| Have you been feeling more tired lately?                                                |'), nl,	% Fatigue
	read(Reply), nl,
	((Reply == y) -> assert(yes(fatigue)) ; assert(no(fatigue)), fail).

question(poorappetite) :-
	write('| Have you been losing your appetite lately?                                              |'), nl,	% Poor Appetite
	read(Reply), nl,
	((Reply == y) -> assert(yes(poorappetite)) ; assert(no(poorappetite)), fail).

question(itchyskin) :-
	write('| Has your skin been feeling itchy lately?                                                |'), nl,	% Itchy Skin
	read(Reply), nl,
	((Reply == y) -> assert(yes(itchyskin)) ; assert(no(itchyskin)), fail).

question(shortbreath) :-
	write('| Have you been feeling a shortness of breath?                                            |'), nl,	% Shortness of Breath
	read(Reply), nl,
	((Reply == y) -> assert(yes(shortbreath)) ; assert(no(shortbreath)), fail).

question(fluidretention) :-
	write('| Has your legs or ankles been swelling?                                                  |'), nl,	% Fluid Retention
	read(Reply), nl,
	((Reply == y) -> assert(yes(fluidretention)) ; assert(no(fluidretention)), fail).

question(chestpain) :-
	write('| Do you feel pressure or pain in your chest?                                             |'), nl,	% Chest Pain
	read(Reply), nl,
	((Reply == y) -> assert(yes(chestpain)) ; assert(no(chestpain)), fail).

question(lowurine) :-
	write('| Have you noticed a decrease output of urine recently?                                   |'), nl,	% Low Urine
	read(Reply), nl,
	((Reply == y) -> assert(yes(lowurine)) ; assert(no(lowurine)), fail).

question(irregularheartbeat) :-
	write('| Do you have an irregular heart beat?                                                    |'), nl,	% Irregular Heart Beat
	read(Reply), nl,
	((Reply == y) -> assert(yes(irregularheartbeat)) ; assert(no(irregularheartbeat)), fail).

question(diarrhea) :-
	write('| Do you have diarrhea?                                                                   |'), nl,	% Diarrhea
	read(Reply), nl,
	((Reply == y) -> assert(yes(diarrhea)) ; assert(no(diarrhea)), fail).

question(constipation) :-
	write('| Have you been experiencing constipation alot lately?                                    |'), nl,	% Constipation
	read(Reply), nl,
	((Reply == y) -> assert(yes(constipation)) ; assert(no(constipation)), fail).

question(lethargy) :-
	write('| Have you been feeling weak like you lack energy?                                        |'), nl,	% Lethargy / Weakness
	read(Reply), nl,
	((Reply == y) -> assert(yes(lethargy)) ; assert(no(lethargy)), fail).


%	write('| --------------------------------------------------------------------------------------- |'), nl,

	
%% Templates

%% symptoms(sample_symptom) :-
%% 	((yes(sample_symptom)) -> true ; (no(sample_symptom) -> fail ; question(sample_symptom))).

%% question(sample_symptom) :-
%% 	write('| Have you ?'), nl,
%% 	read(Reply), nl,
%% 	((Reply == y) -> assert(yes(sample_symptom)) ; assert(no(sample_symptom)), fail).













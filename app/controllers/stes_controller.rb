class StesController < ApplicationController
	before_action :set_all

	def new_ste
		@ek = Ekid.find(params[:id])
		if @ek.chkl.present?
			@chkl = @ek.chkl
		else
			@chkl = crt_chkl(params[:id])#Chkl.create(ekid_id: params[:id])
		end

		if params[:tp] == "st"
			@ste = Ste.create(ekid_id: params[:id], stat: "nw")
			redirect_to edit_ste_path(ass: @ste.id, chkl: @chkl.id)
		elsif params[:tp] == "ot"
			@ote = Ote.create(ekid_id: params[:id], stat: "nw")
		end
	end

	def edit_ste
		@ste = Ste.find(params[:ass])
		@chkl = Chkl.find(params[:chkl])
	end

	def upd_ste
		par = params[:ste]
		parc = par[:chkl]
		@chkl = form_chkl(par[:chkl])
	end

	private

	def form_chkl(par)
		@chkl = Chkl.find(par[:chkl_id])
		par[:gmtr].each do |k,v|
			@chkl.gmtr[k] = v
		end
		par[:fmtr].each do |k,v|
			@chkl.fmtr[k] = v
		end
		par[:adbh].each do |k,v|
			@chkl.adbh[k] = v
		end
		par[:splg].each do |k,v|
			@chkl.splg[k] = v
		end
		@chkl.save
		return @chkl
	end

	def crt_chkl(id)
		@chkl = Chkl.create(
						gmtr: {"HEAD CONTROL"=>"",
						"PRONE ON ELBOW"=>"",
						"ROLLING"=>"",
						"SITTING"=>"",
						"KNEELING"=>"",
						"STANDING"=>"",
						"WALKING"=>"",
						"JUMPING"=>"",
						"RUNNING"=>"",
						"BALANCE EACH FOOT"=>"",
						"THROW BALL OVER HEAD"=>"",
						"CATCH BALL"=>"",
						"KICK BALL"=>"",
						"CROSSING MIDLINE"=>"",
						"ENDURANCE"=>"",
						"RANGE OF MOTION"=>"",
						"MUSCLE STRENGTH"=>"",
						"MUSCLE TONE"=>"",
						"DEVELOPMENT AGE"=>""},
						fmtr: {"CONTROL OF EXTERMITY ARM/FOREARM/HAND"=>"",
						"REACHING FOR & GRASP OBJECTS"=>"",
						"PICKUP UP SMALL OBJECTS"=>"",
						"STACK BLOCKS"=>"",
						"MANIPULATION OBJECT"=>"",
						"PUT SHAPES INTO A SHAPE SORTER"=>"",
						"HAND DOMINANCE"=>"",
						"PENCIL GRIP"=>"",
						"COPYING"=>"",
						"DRAWING PEOPLE"=>"",
						"COLOUR BETWEEN BORDER"=>"",
						"LACES HOLES"=>"",
						"BUTTON AND UNBUTTON"=>"",
						"CUT PAPER INTO:"=>"",
						"DEVELOPMENT AGE"=>""},
						adbh: {"TOILETING"=>"",
						"FEEDING"=>"",
						"BATHING"=>"",
						"DRESSING"=>"",
						"GROOMING"=>"",
						"TANTRUM"=>"",
						"CLINGING"=>"",
						"CRYING"=>"",
						"SITTING SKILL"=>"",
						"EMOTIONAL FEELING"=>"",
						"FRUSTRATION TOLERANCE"=>"",
						"OPPOSITIONAL"=>"",
						"MANIPULATIVE BEHAVIOUR"=>"",
						"AGGRESIVE BEHAVIOUR"=>"",
						"DEVELOPMENT AGE"=>""},
						splg: {"LANGUAGE USAGE AT HOME"=>"",
						"SENTENCE LENGTHS"=>"",
						"EYE CONTACT"=>"",
						"JOINT ATTENTION"=>"",
						"TURN TAKING"=>"",
						"SHARING"=>"",
						"IMITATION (PHYSICAL/VERBAL)"=>"",
						"MATCHING SKILLS(0-0,0-P,P-P)"=>"",
						"SITUATIONAL UNDERSTANDING"=>"",
						"OBJECT IDENTIFICATON"=>"",
						"NOUN"=>"",
						"VERB"=>"",
						"FOLLOW SIMPLE COMMAND"=>"",
						"FOLLOW COMPLEX COMMAND"=>"",
						"IDENTIFY SIMPLE PROPOSITION"=>"",
						"UNDERSTAND THE USE OF OBJECT"=>"",
						"NAMING"=>"",
						"DESCRIBE PICTURE"=>"",
						"ANSWER 5W1H"=>"",
						"ANSWER HYPOTHETICAL EVENT"=>"",
						"PRAGMATIC"=>"",
						"DEVELOPMENT AGE"=>""},
						cogn: {"ATTENTION SPAN"=>"",
						"ORIENTATION"=>"",
						"MEMORY"=>"",
						"PROBLEM SOLVING"=>"",
						"DECISION MAKING"=>"",
						"IMAGINATION"=>"",
						"BODY PARTS"=>"",
						"COLOURS"=>"",
						"SHAPES"=>"",
						"NUMBERS"=>"",
						"QUANTITIES"=>"",
						"SEQUENCING SKILL"=>"",
						"ALPHABETS"=>"",
						"BIG VS SMALL"=>"",
						"LONG VS SHORT"=>"",
						"TALL VS SHORT"=>"",
						"DEVELOPMENT AGE"=>""},
						audl: {"HEARING LOSS"=>"",
						"LEFT/RIGHT"=>"",
						"SINCE WHEN:"=>"",
						"PROGRESS (REMAIN/WORST/BETTER)"=>"",
						"EAR PAIN"=>"",
						"EAR DISCHARGE"=>"",
						"PREVIOUS ENT/HEARING ASSESSMENT"=>"",
						"DIFFICULT SITUATION TO HEAR"=>"",
						"REACTION TO LOUD SOUND"=>"",
						"DEVELOPMENT AGE"=>""},
						prvb: {"EYE CONTACT"=>"",
						"ATTENTION SPAN"=>"",
						"REQUESTING SKILL"=>"",
						"O-O"=>"",
						"O-P"=>"",
						"P-P"=>"",
						"TURN TAKING"=>""},
						rcel: {""=>"",
						""=>"",
						""=>"",
						""=>"",
						""=>"",
						""=>"",
						"EAT"=>"",
						"DRINK"=>"",
						"WASH HAND"=>"",
						"BRUSH TEETH"=>"",
						"SLEEP"=>"",
						"EYE"=>"",
						"MOUTH"=>"",
						"NOSE"=>"",
						"HAND"=>"",
						"LEG"=>"",
						"HAIR"=>"",
						"EAR"=>"",
						"BLUE"=>"",
						"GREEN"=>"",
						"RED"=>"",
						"YELLOW"=>"",
						"ORANGE"=>"",
						"BIG"=>"",
						"SMALL"=>"",
						"ON"=>"",
						"UNDER"=>"",
						"1 STEP 1 ICW"=>"",
						"1 STEP 2 ICWS"=>"",
						"1 STEP 3 ICWS"=>"",
						"1 STEP 4 ICWS"=>"",
						""=>"",
						""=>"",
						""=>"",
						""=>""},
						rslc: "",
						ekid_id: params[:id])
		return @chkl
	end

	def set_all
		@admin = current_admin
		@teacher = current_teacher
	end

end
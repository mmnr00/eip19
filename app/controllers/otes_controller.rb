class OtesController < ApplicationController
	before_action :set_all

	def edit_ote
		@ote = Ote.find(params[:ass])
		@chkl = Chkl.find(params[:chkl])
	end

	def upd_ote
		par = params[:ote]
		@ote = form_ote(par)
		@chkl = form_chkl(par[:chkl])
		flash[:success] = "SUCCESSFULLY UPDATED FOR #{@chkl.ekid.name}"
		sce = @ote.ekid.sce
		if sce.curr
			redirect_to teacher_index_path
		else
			redirect_to prevtch_path
		end
	end

	private

	def form_ote(par)
		@ote = Ote.find(par[:ote_id])
		@ote.stat = true
		@ote.sens = par[:sens]
		@ote.beob = par[:beob]
		@ote.cog = par[:cog]
		@ote.gmtr= par[:gmtr]
		@ote.fmtr = par[:fmtr]
		@ote.ovc = par[:ovc]
		@ote.teacher_id = par[:teacher_id]
		@ote.save
		return @ote
	end

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
		par[:cogn].each do |k,v|
			@chkl.cogn[k] = v
		end
		par[:audl].each do |k,v|
			@chkl.audl[k] = v
		end
		par[:prvb].each do |k,v|
			@chkl.prvb[k] = v
		end
		par[:rcel].each do |k,v|
			@chkl.rcel[k] = v
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
						"PROGRESS"=>"",
						"EAR PAIN"=>"",
						"EAR DISCHARGE"=>"",
						"PREVIOUS ENT/HEARING ASSESSMENT"=>"",
						"DIFFICULT SITUATION TO HEAR"=>"",
						"REACTION TO LOUD SOUND"=>"",
						"DEVELOPMENT AGE"=>""},
						prvb: {"EYE CONTACT"=>"",
						"ATTENTION SPAN"=>"",
						"REQUESTING SKILL"=>"",
						"TURN TAKING"=>"",
						"O-O"=>"",
						"O-P"=>"",
						"P-P"=>""},
						rcel: {"NOUN"=>"",
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
						"fcmd"=>""},
						rslc: "",
						ekid_id: params[:id])
		return @chkl
	end

	def set_all
		@admin = current_admin
		@teacher = current_teacher
	end

end
class QuestionsController < ApplicationController
    before_action :authenticate_user!


def index
    if params[:listing_id]
        @listing = Listing.find_by(id: params[:listing_id])
        @questions = @listing.questions
    else
        @questions = Question.all
    end
end


    def create
        @question = Question.new(question_params)
        @listing = Listing.find(params.require(:listing_id))
        @question.listing = @listing
        @question.buyer = current_user
        @question.answered = false
        
            unless !@question.save
                redirect_to listing_path(@listing)
            else
                flash[:alert] = "Error"
                redirect_to listing_path(@listing)
            end
    end


def show
    @question = Question.find_by(id: params[:id])
end

def update
    @question = Question.find_by(id: params[:id])
        
            
    
            if @question.update(question_params)
                @question.answered = true
                @question.save
                redirect_to question_path(@question)
            else
                flash[:alert] = "Error"
                redirect_to question_path(@question)
            end
end


private

def question_params
    params.require(:question).permit(:question_text, :answer, :buyer_id, :listing_id, :answered)
end




end

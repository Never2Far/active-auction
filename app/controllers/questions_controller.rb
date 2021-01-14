class QuestionsController < ApplicationController
    before_action :authenticate_user!



# def new
#     @question = Question.new
# end

    def create
        @question = Question.new(question_params)
        @listing = Listing.find(params.require(:listing_id))
        @question.listing = @listing
        @question.buyer = current_user

        # if @question.errors?
        #     flash[:alert] = @question.errors?.first
        #     redirect_to listing_path(@listing) and return
        # end
        
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


private

def question_params
    params.require(:question).permit(:question_text, :answer, :buyer_id, :listing_id, :answered)
end




end

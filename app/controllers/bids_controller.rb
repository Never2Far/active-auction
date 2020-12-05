class BidsController < ApplicationController

def show
@bid = Bid.find_by(id: params[:id])
end


end
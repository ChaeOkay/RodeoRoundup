class MembersController < ApplicationController

  def show
    member = Member.find(params[:id])
    render json: member
  end
end

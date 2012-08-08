class MyfliersController < ApplicationController
  def add

    @myflier = Myflier.new(:user_id => current_user.id, :flier_id => params[:flier_id], :attending_status => '1')
    @myflier.save!
    redirect_to myboard_path

  end

  def delete
    @myflier = Myflier.find(:first, :conditions => ["flier_id = ? and user_id = ?", params[:flier_id], current_user.id])
    Myflier.delete(@myflier)
    redirect_to myboard_path

  end

  def invite
    
    @flier = params[:flier_id]
    @friends = current_user.friends
  end

  def send_invite
    
    @invitees = User.find_all_by_id(params["invitee_ids"])
    @invitees.each do |invitee|
    @invitation = Myflier.create!(:user_id => invitee.id, "flier_id" => params[:flier_id], :attending_status => 0, :inviter_id => current_user.id )

      end
      redirect_to myboard_path

    

  end
end

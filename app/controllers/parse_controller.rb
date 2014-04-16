class ParseController < ApplicationController

  def do_parse
    # WORKS.. just turned off for ajax testing
    result = Parse.do_file_parse()
    
    # trigger and run the job we just created
    # Delayed::Worker.new.run(Delayed::Job.last)

    # EXAMPLES.. 
    # Delayed::Job.all.each{|d| d.run_at = Time.now; d.save!}
    # Delayed::Worker.new.run(Delayed::Job.last) 
    # Delayed::Job.find(10).invoke_job # 10 is the job.id
    
    # flash[:notice] = "job running"
    # redirect_to :controller => 'admin',:action => 'index'
    # render :json => { :success => "success", :status_code => "200" }
    respond_to do |format|
      format.json { render json:{:success => "success", :status_code => "200"}}
    end  
  end

  def remove_users
    p = Parse.new
    p.remove_users
    
    flash['notice'] = 'All users removed'
    redirect_to "admin/index"
  end
end

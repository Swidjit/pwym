class InstructionsController <  ApplicationController

  def show
    puts params[:id]
    puts params[:id].split('.').last
    respond_to do |format|
     format.xml { render 'instructions/'+params[:id]+'.xml' }
   end
  end
end
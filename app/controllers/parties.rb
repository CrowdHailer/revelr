Revelr::App.controllers :parties do
  
  get :index do
    # @parties = Party.all
    render :'parties/index'
  end

  get :new, :map => '/parties/new' do
    render:'parties/new'
  end

  post :create, :map => '/parties' do
    puts params
    puts self
    form = Party::DetailsForm.new params[:party]
    validator = Party::DetailsForm::Validator.new
    puts form.timetable
    puts validator.valid?(form)
    puts validator.errors
    redirect to('/parties')
  end

end

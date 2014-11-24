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
    form = Party::DetailsForm.new params[:party]
    puts form.timetable
    redirect to('/parties')
  end

end

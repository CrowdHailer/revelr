Revelr::App.controllers :parties do
  
  get :index do
    @parties = Party::Repo.all
    render :'parties/index'
  end

  get :new, :map => '/parties/new' do
    render:'parties/new'
  end

  post :create, :map => '/parties' do
    form = Party::DetailsForm.new params[:party]
    validator = Party::DetailsForm::Validator.new

    party = Party.new form.to_hash
    puts party
    Party::Repo.save party
    puts 'yarp'
    puts Party::Repo.first
    redirect to('/parties')
  end

end

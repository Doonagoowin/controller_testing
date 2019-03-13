require 'rails_helper'

RSpec.describe BankAccountsController, type: :controller do
  # this will log in
  login_user

  let(:valid_attr) {
    {
      amount: 200,
      institution: "Chase",
      active: true
    }
  }

  let(:invalid_attr) {
    {
      amount: 200,
      institution: '',
      active: true
    }
  }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      bank_account = @user.bank_account.create! valid_attr
      # BankAccount.find(params[:id])
      get :show, params: { id: bank_account.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      bank_account = @user.bank_accounts.create! valid_attr
      get :edit, params: { id: bank_account.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post / create" do
    context "with valid Params" do
      # def create
      #   @bank_account = BankAccount.new(bank_account_params)
      #   if @bank_account.save
      #     redirect_to @bank_account
      #   else
      #     render :new
      #   end
      # end

      it "creates a new bank account" do
        expect {
          post :create, params: { bank_account: valid_attr }
        }.to change(BankAccount, :count).by(1)
      end

      it "redirect to the new bank account" do
        post :create, params: { bank_account: valid_attr }
        expect(response).to redirect_to(BankAccount.last)
      end
    end

    context "with invalid params" do
      it "does not create a new bank account" do
        expect { 
          post :create, params: { bank_account: invalid_attr }
        }.to change(BankAccount, :count).by(0)
      end

      it "renders the new form" do
        post :create, params: { bank_account: invalid_attr }
        expect(response).to be_successful
      end
    end
  end

  describe "Put / update" do
    # find the bank account
    # BankAccount.find(params[:id])
    # if @bank_account.udpate(bank_account_params)
      #redirect_to @bank_account
    # else
      #render :edit form


    context "with valid params" do
      it "update a bank account that is requested" do
      end

      it "redirect to the bank account" do
      end
    end

    context "with invalid params" do
      it "does not update the bank account" do
      end

      it "renders the edit form" do
      end
    end
  end
end
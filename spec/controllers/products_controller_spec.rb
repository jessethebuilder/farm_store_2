# require 'rails_helper'
#
# RSpec.describe ProductsController, type: :controller do
#   let(:valid_attributes) {
#     attributes_for :product
#   }
#
#   let(:invalid_attributes) {
#     attributes_for :product, name: ''
#   }
#
#   let(:valid_session) { {} }
#
#   describe "GET #index" do
#     it "assigns all products as @products" do
#       product = Product.create! valid_attributes
#       get :index, params: {}, session: valid_session
#       expect(assigns(:products)).to eq([product])
#     end
#   end
#
#   describe "GET #show" do
#     it "assigns the requested product as @product" do
#       product = Product.create! valid_attributes
#       get :show, params: {id: product.to_param}, session: valid_session
#       expect(assigns(:product)).to eq(product)
#     end
#   end
#
#   describe "GET #new" do
#     it "assigns a new product as @product" do
#       get :new, params: {}, session: valid_session
#       expect(assigns(:product)).to be_a_new(product)
#     end
#   end
#
#   describe "GET #edit" do
#     it "assigns the requested product as @product" do
#       product = Product.create! valid_attributes
#       get :edit, params: {id: product.to_param}, session: valid_session
#       expect(assigns(:product)).to eq(product)
#     end
#   end
#
#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new product" do
#         expect {
#           post :create, params: {product: valid_attributes}, session: valid_session
#         }.to change(product, :count).by(1)
#       end
#
#       it "assigns a newly created product as @product" do
#         post :create, params: {product: valid_attributes}, session: valid_session
#         expect(assigns(:product)).to be_a(product)
#         expect(assigns(:product)).to be_persisted
#       end
#
#       it "redirects to the created product" do
#         post :create, params: {product: valid_attributes}, session: valid_session
#         expect(response).to redirect_to(product.last)
#       end
#     end
#
#     context "with invalid params" do
#       it "assigns a newly created but unsaved product as @product" do
#         post :create, params: {product: invalid_attributes}, session: valid_session
#         expect(assigns(:product)).to be_a_new(product)
#       end
#
#       it "re-renders the 'new' template" do
#         post :create, params: {product: invalid_attributes}, session: valid_session
#         expect(response).to render_template("new")
#       end
#     end
#   end
#
#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) {
#         attributes_for :product, name: "A Special Name"
#       }
#
#       it "updates the requested product" do
#         product = Product.create! valid_attributes
#         put :update, params: {id: product.to_param, product: new_attributes}, session: valid_session
#         product.reload
#         product.name.should == "A Special Name"
#       end
#
#       it "assigns the requested product as @product" do
#         product = Product.create! valid_attributes
#         put :update, params: {id: product.to_param, product: valid_attributes}, session: valid_session
#         expect(assigns(:product)).to eq(product)
#       end
#
#       it "redirects to the product" do
#         product = Product.create! valid_attributes
#         put :update, params: {id: product.to_param, product: valid_attributes}, session: valid_session
#         expect(response).to redirect_to(product)
#       end
#     end
#
#     context "with invalid params" do
#       it "assigns the product as @product" do
#         product = Product.create! valid_attributes
#         put :update, params: {id: product.to_param, product: invalid_attributes}, session: valid_session
#         expect(assigns(:product)).to eq(product)
#       end
#
#       it "re-renders the 'edit' template" do
#         product = Product.create! valid_attributes
#         put :update, params: {id: product.to_param, product: invalid_attributes}, session: valid_session
#         expect(response).to render_template("edit")
#       end
#     end
#   end
#
#   describe "DELETE #destroy" do
#     it "destroys the requested product" do
#       product = Product.create! valid_attributes
#       expect {
#         delete :destroy, params: {id: product.to_param}, session: valid_session
#       }.to change(product, :count).by(-1)
#     end
#
#     it "redirects to the products list" do
#       product = Product.create! valid_attributes
#       delete :destroy, params: {id: product.to_param}, session: valid_session
#       expect(response).to redirect_to(products_url)
#     end
#   end
# end

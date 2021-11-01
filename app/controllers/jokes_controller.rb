# frozen_string_literal: true

class JokesController < ApplicationController
  before_action :set_joke, only: %i[edit update destroy]

  # GET /jokes or /jokes.json
  def index
    @joke = Joke.new
    @jokes = Joke.all.order(created_at: :desc)
  end

  # GET /jokes/new
  def new
    @joke = Joke.new
  end

  # GET /jokes/1/edit
  def edit; end

  # POST /jokes or /jokes.json
  def create
    @joke = Joke.new(joke_params)

    respond_to do |format|
      if @joke.save
        format.html { redirect_to jokes_path, flash: { notice: '成功建立笑話' } }
      else
        @jokes = Joke.all.order(created_at: :desc)
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jokes/1 or /jokes/1.json
  def update
    respond_to do |format|
      if @joke.update(joke_params)
        format.html { redirect_to jokes_path, flash: { notice: '成功更新笑話' } }
        format.json { render :show, status: :ok, location: @joke }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @joke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jokes/1 or /jokes/1.json
  def destroy
    @joke.destroy
    respond_to do |format|
      format.html { redirect_to jokes_path, flash: { notice: '成功刪除笑話' } }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_joke
    @joke = Joke.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def joke_params
    params.require(:joke).permit(:title, :content)
  end
end

# frozen_string_literal: true

class TreesController < ApplicationController
  def index
    render json: Tree.all
  end

  def show
    render json: tree
  end

  def create
    tree = Tree.create!(tree_params)
  end

  private

  def tree
    @tree ||= Tree.find(params[:id])
  end

  def tree_params
    params.permit(:name)
  end
end

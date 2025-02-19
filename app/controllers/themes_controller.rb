# frozen_string_literal: true

class ThemesController < ApplicationController
  layout -> { ApplicationLayout }

  # GET /themes/:theme
  def show
    render Views::Themes::ShowView.new(theme: params[:theme])
  end
end

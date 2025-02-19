# frozen_string_literal: true

class ErrorsLayout < Views::Base
  include Phlex::Rails::Layout

  def view_template(&block)
    doctype

    html do
      render Shared::Head.new

      body do
        main(class: "relative flex flex-col items-center justify-center gap-y-6 h-screen w-screen overflow-y-scroll") do
          render Shared::GridPattern.new
          ThemeToggle(class: "hidden") # In order for dark mode to work, we need to render the theme toggle somewhere in the DOM
          render Shared::Logo.new
          div(class: "container w-full max-w-md", &block)
        end
        render Shared::Flashes.new(notice: flash[:notice], alert: flash[:alert])
      end
    end
  end
end

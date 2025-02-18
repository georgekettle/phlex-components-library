# frozen_string_literal: true

module Components
  module Steps
    class Builder < Components::Base
      include DeferredRender

      def initialize(**attrs)
        @attrs = attrs
        @step_number = 0
        @steps = []
      end

      def view_template
        div(**@attrs) do
          @steps.each do |step|
            render step
          end
        end
      end

      def add_step(&)
        @step_number += 1
        step = Step.new(number: @step_number, last: true, &)
        @steps << step
        # Last false for all steps except the last one
        @steps[0..-2].each { |s| s.last = false }
      end
    end
  end
end

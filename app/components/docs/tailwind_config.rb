# frozen_string_literal: true

module Components
  module Docs
    class TailwindConfig < Components::Base
      def view_template
        Text(size: "4", weight: "semibold") { "Update Tailwind Configuration" }
        Text do
          plain "Add the following to your "
          InlineCode(class: "whitespace-nowrap") { "tailwind.config.js" }
          plain " file"
        end
        Codeblock(tailwind_config, syntax: :javascript)
      end

      private

      def tailwind_config
        <<~CODE
          // For importing tailwind styles from ruby_ui gem
          const execSync = require('child_process').execSync;

          // Import ruby_ui gem path (To make sure Tailwind loads classes used by ruby_ui gem)
          const outputRUBYUI = execSync('bundle show phlex_ui', { encoding: 'utf-8' });
          const ruby_ui_path = outputRUBYUI.trim() + '/**/*.rb';

          const defaultTheme = require('tailwindcss/defaultTheme')

          module.exports = {
            darkMode: ["class"],
            content: [
              './app/views/**/*.{erb,haml,html,slim,rb}',
              './app/helpers/**/*.rb',
              './app/assets/stylesheets/**/*.css',
              './app/javascript/**/*.js',
              ruby_ui_path
            ],
            theme: {
              container: {
                center: true,
                padding: "2rem",
                screens: {
                  "2xl": "1400px",
                },
              },
              extend: {
                colors: {
                  border: "hsl(var(--border))",
                  input: "hsl(var(--input))",
                  ring: "hsl(var(--ring))",
                  background: "hsl(var(--background))",
                  foreground: "hsl(var(--foreground))",
                  primary: {
                    DEFAULT: "hsl(var(--primary))",
                    foreground: "hsl(var(--primary-foreground))",
                  },
                  secondary: {
                    DEFAULT: "hsl(var(--secondary))",
                    foreground: "hsl(var(--secondary-foreground))",
                  },
                  destructive: {
                    DEFAULT: "hsl(var(--destructive))",
                    foreground: "hsl(var(--destructive-foreground))",
                  },
                  muted: {
                    DEFAULT: "hsl(var(--muted))",
                    foreground: "hsl(var(--muted-foreground))",
                  },
                  accent: {
                    DEFAULT: "hsl(var(--accent))",
                    foreground: "hsl(var(--accent-foreground))",
                  },
                  popover: {
                    DEFAULT: "hsl(var(--popover))",
                    foreground: "hsl(var(--popover-foreground))",
                  },
                  card: {
                    DEFAULT: "hsl(var(--card))",
                    foreground: "hsl(var(--card-foreground))",
                  },
                  warning: {
                    DEFAULT: "hsl(var(--warning))",
                    foreground: "hsl(var(--warning-foreground))",
                  },
                  success: {
                    DEFAULT: "hsl(var(--success))",
                    foreground: "hsl(var(--success-foreground))",
                  },
                },
                borderRadius: {
                  lg: `var(--radius)`,
                  md: `calc(var(--radius) - 2px)`,
                  sm: "calc(var(--radius) - 4px)",
                },
                fontFamily: {
                  sans: ["var(--font-sans)", ...defaultTheme.fontFamily.sans],
                },
              },
            },
            # Not compatible with importmaps
            plugins: [
              require("tailwindcss-animate"),
            ],
          }
        CODE
      end
    end
  end
end

module BreadcrumbsHelper
  Crumb = Struct.new(:label, :path)

  # Returns the breadcrumb trail for the current request, inferred from
  # controller#action. The "Home" root crumb is prepended automatically.
  # An empty array means "do not render any breadcrumbs" (e.g. on the
  # dashboard itself, where the trail would just be "Home" alone).
  def breadcrumb_trail
    crumbs = case "#{controller_name}##{action_name}"
    when "pages#home"
      []

    when "programs#index"
      [Crumb.new("Syllabuses", nil)]
    when "programs#show"
      [Crumb.new("Syllabuses", programs_path),
       Crumb.new(@program.title, nil)]

    when "subjects#index"
      [Crumb.new("Syllabuses", programs_path),
       Crumb.new(@program.title, program_path(@program.slug)),
       Crumb.new("Subjects", nil)]

    when "degree_plans#index"
      [Crumb.new("Plans", nil)]
    when "degree_plans#new", "degree_plans#create"
      [Crumb.new("Plans", degree_plans_path),
       Crumb.new("New plan", nil)]
    when "degree_plans#show"
      [Crumb.new("Plans", degree_plans_path),
       Crumb.new(@plan.title, nil)]
    when "degree_plans#edit", "degree_plans#update"
      [Crumb.new("Plans", degree_plans_path),
       Crumb.new(@plan.title, @plan),
       Crumb.new("Edit", nil)]

    when "sessions#new", "sessions#create"
      [Crumb.new("Sign in", nil)]
    when "registrations#new", "registrations#create"
      [Crumb.new("Create account", nil)]
    when "passwords#new", "passwords#create"
      [Crumb.new("Sign in", new_session_path),
       Crumb.new("Reset password", nil)]
    when "passwords#edit", "passwords#update"
      [Crumb.new("Sign in", new_session_path),
       Crumb.new("Set a new password", nil)]

    else
      []
    end

    crumbs.empty? ? [] : [Crumb.new("Home", root_path), *crumbs]
  end
end

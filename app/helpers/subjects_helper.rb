module SubjectsHelper
  # Colors lifted from legacy/v1-ktu-ece.html so the new app reads
  # consistently with the original visualization.
  CATEGORY_COLORS = {
    "math" => "#7F77DD",
    "sci"  => "#1D9E75",
    "esc"  => "#378ADD",
    "core" => "#D85A30",
    "cs"   => "#BA7517",
    "hmc"  => "#888780",
    "lab"  => "#D4537E",
    "proj" => "#639922",
    "elec" => "#993556",
    "mnc"  => "#d0cfc8"
  }.freeze

  def category_color(category)
    CATEGORY_COLORS.fetch(category, "#999")
  end
end

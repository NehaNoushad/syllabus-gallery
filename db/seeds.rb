# Seeds the KTU B.Tech ECE 2019-scheme curriculum.
# Source: legacy/v1-ktu-ece.html
#
# Re-runnable: clears existing ECE-2019 subjects first.

Subject.where(branch: "ECE", scheme: "2019").delete_all

SUBJECTS = [
  # ───── Semester 1 (17 cr) ─────
  { sem: 1, name: "Linear Algebra and Calculus",                    cr: 4, cat: "math", kind: "regular" },
  { sem: 1, name: "Engineering Physics / Chemistry",                cr: 4, cat: "sci",  kind: "regular" },
  { sem: 1, name: "Engineering Mechanics / Graphics",               cr: 3, cat: "esc",  kind: "regular" },
  { sem: 1, name: "Basics of Civil & Mech. / Elec. & Electronics",  cr: 4, cat: "esc",  kind: "regular" },
  { sem: 1, name: "Physics / Chemistry Lab",                        cr: 1, cat: "lab",  kind: "lab" },
  { sem: 1, name: "Civil & Mech. / Elec. Workshop",                 cr: 1, cat: "lab",  kind: "lab" },
  { sem: 1, name: "Life Skills",                                    cr: 0, cat: "mnc",  kind: "mnc" },

  # ───── Semester 2 (21 cr) ─────
  { sem: 2, name: "Vector Calculus, DEs and Transforms",            cr: 4, cat: "math", kind: "regular" },
  { sem: 2, name: "Engineering Physics A / Chemistry",              cr: 4, cat: "sci",  kind: "regular" },
  { sem: 2, name: "Engineering Mechanics / Graphics",               cr: 3, cat: "esc",  kind: "regular" },
  { sem: 2, name: "Basics of Civil & Mech. / Elec. & Electronics",  cr: 4, cat: "esc",  kind: "regular" },
  { sem: 2, name: "Programming in C",                               cr: 4, cat: "cs",   kind: "regular" },
  { sem: 2, name: "Physics / Chemistry Lab",                        cr: 1, cat: "lab",  kind: "lab" },
  { sem: 2, name: "Civil & Mech. / Elec. Workshop",                 cr: 1, cat: "lab",  kind: "lab" },
  { sem: 2, name: "Professional Communication",                     cr: 0, cat: "mnc",  kind: "mnc" },

  # ───── Semester 3 (22 cr) ─────
  { sem: 3, name: "Discrete Mathematical Structures",               cr: 4, cat: "math", kind: "regular" },
  { sem: 3, name: "Digital Systems and VLSI Design",                cr: 4, cat: "core", kind: "regular" },
  { sem: 3, name: "Electronic Devices and Circuits",                cr: 4, cat: "core", kind: "regular" },
  { sem: 3, name: "Data Structures",                                cr: 4, cat: "cs",   kind: "regular" },
  { sem: 3, name: "Design & Engineering / Professional Ethics",     cr: 2, cat: "esc",  kind: "regular" },
  { sem: 3, name: "Data Structures Lab",                            cr: 2, cat: "lab",  kind: "lab" },
  { sem: 3, name: "Digital Systems & VLSI Lab",                     cr: 2, cat: "lab",  kind: "lab" },
  { sem: 3, name: "Sustainable Engineering",                        cr: 0, cat: "mnc",  kind: "mnc" },

  # ───── Semester 4 (22 cr) ─────
  { sem: 4, name: "Probability, Random Process and Numerical Methods", cr: 4, cat: "math", kind: "regular" },
  { sem: 4, name: "Computer Organization and Architecture",         cr: 4, cat: "cs",   kind: "regular" },
  { sem: 4, name: "OOP using Java",                                 cr: 4, cat: "cs",   kind: "regular" },
  { sem: 4, name: "Integrated Circuits",                            cr: 4, cat: "core", kind: "regular" },
  { sem: 4, name: "Design & Engineering / Professional Ethics",     cr: 2, cat: "esc",  kind: "regular" },
  { sem: 4, name: "Integrated Circuits Lab",                        cr: 2, cat: "lab",  kind: "lab" },
  { sem: 4, name: "OOP Lab",                                        cr: 2, cat: "lab",  kind: "lab" },
  { sem: 4, name: "Constitution of India",                          cr: 0, cat: "mnc",  kind: "mnc" },

  # ───── Semester 5 (23 cr) ─────
  { sem: 5, name: "Digital Signal Processing",                      cr: 4, cat: "core", kind: "regular" },
  { sem: 5, name: "Microprocessors and Advanced Microcontrollers",  cr: 4, cat: "core", kind: "regular" },
  { sem: 5, name: "Computer Networks",                              cr: 4, cat: "cs",   kind: "regular" },
  { sem: 5, name: "Database Management Systems",                    cr: 4, cat: "cs",   kind: "regular" },
  { sem: 5, name: "Management of Software Systems",                 cr: 3, cat: "cs",   kind: "regular" },
  { sem: 5, name: "Computer Networking Lab",                        cr: 2, cat: "lab",  kind: "lab" },
  { sem: 5, name: "DBMS Lab",                                       cr: 2, cat: "lab",  kind: "lab" },
  { sem: 5, name: "Disaster Management",                            cr: 0, cat: "mnc",  kind: "mnc" },

  # ───── Semester 6 (23 cr) ─────
  { sem: 6, name: "Operating Systems",                              cr: 4, cat: "core", kind: "regular" },
  { sem: 6, name: "Embedded Systems & IoT",                         cr: 4, cat: "core", kind: "regular" },
  { sem: 6, name: "Data Communication and Networking",              cr: 4, cat: "core", kind: "regular" },
  { sem: 6, name: "Program Elective I",                             cr: 3, cat: "elec", kind: "elective_slot", group: "Program Elective I" },
  { sem: 6, name: "Industrial Economics and Foreign Trade",         cr: 3, cat: "hmc",  kind: "regular" },
  { sem: 6, name: "Comprehensive Course Work",                      cr: 1, cat: "cs",   kind: "regular" },
  { sem: 6, name: "Signal Processing Lab",                          cr: 2, cat: "lab",  kind: "lab" },
  { sem: 6, name: "Mini Project",                                   cr: 2, cat: "proj", kind: "project" },

  # ───── Semester 7 (15 cr) ─────
  { sem: 7, name: "CMOS VLSI Design",                               cr: 3, cat: "core", kind: "regular" },
  { sem: 7, name: "Program Elective II",                            cr: 3, cat: "elec", kind: "elective_slot", group: "Program Elective II" },
  { sem: 7, name: "Open Elective",                                  cr: 3, cat: "elec", kind: "elective_slot", group: "Open Elective" },
  { sem: 7, name: "Embedded Systems and IoT Lab",                   cr: 2, cat: "lab",  kind: "lab" },
  { sem: 7, name: "Seminar",                                        cr: 2, cat: "proj", kind: "project" },
  { sem: 7, name: "Project Phase I",                                cr: 2, cat: "proj", kind: "project" },
  { sem: 7, name: "Industrial Safety Engineering",                  cr: 0, cat: "mnc",  kind: "mnc" },

  # ───── Semester 8 (17 cr) ─────
  { sem: 8, name: "Algorithm Analysis and Design",                  cr: 3, cat: "cs",   kind: "regular" },
  { sem: 8, name: "Program Elective III",                           cr: 3, cat: "elec", kind: "elective_slot", group: "Program Elective III" },
  { sem: 8, name: "Program Elective IV",                            cr: 3, cat: "elec", kind: "elective_slot", group: "Program Elective IV" },
  { sem: 8, name: "Program Elective V",                             cr: 3, cat: "elec", kind: "elective_slot", group: "Program Elective V" },
  { sem: 8, name: "Comprehensive Viva Voce",                        cr: 1, cat: "cs",   kind: "regular" },
  { sem: 8, name: "Project Phase II — Major Project",               cr: 4, cat: "proj", kind: "project" }
]

SUBJECTS.each do |row|
  Subject.create!(
    name:           row[:name],
    credits:        row[:cr],
    category:       row[:cat],
    kind:           row[:kind],
    semester:       row[:sem],
    elective_group: row[:group],
    branch:         "ECE",
    scheme:         "2019"
  )
end

puts "Seeded #{Subject.count} subjects."

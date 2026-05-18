# Seeds the KTU B.Tech ECE 2024-scheme curriculum.
# Source: KTU ECE syllabus per Neha's authoritative reference (2026-05-17).
# Re-runnable: clears existing ECE-2024 subjects first.

Subject.where(branch: "ECE", scheme: "2024").delete_all

SUBJECTS = [
  # ───── Semester 1 (17 cr) ─────
  { sem: 1, code: "MAT 101",            name: "Linear Algebra and Calculus",                                cr: 4, cat: "math", kind: "regular" },
  { sem: 1, code: "PHT 100 / CYT 100",  name: "Engineering Physics / Chemistry",                            cr: 4, cat: "sci",  kind: "regular" },
  { sem: 1, code: "EST 100 / EST 110",  name: "Engineering Mechanics / Engineering Graphics",               cr: 3, cat: "esc",  kind: "regular" },
  { sem: 1, code: "EST 120 / EST 130",  name: "Basics of Civil & Mech. / Elec. & Electronics",              cr: 4, cat: "esc",  kind: "regular" },
  { sem: 1, code: "HUN 101",            name: "Life Skills",                                                cr: 0, cat: "hmc",  kind: "regular" },
  { sem: 1, code: "PHL 120 / CYL 120",  name: "Engineering Physics / Chemistry Lab",                        cr: 1, cat: "lab",  kind: "lab" },
  { sem: 1, code: "ESL 120 / ESL 130",  name: "Civil & Mech. / Elec. & Electronics Workshop",               cr: 1, cat: "lab",  kind: "lab" },

  # ───── Semester 2 (21 cr) ─────
  { sem: 2, code: "MAT 102",            name: "Vector Calculus, Differential Equations and Transforms",     cr: 4, cat: "math", kind: "regular" },
  { sem: 2, code: "PHT 100 / CYT 100",  name: "Engineering Physics / Chemistry",                            cr: 4, cat: "sci",  kind: "regular" },
  { sem: 2, code: "EST 100 / EST 110",  name: "Engineering Mechanics / Engineering Graphics",               cr: 3, cat: "esc",  kind: "regular" },
  { sem: 2, code: "EST 120 / EST 130",  name: "Basics of Civil & Mech. / Elec. & Electronics",              cr: 4, cat: "esc",  kind: "regular" },
  { sem: 2, code: "HUN 102",            name: "Professional Communication",                                 cr: 0, cat: "hmc",  kind: "regular" },
  { sem: 2, code: "EST 102",            name: "Programming in C",                                           cr: 4, cat: "cs",   kind: "regular" },
  { sem: 2, code: "PHL 120 / CYL 120",  name: "Engineering Physics / Chemistry Lab",                        cr: 1, cat: "lab",  kind: "lab" },
  { sem: 2, code: "ESL 120 / ESL 130",  name: "Civil & Mech. / Elec. & Electronics Workshop",               cr: 1, cat: "lab",  kind: "lab" },

  # ───── Semester 3 (22 cr) ─────
  { sem: 3, code: "MAT 203",            name: "Discrete Mathematical Structures",                           cr: 4, cat: "math", kind: "regular" },
  { sem: 3, code: "CST 201",            name: "Data Structures",                                            cr: 4, cat: "cs",   kind: "regular" },
  { sem: 3, code: "ERT 203",            name: "Digital Systems and VLSI Design",                            cr: 4, cat: "core", kind: "regular" },
  { sem: 3, code: "ERT 205",            name: "Electronic Devices and Circuits",                            cr: 4, cat: "core", kind: "regular" },
  { sem: 3, code: "EST 200 / HUT 200",  name: "Design and Engineering / Professional Ethics",               cr: 2, cat: "esc",  kind: "regular" },
  { sem: 3, code: "MCN 201",            name: "Sustainable Engineering",                                    cr: 0, cat: "hmc",  kind: "regular" },
  { sem: 3, code: "CSL 201",            name: "Data Structures Lab",                                        cr: 2, cat: "lab",  kind: "lab" },
  { sem: 3, code: "ERL 201",            name: "Digital Systems and VLSI Design Lab",                        cr: 2, cat: "lab",  kind: "lab" },
  { sem: 3, code: "VAC",                name: "Remedial / Minor / Honours",                                 cr: 0, cat: "elec", kind: "vac" },

  # ───── Semester 4 (22 cr) ─────
  { sem: 4, code: "MAT 204",            name: "Probability, Random Process and Numerical Methods",          cr: 4, cat: "math", kind: "regular" },
  { sem: 4, code: "CST 202",            name: "Computer Organization and Architecture",                     cr: 4, cat: "cs",   kind: "regular" },
  { sem: 4, code: "ERT 204",            name: "Object Oriented Programming using Java",                     cr: 4, cat: "cs",   kind: "regular" },
  { sem: 4, code: "ERT 206",            name: "Integrated Circuits",                                        cr: 4, cat: "core", kind: "regular" },
  { sem: 4, code: "EST 200 / HUT 200",  name: "Design and Engineering / Professional Ethics",               cr: 2, cat: "esc",  kind: "regular" },
  { sem: 4, code: "MCN 202",            name: "Constitution of India",                                      cr: 0, cat: "hmc",  kind: "regular" },
  { sem: 4, code: "ERL 202",            name: "Integrated Circuits Lab",                                    cr: 2, cat: "lab",  kind: "lab" },
  { sem: 4, code: "ERL 204",            name: "Object Oriented Programming Lab",                            cr: 2, cat: "lab",  kind: "lab" },
  { sem: 4, code: "VAC",                name: "Remedial / Minor / Honours",                                 cr: 0, cat: "elec", kind: "vac" },

  # ───── Semester 5 (23 cr) ─────
  { sem: 5, code: "ERT 301",            name: "Digital Signal Processing",                                  cr: 4, cat: "core", kind: "regular" },
  { sem: 5, code: "CST 303",            name: "Computer Networks",                                          cr: 4, cat: "cs",   kind: "regular" },
  { sem: 5, code: "ERT 305",            name: "Database Management Systems",                                cr: 4, cat: "cs",   kind: "regular" },
  { sem: 5, code: "ERT 307",            name: "Microprocessors and Advanced Microcontrollers",              cr: 4, cat: "core", kind: "regular" },
  { sem: 5, code: "CST 309",            name: "Management of Software Systems",                             cr: 3, cat: "cs",   kind: "regular" },
  { sem: 5, code: "MCN 301",            name: "Disaster Management",                                        cr: 0, cat: "hmc",  kind: "regular" },
  { sem: 5, code: "ERL 331",            name: "Computer Networking Lab",                                    cr: 2, cat: "lab",  kind: "lab" },
  { sem: 5, code: "CSL 333",            name: "DBMS Lab",                                                   cr: 2, cat: "lab",  kind: "lab" },
  { sem: 5, code: "VAC",                name: "Remedial / Minor / Honours",                                 cr: 0, cat: "elec", kind: "vac" },

  # ───── Semester 6 (23 cr) ─────
  { sem: 6, code: "ERT 302",            name: "Operating Systems",                                          cr: 4, cat: "cs",   kind: "regular" },
  { sem: 6, code: "ERT 304",            name: "Embedded Systems & IoT",                                     cr: 4, cat: "core", kind: "regular" },
  { sem: 6, code: "ERT 306",            name: "Data Communication and Networking",                          cr: 4, cat: "core", kind: "regular" },
  { sem: 6, code: "ERT-XXX",            name: "Program Elective I",                                         cr: 3, cat: "elec", kind: "elective_slot", group: "Program Elective I" },
  { sem: 6, code: "HUT 300",            name: "Industrial Economics and Foreign Trade",                     cr: 3, cat: "hmc",  kind: "regular" },
  { sem: 6, code: "ERT 308",            name: "Comprehensive Course Work",                                  cr: 1, cat: "core", kind: "regular" },
  { sem: 6, code: "ERL 332",            name: "Signal Processing Lab",                                      cr: 2, cat: "lab",  kind: "lab" },
  { sem: 6, code: "ERD 334",            name: "Mini Project",                                               cr: 2, cat: "proj", kind: "project" },
  { sem: 6, code: "VAC",                name: "Remedial / Minor / Honours",                                 cr: 0, cat: "elec", kind: "vac" },

  # ───── Semester 7 (15 cr) ─────
  { sem: 7, code: "ERT 401",            name: "CMOS VLSI Design",                                           cr: 3, cat: "core", kind: "regular" },
  { sem: 7, code: "ERT-XXX",            name: "Program Elective II",                                        cr: 3, cat: "elec", kind: "elective_slot", group: "Program Elective II" },
  { sem: 7, code: "ERT-XXX",            name: "Open Elective",                                              cr: 3, cat: "elec", kind: "elective_slot", group: "Open Elective" },
  { sem: 7, code: "MCN 401",            name: "Industrial Safety Engineering",                              cr: 0, cat: "hmc",  kind: "regular" },
  { sem: 7, code: "ERL 411",            name: "Embedded Systems and IoT Lab",                               cr: 2, cat: "lab",  kind: "lab" },
  { sem: 7, code: "ERQ 413",            name: "Seminar",                                                    cr: 2, cat: "proj", kind: "project" },
  { sem: 7, code: "ERD 415",            name: "Project Phase I",                                            cr: 2, cat: "proj", kind: "project" },
  { sem: 7, code: "VAC",                name: "Remedial / Minor / Honours",                                 cr: 0, cat: "elec", kind: "vac" },

  # ───── Semester 8 (17 cr) ─────
  { sem: 8, code: "ERT 402",            name: "Algorithm Analysis and Design",                              cr: 3, cat: "cs",   kind: "regular" },
  { sem: 8, code: "ERT-XXX",            name: "Program Elective III",                                       cr: 3, cat: "elec", kind: "elective_slot", group: "Program Elective III" },
  { sem: 8, code: "ERT-XXX",            name: "Program Elective IV",                                        cr: 3, cat: "elec", kind: "elective_slot", group: "Program Elective IV" },
  { sem: 8, code: "ERT-XXX",            name: "Program Elective V",                                         cr: 3, cat: "elec", kind: "elective_slot", group: "Program Elective V" },
  { sem: 8, code: "ERT 404",            name: "Comprehensive Viva Voce",                                    cr: 1, cat: "core", kind: "regular" },
  { sem: 8, code: "ERD 416",            name: "Project Phase II — Major Project",                           cr: 4, cat: "proj", kind: "project" },
  { sem: 8, code: "VAC",                name: "Remedial / Minor / Honours",                                 cr: 0, cat: "elec", kind: "vac" }
]

SUBJECTS.each do |row|
  Subject.create!(
    name:           row[:name],
    code:           row[:code],
    credits:        row[:cr],
    category:       row[:cat],
    kind:           row[:kind],
    semester:       row[:sem],
    elective_group: row[:group],
    branch:         "ECE",
    scheme:         "2024"
  )
end

puts "Seeded #{Subject.count} subjects " \
     "(#{Subject.where(kind: 'elective_slot').count} elective slots, " \
     "#{Subject.where(kind: 'vac').count} VAC entries)."

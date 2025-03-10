# -------------------------------------------------------------------------
# GerminaR-----------------------------------------------------------------
# -------------------------------------------------------------------------
#> open https://flavjack.github.io/GerminaR/
#> open https://flavjack.shinyapps.io/germinaquant/
#> author .: Flavio Lozano-Isla (lozanoisla.com)
#> date .: 2024-10-18
# -------------------------------------------------------------------------

# -------------------------------------------------------------------------
# packages ----------------------------------------------------------------
# -------------------------------------------------------------------------

#> devtools::install_github("flavjack/GerminaR")

source("msgs.R")
suppressPackageStartupMessages({source("pkgs.R")})

# app ---------------------------------------------------------------------
# -------------------------------------------------------------------------

shinyUI(dashboardPage(skin = "green", 

    dashboardHeader(title = "GerminaQuant • app",
                    
                    tags$li(class="dropdown", tags$a(href="https://github.com/sponsors/flavjack", icon("heart"), target="_blank")), 
                    tags$li(class="dropdown", tags$a(href="https://germinar.inkaverse.com/news/" , paste("GerminaR", packageVersion('GerminaR')), target="_blank"))
                    
                    ),
    
# Sider -------------------------------------------------------------------

    dashboardSidebar(

      sidebarMenu(
        menuItem("Presentacion", tabName = "intro", icon = icon("home")),
        menuItem("Fieldbook", tabName = "fieldbook", icon = icon("file-alt")),
        menuItem("Germination", tabName = "germination", icon = icon("seedling")),
        menuItem("Exploratory", tabName = "outlier", icon = icon("search")),
        menuItem("Statistics", tabName = "stat", icon = icon("chart-pie")),
        menuItem("Graphics", tabName = "graph", icon = icon("tint")),
        menuItem("InTime", tabName = "germint", icon = icon("hourglass")),
        menuItem("Tools", tabName = "tools", icon = icon("wrench"))
      )

    ),

    dashboardBody(

      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
      ),
      
      tags$head(includeHTML(("www/analytics.html"))),
      tags$head(tags$link(rel="shortcut icon", href="https://flavjack.github.io/GerminaR/reference/figures/logo.png")),

      meta() %>%
        meta_social(
          title = "GerminaR",
          description = "Indices and Graphics for Assess Seed Germination Process",
          url = "https://flavjack.shinyapps.io/germinaquant/",
          image = "https://flavjack.github.io/GerminaR/reference/figures/logo.png",
          image_alt = "GerminaR"
        ), 

      tabItems(

# presentation ------------------------------------------------------------
# -------------------------------------------------------------------------

        tabItem(tabName = "intro",

                shiny::fluidRow(

                box(
                  title = "GerminaQuant",
                  width = 3,
                  status = "primary",
                  solidHeader = T,
                  
                  HTML('
                  <p>
                  <strong>GerminaQuant</strong> for R is a web application based in R,
                  you can use the app in your desktop installing the <em><strong>GerminaR</strong></em> package:
                  </p>
                  Install the package in the R console
                  <br>
                  <code>install.packages("GerminaR")</code>
                  <br>
                  <br>
                  For use the interactive app 
                  <br>
                  <code>GerminaR::GerminaQuant()</code>
                  <br>
                  <br>
                  
                  <div id=footer style="width:100%; margin:auto;">

                  <div style="display:inline-block; width:48%">
                  <p style="text-align:center">
                  <a target="_blank" href="https://flavjack.github.io/GerminaR/"><img src="https://pkgdown.r-lib.org/reference/figures/logo.png" style="height:75px" title="GerminaR" alt="GerminaR"></a> 
                  <span style="display:block;"><small>GerminaR</small></span>
                  </p></div>
                  
                  <div style="display:inline-block; width:48%">
                  <p style="text-align:center">
                  <a target="_blank" href="https://youtube.com/playlist?list=PLSQMdOu57lj9QUoA6JLuv0nBTYacuyrbg"><img src="https://lozanoisla.com/img/youtube.png" style="height:70px" title="Demo" alt="Demo"></a> 
                  <span style="display:block;"><small>Demo</small></span>
                  </p></div>
              
                  </div>
                    
                  ')

                ),

                box(width = 5, 
                    title = "Characteristics", 
                    status = "danger",
                    solidHeader = T,
                    
                    HTML('

<p><strong>GerminaQuant for R</strong> builds upon the foundation of the GerminaR R package, an interactive data analysis platform specifically designed for germination analysis. Developed for the Plant Physiology Laboratory at UFPE, GerminaQuant reflects a continuous effort to enhance data collection, improve data quality, streamline analysis processes, and promote open access publication. This latest iteration incorporates the best practices derived from extensive experience in germination data management.</p>

<p>One of the key innovations of this platform is its web-based interface, which offers a highly interactive environment for users. The software can be used both online and offline, and is compatible with desktop computers, tablets, and laptops. Its primary aim is to support the broader research community engaged in all aspects of germination studies.</p>

<p><strong>Features:</strong></p>
<ul>
  - Calculation of key germination indices.
  <br>
  - Statistical analysis tailored for germination data.
  <br>
  - User-friendly tools for generating visual representations of results.
</ul>
                    
                  ')
                    
                ),
                    
                box(
                  title = "Package Info",
                  width = 4,
                  status = "success",
                  solidHeader = T,

                  p(strong("Publication")),
                  
                  HTML('
                  
<p>Lozano‐Isla, F., Benites‐Alfaro, O. E., & Pompelli, M. F. (2019). GerminaR: An R package for germination analysis with the interactive web application “GerminaQuant for R”. <em>Ecological Research</em>, <strong>34</strong>(2), 339-346. <a href="https://doi.org/10.1111/1440-1703.1275">https://doi.org/10.1111/1440-1703.1275</a></p>
                       
                       '),
                  
                  br(),
                  
                  HTML('
                       
                      <div id=footer style="width:100%; margin:auto;">

                      <div style="display:inline-block; width:32%">
                      <p style="text-align:center">
                      <a target="_blank" href="https://github.com/Flavjack/GerminaR"><img src="https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png" style="height:95px" title="Github" alt="Github"></a>
                      <span style="display:block;"><small>Github</small></span>
                      </p></div>
                      
                      <div style="display:inline-block; width:32%">
                      <p style="text-align:center">
                      <a target="_blank" href="https://doi.org/10.32614/CRAN.package.GerminaR"><img src="https://flavjack.github.io/GerminaR/reference/figures/logo.png" style="height:80px" title="R cran" alt="GerminaR"></a> 
                      <span style="display:block;"><small>CRAN</small></span>
                      </p></div>
                  
                      <div style="display:inline-block; width:32%">
                      <p style="text-align:center">
                      <a target="_blank" href="https://flavjack.shinyapps.io/germinaquant/"><img src="https://flavjack.github.io/GerminaR/img/GerminaQuant.png" style="height:80px" title="GerminaQuant" alt="GerminaQuant for R"></a>
                      <span style="display:block;"><small>GerminaQuant</small></span>
                      </p></div>
                      
                      </div>
                       
                       '),

                  hr(),
                  
                  HTML('<p>If you have any question, comment or suggestion you can write at <a href="mailto:flozanoisla@gmail.com">flozanoisla@gmail.com</a></p>')

                )
                
                )

        ),

# fieldbook -------------------------------------------------------------

        tabItem(tabName = "fieldbook",

        box(
          
          status = "info",
          width = 12,
          background = "black"
          , height = "120px",


          column(width = 6,

           h4(icon("google"), "Google SpreadSheet (URL)", width = "100%"),

           textInput("import_gsheet",
             label = NULL ,
             width = "100%",
             value = "https://docs.google.com/spreadsheets/d/1QziIXGOwb8cl3GaARJq6Ez6aU7vND_UHKJnFcAKx0VI/edit#gid=137089581")

          ),

          column(width = 4,

            h4(icon("file-excel"), "Excel file (.xlsx)", width = "100%"),

            fileInput('import_excel'
                      , multiple = FALSE
                      , label = NULL
                      , accept = c(".xlsx")
                      )

          ),

          column(width = 1,

            h4("Sheet", width = "100%"),

            numericInput("sheetdt", label = NULL, value = 1, step = 1, min = 1)

          ),

          column(width = 1,

            h4( "Update", width = "100%"),

            actionButton(inputId = "reload", label = "", icon("sync"), width = "100%")

          )

        ),

        shiny::fluidRow(

        box(

          status = "danger",
          solidHeader = T,
          width = 10,

          htmlOutput("data_viewer")

        ),

# Germination parameters --------------------------------------------------

        box(
          
          status = "danger",
          solidHeader = T,
          width = 2,
          title = 'Parameters',

          textInput("SeedN", label = strong("Seeds (column name)"), value = "seeds"),
          
          textInput("evalName", label = strong("Evaluations (prefix)"), value = "D")
          
          )
          
        )

        ),

# Germination analisys ----------------------------------------------------

        tabItem(tabName = "germination",
                
        shiny::fluidRow(
          
          box(width = 12,
              
              DT::dataTableOutput("summary"),
              
              br(),
              
              actionButton(inputId= 'indicesLink', label = "Indices info"
                           , icon = icon("seedling")
                           , onclick ="window.open('https://germinar.inkaverse.com/articles/introduction.html', '_blank')"
                           )
              
          )   
          
        )

        ),

# outliers ----------------------------------------------------------------

        tabItem(tabName = "outlier",

          box(width = 6, background = "black",

                    column(width = 4,

                      uiOutput("bpy")

                    ),

                    column(width = 4,

                      uiOutput("bpx")

                    ),

                    column(width = 4,

                      uiOutput("bpz")

                    ),

                    column(width = 4,

                      textInput(inputId ="bply", label = "Y label", value = "")


                    ),

                    column(width = 4,

                      textInput(inputId ="bplx", label = "X label", value = "")

                    ),

                    column(width = 4,

                      textInput(
                        inputId ="bplz",
                        label = "Legend label",
                        value = "")


                    )

          ),

          box(width = 3, background = "black",


            column(width = 6,

              textInput(
                inputId ="bpbrk"
                , label = "Y limits"
                , value = NULL
                , placeholder = "0*100*20"
                )

            ),
            
            column(width = 6,
                   
                   textInput(
                     inputId ="bprot"
                     , label = "X rotation"
                     , value = "0*0.5*0.5"
                     , placeholder = "angle*h*v"
                   )
                   
            ),

            column(width = 12,
              
              textInput(
                inputId ="bpopt"
                , label = "Opt"
                , placeholder = "extra layer"
                )
            )

            ),
          
          
          box(width = 3, background = "black",
              
              
              column(width = 6,
                     
                     numericInput(
                       inputId ="bpwd"
                       , label = "Width (cm)"
                       , value = 20
                       , step = 2
                     )
                     
              ),
              
              column(width = 6,
                     
                     numericInput(
                       inputId = "bphg"
                       , label = "Height (cm)"
                       , value = 10
                       , step = 2
                     )
                     
              ),
              
              column(width = 6,
                     
                     numericInput(
                       inputId ="bprs"
                       , label = "Resolution (dpi)"
                       , value = 100
                       , step = 50
                     )
                     
              ),
              
              column(width = 6,
                     
                     selectInput(
                       inputId = "bplg"
                       , label = "Legend"
                       , choices = c("top", "bottom", "left", "right", "none")
                       )
                     ),
              ),
          
          shiny::fluidRow(
          
          box(width = 12,
              
              div(imageOutput("boxplot"), align = "center")

          )
          
          )

        ),

# statistics -------------------------------------------------------------

        tabItem(tabName = "stat",
                
          shiny::fluidRow(

          box(width = 5, background = "black",
              
            column(width = 5,
              
              radioButtons(inputId = "stat_model"
                           , label = "Model parameters"
                           , choices = c("auto", "manual")
                           , inline = TRUE
                           )
              
            ),
            
            column(width = 7, 
                   
                   br(),
                   
                   verbatimTextOutput("model_formula")
                   
            ),
            
            column(width = 12,
                   
                   uiOutput("stat_response")
                   
                   ),
            

            
            hr(),
            
            conditionalPanel(
              
              condition = "input.stat_model == 'auto'",
              
              column(width = 8,
                     
                     uiOutput("stat_factor")
                     
                     ),
              
              column(width = 4,
                     
                     uiOutput("stat_block")
                     
                     ),
              
              ),
            
            conditionalPanel(
              
              condition = "input.stat_model == 'manual'",
              
              column(width = 12,
                     
                     textInput(inputId = "stat_model_factors"
                               , label = "Experiment model factors"
                               , placeholder = "e.g. block + factor1*factor2"
                     )
              ),
              
            ),
            
            column(width = 6,
                   
                   uiOutput("stat_comparison")
                   
                   ),
            
            column(width = 3,

              numericInput("stsig",
                label = "Significance",
                value = 0.05,
                min = 0,
                max = 5,
                step = 0.01)
              ),

            column(width = 3,

              selectInput("stmc",
                label = "Type",
                choices = c("tukey", "duncan", "snk"),
                selected = "snk")

            ),

            column(width = 12,

                verbatimTextOutput("tbav")

            ),
            
            column(width = 12,
                   
                   DT::dataTableOutput("stat_summary")
            )

          ),
    
          box(width = 7,
            
              box(title = "Summary table", 
                  solidHeader = T,
                  width = 12, 
                  collapsible = T,
                  collapsed = T,
                  status = "primary",
                  
                  DT::dataTableOutput("mnc")
                  
                  ),
              
              box(title = "Model diagnostic", 
                  solidHeader = T,
                  width = 12, 
                  collapsible = T,
                  collapsed = T,
                  status = "danger",
                  
           plotOutput("modelplots")

              )
            
          )
          
          )

          
        ),

# graphics ----------------------------------------------------------------
# -------------------------------------------------------------------------

        tabItem(tabName = "graph",
                
          fluidRow(
                
          column( width = 12,

            box(width = 6, title = NULL, background = "blue",
                
                column(width = 4,
                       
                       textInput(
                          inputId ="plot_ylab",
                          label = "Y label")

                      ),
                
                column(width = 4,

                        textInput(inputId ="plot_xlab", label = "X label")

                      ),
                
                column(width = 4,
                       
                       textInput(inputId ="plot_glab"
                                 , label = "Group label")
                       
                ),
                
                
                column(width = 4, 
                       
                       HTML("<b>Model</b>"),
                       
                       br(),
                       br(),
                       
                       textOutput("graph_formula")
                       
                ),
                
                column(width = 4,

                        textInput(inputId ="plot_xbrakes"
                                  , label = "X brake labels (,)")

                      ),
                
                column(width = 4,

                      textInput(inputId ="plot_gbrakes"
                                , label = "Group brake labels (,)")

                    ),
                
              ),


            
            box(width = 3, background = "black",
                
                
                column(width = 6,
                       
                       textInput(
                         inputId ="plot_ylimits"
                         , label = "Y limits"
                         , value = NULL
                         , placeholder = "0*100*20"
                       )
                       
                ),
                
                column(width = 6,
                       
                       textInput(
                         inputId ="plot_xrotation"
                         , label = "X rotation"
                         , value = "0*0.5*0.5"
                         , placeholder = "angle*h*v"
                       )
                       
                ),
                
                column(width = 12,
                       
                       textInput(
                         inputId ="plot_opt"
                         , label = "Opt"
                         , placeholder = "extra layer"
                       )
                )
                
            ),
            
            box(width = 3, background = "black",
                
                column(width = 6,
                       
                       numericInput(
                         inputId ="plot_width"
                         , label = "Width (cm)"
                         , value = 20
                         , step = 2
                       )
                       
                ),
                
                column(width = 6,
                       
                       numericInput(
                         inputId = "plot_height"
                         , label = "Height (cm)"
                         , value = 10
                         , step = 2
                       )
                       
                ),
                
                column(width = 6,
                       
                       numericInput(
                         inputId ="plot_res"
                         , label = "Resolution (dpi)"
                         , value = 100
                         , step = 50
                       )
                       
                ),
                
                column(width = 6,
                       
                       selectInput(
                         inputId = "plot_legend"
                         , label = "Legend"
                         , choices = c("top"
                                       , "bottom"
                                       , "left"
                                       , "right"
                                       , "none")
                       )
                ),
            ),
            
            shiny::fluidRow(
              
              box(width = 10,
                  
                  div(imageOutput("plotgr"), align = "center")
                  
              ), 
              
              column(width = 2,

                column(width = 12,

                  radioButtons(
                    inputId ="plot_type",
                    label = "Type",
                    choices = c("bar", "line"),
                    inline = TRUE
                    )
                ),

                column(width = 12,

                  radioButtons(
                    inputId ="plot_color",
                    label = "Color",
                    choices = c("yes"
                                , "no" = "none"
                                ),
                    inline = TRUE)
                ),

                column(width = 12,

                  radioButtons(
                    inputId ="plot_sig",
                    label = "Significance",
                    choices = c("yes" = "sig"
                                , "no" = "none"
                                ),
                    inline = TRUE)
                ),

                column(width = 12,

                  radioButtons(
                    inputId ="plot_error",
                    label = "Error",
                    choices = c("ste"
                                , "std"
                                , "no" = "none"
                                ),
                    inline = TRUE)
                )

              )
              
            )
            
            )
          
          )

        ),

# Germination in time -----------------------------------------------------
# -------------------------------------------------------------------------

tabItem(tabName = "germint",
        
        
        fluidRow(
          
          column( width = 12,
                  
                  box(width = 6, title = NULL, background = "blue",
                      
                      column(width = 4,
                             
                             textInput(
                               inputId ="intime_ylab",
                               label = "Y label"
                               , value = "Germination ('%')")
                             
                      ),
                      
                      column(width = 4,
                             
                             textInput(inputId ="intime_xlab"
                                       , label = "X label"
                                       , value = "Time")
                             
                      ),
                      
                      column(width = 4,
                             
                             textInput(inputId ="intime_glab"
                                       , label = "Group label")
                             
                      ),
                      
                      
                      column(width = 4,
                             
                             uiOutput('smvar')
                             
                             ),
                      
                      column(width = 4,
                             
                             # textInput(inputId ="intime_xbrakes"
                             #           , label = "X brake labels (,)"
                             #           )
                             
                      ),
                      
                      column(width = 4,
                             
                             textInput(inputId ="intime_gbrakes"
                                       , label = "Group brake labels (,)")
                             
                             ),
                      
                      ),
                  
                  
                  
                  box(width = 3, background = "black",
                      
                      
                      column(width = 6,
                             
                             textInput(
                               inputId ="intime_ylimits"
                               , label = "Y limits"
                               , value = NULL
                               , placeholder = "0*100*20"
                             )
                             
                      ),
                      
                      column(width = 6,
                             
                             textInput(
                               inputId ="intime_xrotation"
                               , label = "X rotation"
                               , value = "0*0.5*0.5"
                               , placeholder = "angle*h*v"
                             )
                             
                      ),
                      
                      column(width = 12,
                             
                             textInput(
                               inputId ="intime_opt"
                               , label = "Opt"
                               , placeholder = "extra layer"
                             )
                      )
                      
                  ),
                  
                  box(width = 3, background = "black",
                      
                      column(width = 6,
                             
                             numericInput(
                               inputId ="intime_width"
                               , label = "Width (cm)"
                               , value = 20
                               , step = 2
                             )
                             
                      ),
                      
                      column(width = 6,
                             
                             numericInput(
                               inputId = "intime_height"
                               , label = "Height (cm)"
                               , value = 10
                               , step = 2
                             )
                             
                      ),
                      
                      column(width = 6,
                             
                             numericInput(
                               inputId ="intime_res"
                               , label = "Resolution (dpi)"
                               , value = 100
                               , step = 50
                             )
                             
                      ),
                      
                      column(width = 6,
                             
                             selectInput(
                               inputId = "intime_legend"
                               , label = "Legend"
                               , choices = c("top"
                                             , "bottom"
                                             , "left"
                                             , "right"
                                             , "none")
                             )
                      ),
                  ),
                  
                  shiny::fluidRow(
                    
                    box(width = 10,
                        
                        div(imageOutput("intime_plot"), align = "center")
                        
                    ), 
                    
                    column(width = 2,
                           
                           column(width = 12,
                                  
                                  radioButtons(
                                    inputId ="intime_type",
                                    label = "Type",
                                    choices = c("percentage", "relative"),
                                    selected = "percentage",
                                    inline = F)
                           ),
                           
                           column(width = 12,
                                  
                                  radioButtons(
                                    inputId ="intime_color",
                                    label = "Color",
                                    choices = c("yes"
                                                , "no" = "none"
                                    ),
                                    inline = TRUE)
                           ),
                           
                           column(width = 12,
                                  
                                  radioButtons(
                                    inputId ="intime_error",
                                    label = "Error",
                                    choices = c("ste"
                                                , "std"
                                                , "no" = "none"
                                                ),
                                    inline = TRUE)
                           )
                           
                    )
                    
                  )
                  
          )
          
        )
        
),

# tools -------------------------------------------------------------------

        tabItem(tabName = "tools", withMathJax(),
                
                
                shiny::fluidRow(
                  
                box(width = 7, 
                    title = "Osmotic potencial", 
                    status = "primary",
                    solidHeader = T,
                    
                    br(),
                    
                    p("The osmotic potencial, can be measured directly with an osmometer, or it can be calculated from the solute concentration."),
                    
                    hr(),
                    
                    p("For a salt, you can use the van't Hoff relation: $$\\psi_s = -RTC_i$$ where: \\(R\\) is the gas constant (i.e. \\(0.0083 L/atm/mol/K\\)), \\(T\\) is the absolute temperature in degrees in Kelvin (\\(273.15^{o}C\\)), 
                      \\(C\\) is the solute concentration in \\(mol*L^{-1}\\), and \\(i\\) is the dissociation constant of the salt. (i.e. \\(NaCl = 1.8, KCl = 1.8, CaCl_2 = 2.4, sacarose = 1\\)). The unit for \\(\\psi_s\\) is \\(MPa\\)"), 
                    
                    hr(),
                    
                    p("For", em("PEG-6000"), "the osmotic potentials can be calculated as described by", a("Michel and Kaufmann (1973):", href = "http://www.plantphysiol.org/content/51/5/914.abstract", target="_blank"), "$$\\psi_s = -(1.18*10^{-2})C - (1.18*10^{-4})C^2 + (2.67*10^{-4})CT + (8.39*10^{-7})C^2T$$ 
                      where: \\(C\\) is the concentration of", em("PEG-6000"), "in \\(g*L^{-1}\\) and \\(T\\) is the temperature in degrees \\(^{o}C\\).  The unit for \\(\\psi_s\\) is \\(bar (0.1 MPa)\\)."),
                    
                    br()
                    
                    ),
                
                box(
                  title = "Calculator", 
                  status = "info", 
                  solidHeader = T,
                  width = 5,
                  
                  column(width = 12,
                         
                         h2(textOutput("ops")),
                         tags$style(type="text/css", "#ops { height: 50px; width: 100%; text-align:center; font-size: 35px;}")
                         
                  ),
                  
                  column(width = 12,
                         
                         radioGroupButtons(
                           inputId = "tool_osmp",  
                           status = "primary", 
                           justified = TRUE,
                           individual = TRUE,
                           choiceNames = list("Salt", "PEG-6000"),
                           choiceValues =  list("salt", "peg6000"), 
                           selected = "salt", 
                           checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                         ),
                         
                         
                         numericInput("vol", label = p("Volume (\\(litres\\))"), value = 1.0, min = 0),
                         
                         numericInput("pres", label = p("Pressure (\\(MPa\\))"), value = -0.05, max = 0),
                         
                         numericInput("temp", label = p("Temperature (\\(^{o}C\\))"), value = 25.0),
                         
                         
                  ),
                  
                  conditionalPanel(
                    
                    
                    condition = "input.tool_osmp == 'salt'",
                    
                    column(width = 6,
                           
                           numericInput("psm", label = p("Molecular weight"), value = 58.4428, min = 0)
                           
                    ),
                    
                    column(width = 6,
                           
                           numericInput("dis", label = p("Salt dissociation constant"), value = 1.8, min = 0)
                           
                           
                    )
                    
                    
                  ),
                  
                )
                
            )
                
                
          )

      )

    )

  )
)




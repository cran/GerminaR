#' Plot line or bar graphic
#'
#' @description Function use the dtsm function for plot the results
#' @param data Output from ger_testcomp function
#' @param type Type of graphic. "bar" or "line"
#' @param x Axis x variable
#' @param y Axis y variable
#' @param group Group variable
#' @param ylab Title for the axis y
#' @param xlab Title for the axis x
#' @param glab Title for the legend
#' @param ylimits limits of the y axis
#' @param xrotation Rotation in x axis c(angle, h, v)
#' @param xtext Text labels in x axis
#' @param gtext Text labels in groups
#' @param legend the position of legends ("none", "left", "right", "bottom", "top", or two-element numeric vector)
#' @param sig Column with the significance
#' @param sigsize Font size in significance letters
#' @param error Show the error bar ("ste" or "std").
#' @param color colored figure c(TRUE, FALSE) or vector with the color. 
#' @param opt Add news layer to the plot
#' @return Line o bar plot
#' @import dplyr
#' @importFrom grDevices colorRampPalette colors
#' @importFrom tibble deframe
#' @importFrom grDevices gray.colors
#' @import ggplot2
#' @export
#' 
#' @examples  
#' 
#' \dontrun{
#' 
#' library(GerminaR)
#' library(dplyr)
#' 
#' smr <- ger_summary(SeedN = "seeds"
#'                    , evalName = "D"
#'                    , data = prosopis) %>%
#'   mutate(across(rep:temp, as.factor))
#'   
#' av <- aov(grp ~ nacl*temp, smr)
#' 
#' anova(av)
#' 
#' mc <- ger_testcomp(aov = av
#'                    , comp = c("nacl", "temp"))
#'                    
#' plotdt <- mc$table
#'                     
#' plot <- fplot(data = plotdt
#'        , type = "bar"
#'        , x = "temp"
#'        , y = "grp"
#'        , group = "nacl"
#'        , sig = "sig"
#'        #, error = "ste"
#'        , color = T
#'        , ylimits = c(0, 120, 20)
#'        )
#'        
#' plot
#'        
#' } 
#' 

fplot <- function(data
                  , type = "bar"
                  , x
                  , y
                  , group = NA
                  , xlab = NA
                  , ylab = NA
                  , glab = NA
                  , ylimits = NA
                  , xrotation = NA
                  , xtext = NA
                  , gtext = NA
                  , legend = "top"
                  , sig = NA
                  , sigsize = 3
                  , error = NA
                  , color = TRUE
                  , opt = NA
                  ){
  
  # match args --------------------------------------------------------------
  
  legend <- match.arg(legend, c("top", "left", "right", "bottom", "none"))
  type <- match.arg(type, c("barra", "linea"))
  
  if(!c(x %in% colnames(data))) stop("colum no exist")
  if(!c(y %in% colnames(data))) stop("colum no exist")
  
  # -------------------------------------------------------------------------
  
  if(is.null(group)) {group <- x}
  
  xlab <- if(is.null(xlab) || is.na(xlab) || xlab == "") {NULL} else {xlab}
  ylab <- if(is.null(ylab) || is.na(ylab) || ylab == "") {NULL} else {ylab}
  glab <- if(is.null(glab) || is.na(glab) || glab == "") {NULL} else {glab}
  opt <- if(is.null(opt) || is.na(opt) || opt == "") {NULL} else {opt}
  sig <- if(is.null(sig) || is.na(sig) || sig == "" || sig == "none") {NULL} else {sig}
  error <- if(is.null(error) || is.na(error) || error == "" || error == "none") {
    NULL} else {error}
  
  color <- if(is.null(color) || is.na(color) || color == "" || color == "yes") {
    TRUE} else if (color == "none") {FALSE} else {color}
  
  ylimits <- if(all(is.null(ylimits)) || all(is.na(ylimits)) || all(ylimits %in% "")) { 
    NULL
  } else if(is.character(ylimits)) {
    ylimits %>%
      gsub("[[:space:]]", "", .) %>%
      strsplit(., "[*]") %>%
      unlist() %>% as.numeric()
  } else {ylimits}
  
  xtext <- if(is.null(xtext) || is.na(xtext) || xtext == "") {
    NULL} else if (is.character(xtext)){ 
      xtext %>%
        strsplit(., ",") %>%
        unlist() %>% 
        base::trimws()
    } else {xtext}
  
  gtext <- if(is.null(gtext) || is.na(gtext) || gtext == "") {
    NULL} else if (is.character(gtext)){ 
      gtext %>%
        strsplit(., ",") %>%
        unlist() %>% 
        base::trimws()
    } else {gtext}
  
  xrotation <- if(all(is.null(xrotation)) || all(is.na(xrotation)) || all(xrotation == "")) {
    c(0, 0.5, 0.5)
  } else if (is.character(xrotation)){ 
    xrotation %>%
      gsub("[[:space:]]", "", .) %>%
      strsplit(., "[*]") %>%
      unlist() %>% as.numeric()
  } else {xrotation}
  
  # graph-color -------------------------------------------------------------
  
  if (isTRUE(color)) {
    
    color <- colorRampPalette(
      c("#86CD80"   # green
        , "#F4CB8C" # orange
        , "#F3BB00" # yellow
        , "#0198CD" # blue
        , "#FE6673" # red
      ))(length(data[[group]] %>% unique()))
    
  } else if (isFALSE(color)) {
    
    color <- gray.colors(n =  data[[group]] %>% unique() %>% length()
                         , start = 0.8
                         , end = 0.3) 
    
  } else {
    
    color <- color
    
  }
  
  # sci-labels --------------------------------------------------------------
  
  if ( !is.null(xlab) ) { 
    
    xlab <- xlab %>%
      gsub(pattern = " ", "~", .)
    xlab <- eval(expression(parse(text = xlab)))
    
  }
  
  if ( !is.null(ylab) ) { #
    
    ylab <- ylab %>%
      gsub(pattern = " ", "~", .)
    
    ylab <- eval(expression(parse(text = ylab)))
    
  }
  
  if ( !is.null(glab) ) {
    
    glab <- glab %>%
      gsub(pattern = " ", "~", .)
    glab <- eval(expression(parse(text = glab)))
    
  } 
  
  # type --------------------------------------------------------------------
  
  plotdt <- data %>% 
    select(!starts_with("{") | !ends_with("}")) %>%
    select_if(~ !all(is.na(.))) %>%
    drop_na(names(.[1])) %>% 
    mutate(across(c({{group}}), as.factor))
  
  # bar plot ----------------------------------------------------------------
  
  if(type == "barra") {
    
    plot <- plotdt %>% 
      ggplot(., aes(x = .data[[x]]
                    , y = .data[[y]]
                    , fill = .data[[group]])
      ) +
      
      geom_col(
        position = position_dodge2()
        , colour = "black"
        , size = 0.4
        , na.rm = T
      ) +
      labs(
        x = if(is.null(xlab)) x else xlab
        , y = if(is.null(ylab)) y else ylab
        , fill = if(is.null(glab)) group else glab
      ) +
      
      {
        if (!is.null(error)) 
          geom_errorbar(
            aes(ymin = .data[[y]] - .data[[error]]
                , ymax = .data[[y]] + .data[[error]] )
            , position = position_dodge(width = 0.9)
            , width = 0.15
            , na.rm = T) 
        
      } +
      {
        if (!is.null(sig) )  
          
          geom_text(
            aes(label = .data[[sig]]
                , y = if(!is.null(error)) .data[[y]] + .data[[error]] else .data[[y]])
            , position = position_dodge(width = 0.9)
            , na.rm = T
            , colour = "black"
            , vjust = -0.5
            , hjust = 0.5
            , angle = 0
            , size = sigsize
          ) 
      } +
      scale_fill_manual(values = color
                        , labels = if(!is.null(gtext)) gtext else waiver()) 
  }
  
  # line plot ---------------------------------------------------------------
  
  if (type == "linea") {
    
    plot <- plotdt %>% 
      ggplot( aes(x = .data[[x]]
                  , y = .data[[y]]
                  , shape = .data[[group]]
                  , colour = .data[[group]]
      ) ) +
      
      geom_point( aes(group =  .data[[group]]
                      , shape = .data[[group]]
                      , color = .data[[group]]
      ), size = 2.5 ) +
      
      geom_line( aes( group =  .data[[group]]
                      , color = .data[[group]]
                      , linetype = .data[[group]]
      ) ,  size = 1 ) +
      labs(x = if(is.null(xlab)) x else xlab
           , y = if(is.null(ylab)) y else ylab
           , shape = if(is.null(glab)) group else glab
           , color = if(is.null(glab)) group else glab
           , linetype = if(is.null(glab)) group else glab
      ) +
      
      {
        if (!is.null(error))  
          geom_errorbar(aes(ymin = .data[[y]] - .data[[error]]
                            , ymax = .data[[y]] + .data[[error]])
                        , width = 0.08) 
      } +
      
      {
        if (!is.null(sig))  
          
          geom_text(
            aes(label = .data[[sig]]
                , y = if(!is.null(error)) .data[[y]] + .data[[error]] else .data[[y]])
            , colour = "black"
            , vjust = -0.5
            , hjust = 0.5
            , angle = 0
            , size = 3
          ) 
      } +
      
      scale_color_manual(
        labels = if(!is.null(gtext)) gtext else waiver()
        , values = color
      ) + 
      scale_linetype_discrete(labels = if(!is.null(gtext)) gtext else waiver()) +
      scale_shape_discrete(labels = if(!is.null(gtext)) gtext else waiver())
    
  }
  
  # layers ------------------------------------------------------------------
  
  graph <- plot + 
    { if(!is.null(xtext)) scale_x_discrete(labels = xtext) } +
    {
      if(!is.null(ylimits))
        scale_y_continuous(
          limits = ylimits[1:2] 
          , breaks = seq(ylimits[1], ylimits[2], by = abs(ylimits[3]))
          , expand = c(0,0)
        )
    }
  
  layers <- 'graph +
  theme_minimal() +
  theme(legend.position = legend
    , panel.border = element_rect(colour = "black", fill=NA)
    , panel.background = element_rect(fill = "transparent")
    , legend.background = element_rect(colour = "transparent", fill = "transparent")
    , axis.text.x = element_text(angle = xrotation[1]
                                 , hjust= xrotation[2]
                                 , vjust = xrotation[3])
    )'
  
  if(is.null(opt)) {
    eval(parse(text = layers)) 
  } else {
    eval(parse(text = paste(layers, opt, sep = " + ")))
  }

}


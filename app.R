# Copyright 2023-26, Björn-Ole Kamm, www.b-ok.de
# This file is part of reLarp.
#
# reLarp is free software: you can redistribute it and/or modify it under the terms of 
# the GNU General Public License as published by the Free Software Foundation, either version 
# 3 of the License, or (at your option) any later version.
#
# reLarp is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with Larp Debrief. 
# If not, see www.gnu.org/licenses.

library(shiny)
library(sortable)
library(shinyjs)
library(psych)
library(amap)
library(shinyalert)
library(emayili)
library(zip)
library(shiny.i18n)

smtp <- server(host = "your_host",
               port = 465,
               username = Sys.getenv("ALFA_USERNAME"),
               password = Sys.getenv("ALFA_PASSWORD")
)

# File with translations
i18n <- Translator$new(translation_json_path = "www/translation.json")

# Change this to en or comment this line
i18n$set_translation_language("en")

ui <- fluidPage(
  shinyjs::useShinyjs(),
  title = "reLarp",
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),
  div(id = "header",
      div(style = "height: 20px;"),
      shiny.i18n::usei18n(i18n),
      div(style = "float: right;",
          selectInput(
            inputId = "selected_language",
            label = i18n$t("Language"),
            choices = setNames(
              i18n$get_languages(),
              c("English", "Deutsch", "日本語") # Set labels for the languages
            ),
            selected = i18n$get_key_translation()
          )
      ),
      div(style = "display: flex; align-items: center;",
          tags$img(src = "https://www.larpwright.eu/assets/relarp_logo.png", width = "128px", height = "128px", style = "margin-right: 10px;"),
          h1(HTML("<span style='font-variant: small-caps;'>re</span>Larp"))
      ),
      h5(i18n$t("This app is a supplement to the"),
         a(href = "https://www.larpwright.eu",
           "Larpwright Design Tools", target="_blank")
      ),
      span(i18n$t("Created by ")),
      a(href = "https://www.b-ok.de", i18n$t("Björn-Ole Kamm"), target="_blank"),
      HTML("&bull;"),
      span(i18n$t("Code")),
      a(href = "https://github.com/larpGit/relarp", i18n$t("on GitHub"), target="_blank"),
      HTML("&bull;"),
      span(i18n$t("Disclaimer:")),
      a(href = "https://www.larpwright.eu/relarp/#data_privacy", i18n$t("Data and Privacy"), target="_blank")
  ),
  div(style = "height: 20px;"), # Add this line to create some space
  h5(i18n$t("Considering the theme or question provided by the facilitator, what words or ideas come to your mind when you want to describe your larp experience? Please input words or short sentences as they come to your mind. Please input at least four words or sentences.")), 
  div(style = "height: 20px;"), # Add this line to create some space
  sidebarLayout(
    sidebarPanel(
      textInput("name", i18n$t("Your Name or Number")),
      span(i18n$t("Input either your first name or the participant number you received from the facilitator.")),
      tags$hr(),
      h4(i18n$t("Free Word Association")),
      span(i18n$t("Fields marked with an asterisk * are required.")),
      div(style = "height: 10px;"),
      textInput("input1", i18n$t("First Word Association"), value = "", placeholder = "*"),
      textInput("input2", i18n$t("Second Word Association"), value = "", placeholder = "*"),
      textInput("input3", i18n$t("Third Word Association"), value = "", placeholder = "*"),
      textInput("input4", i18n$t("Fourth Word Association"), value = "", placeholder = "*"),
      textInput("input5", i18n$t("Fifth Word Association")),
      textInput("input6", i18n$t("Sixth Word Association")),
      textInput("input7", i18n$t("Seventh Word Association")),
      textInput("input8", i18n$t("Eighth Word Association")),
      textInput("input9", i18n$t("Ninth Word Association")),
      textInput("input10", i18n$t("Tenth Word Association")),
      textInput("input11", i18n$t("Eleventh Word Association")),
      textInput("input12", i18n$t("Twelfth Word Association")),
      actionButton("submit1", i18n$t("Submit"),
                   onclick = "if ($('#name').val() === '' || $('#input1').val() === '' || $('#input2').val() === '' || $('#input3').val() === '' || $('#input4').val() === '') { alert(i18n$t('Please fill in the name and the first four inputs.')); return false; }"),
      downloadButton("downloadCSV", i18n$t("Download CSV"))
    ),
    mainPanel(
      useShinyjs(),
      conditionalPanel("input.submit1", # Add this line
                       h4(i18n$t("Importance")),
                       uiOutput("importanceUI"),
                       actionButton("submit_importance", i18n$t("Submit Importance")),
                       div(style = "height: 20px;")
      ),
      conditionalPanel("input.submit_importance", # Add this line
                       div(style = "height: 20px;"), # Add this line to create some space
                       h4(i18n$t("Evaluation")),
                       span(i18n$t("Please evaluate your words and ideas and designate them as either positive (+), neutral/NA (~), or negative (-). Even if you do not change the current evaluation, please click it once.")), br(), 
                       div(style = "height: 20px;"), # Add this line to create some space
                       DT::dataTableOutput("responsesTable"), 
                       uiOutput("evaluationUI"),
                       div(style = "height: 20px;"),
                       actionButton("submit_evaluation", i18n$t("Submit Evaluation")),
                       div(style = "height: 20px;")
      ),
      conditionalPanel("input.submit_evaluation", # Add this line
                       div(style = "height: 20px;"), # Add this line to create some space
                       h4(i18n$t("Similarity")),
                       span(i18n$t("Please rate the distance between each pair of the items you listed according to the 7 scale below. In so doing, evaluate how close they are in your image. Do not evaluate in terms of the accuracy of meaning in the dictionary.")), br(),
                       span(i18n$t("1 = extremely close 2 = very close 3 = relatively close 4 ＝ neither close nor far 5 = relatively far 6 = very far 7 ＝ extremely far")), br(),
                       div(style = "height: 20px;"), # Add this line to create some space
                       uiOutput("pairUI"),
                       actionButton("submit2", i18n$t("Submit Similarity")),
      ),               
      conditionalPanel("input.submit2", # Add this line
                       downloadButton("downloadData", i18n$t("Download Matrix")),
                       div(style = "height: 20px;"), # Add this line to create some space
                       h4(i18n$t("Cluster Analysis")),
                       div(style = "height: 20px;"), # Add this line to create some space
                       numericInput("num_clusters", i18n$t("Number of Clusters"), value = 3, min = 2, max = 5),
                       tableOutput("basicStats"),
                       tableOutput("correlation"),
                       h4(i18n$t("Dendrogram")),
                       imageOutput("dendrogram"),
                       div(style = "height: 20px;"), # Add this line to create some space between the dendrogram and the button
                       h4(i18n$t("Dendrogram with Specified Clusters")),
                       imageOutput("dendrogram_clusters"),
                       div(style = "height: 20px;"), # Add this line to create some space between the dendrogram and the button
                       downloadButton("downloadDendrogram", i18n$t("Download Dendrogram")),
                       downloadButton("downloadClusters", i18n$t("Download Clusters")),
                       div(style = "height: 20px;"),
                       actionButton("sendToFacilitator", i18n$t("Send to Facilitator")),
                       div(style = "height: 20px;")
      )
    )
  )
)

server <- function(input, output, session) {
  dir.create("responses", showWarnings = FALSE)
  
  input_data <- reactiveValues(inputs = NULL, importance = NULL, evaluation = NULL, sliders = NULL)
  
  observeEvent(input$selected_language, {
    # Here is where we update language in session
    shiny.i18n::update_lang(input$selected_language)
  })
  
  observeEvent(input$submit1, {
    input_data$inputs <- c(input$input1, input$input2, input$input3, input$input4, input$input5, input$input6, input$input7, input$input8, input$input9, input$input10, input$input11, input$input12)
    input_data$inputs <- input_data$inputs[input_data$inputs != ""] # Filter out empty inputs
    write.table(data.frame(ID = 1:length(input_data$inputs), Input = input_data$inputs), paste0("responses/", input$name, ".csv"), row.names = FALSE, col.names = TRUE, sep = ",", quote = TRUE, fileEncoding = "UTF-8")
  })
  
  output$downloadCSV <- downloadHandler(
    filename = function() {
      paste0(input$name, ".csv")
    },
    content = function(file) {
      file.copy(paste0("responses/", input$name, ".csv"), file)
    }
  )
  
  output$importanceUI <- renderUI({
    req(input_data$inputs)
    list_container <- bucket_list(
      header = i18n$t("Please reorder your words in the order of importance by dragging and dropping."),
      group_name = "importance_group",
      add_rank_list(
        text = i18n$t("Order of Importance"),
        labels = input_data$inputs,
        input_id = "importance_list"
      )
    )
    list_container
  })
  
  observeEvent(input$submit_importance, {
    req(input_data$inputs, input$importance_list)
    input_data$importance <- input$importance_list
    importance_table <- data.frame(ID = 1:length(input_data$importance), Input = input_data$importance)
    write.table(importance_table, paste0("responses/", input$name, "-importance.csv"), row.names = FALSE, col.names = TRUE, sep = ",", quote = TRUE, fileEncoding = "UTF-8")
  })
  
  evaluation_list <- reactiveValues()
  
  observe({
    req(input_data$importance)
    for (item in input_data$importance) {
      evaluation_list[[item]] <- reactiveVal("")
    }
  })
  
  output$evaluationUI <- renderUI({
    req(input_data$importance)
    
    eval_controls <- lapply(input_data$importance, function(item) {
      fluidRow(
        column(4, strong(item)),
        column(3, 
               textOutput(paste0("selected_eval_text_", item), inline = TRUE)
        ),
        column(4,
               actionButton(paste0("positive_", item), "+", class = "btn-default"),
               actionButton(paste0("neutral_", item), "~", class = "btn-default"),
               actionButton(paste0("negative_", item), "-", class = "btn-default")
        )
      )
    })
    
    do.call(tagList, eval_controls)
  })
  
  observe({
    req(input_data$importance)
    
    button_event_handler <- function(item) {
      observeEvent(input[[paste0("positive_", item)]], {
        evaluation_list[[item]]("+")
      }, ignoreNULL = FALSE)
      observeEvent(input[[paste0("neutral_", item)]], {
        evaluation_list[[item]]("~")
      }, ignoreNULL = FALSE)
      observeEvent(input[[paste0("negative_", item)]], {
        evaluation_list[[item]]("-")
      }, ignoreNULL = FALSE)
      
      output[[paste0("selected_eval_text_", item)]] <- renderText({
        evaluation_list[[item]]()
      })
    }
    
    for (item in input_data$importance) {
      isolate(button_event_handler(item))
    }
  })
  
  
  observeEvent(input$submit_evaluation, {
    req(input_data$importance)
    
    evaluations <- sapply(input_data$importance, function(item) {
      if (isTruthy(input[[paste0("positive_", item)]])) {
        return(paste0(item, " (+)"))
      } else if (isTruthy(input[[paste0("neutral_", item)]])) {
        return(paste0(item, " (~)"))
      } else if (isTruthy(input[[paste0("negative_", item)]])) {
        return(paste0(item, " (-)"))
      } else {
        return(NA)
      }
    }, USE.NAMES = FALSE)
    
    input_data$evaluation <- evaluations[!is.na(evaluations)]
    
    write.csv(data.frame(Evaluation = input_data$evaluation),
              file = paste0("responses/", input$name, "-eva.csv"), row.names = FALSE)
  })
  
  
  output$pairUI <- renderUI({
    req(input_data$evaluation)
    pairs <- combn(input_data$evaluation, 2)
    sliders <- lapply(seq(ncol(pairs)), function(i) {
      pair <- pairs[, i]
      sliderInput(paste0("similarity", i), label = paste(pair[1], i18n$t("and"), pair[2]), min = 1, max = 7, value = 1)
    })
    input_data$sliders <- sliders
    do.call(tagList, sliders)
  })
  
  observeEvent(input$submit2, {
    req(input_data$evaluation, input_data$sliders)
    n <- length(input_data$evaluation)
    similarity_matrix <- matrix(0, nrow = n, ncol = n)
    colnames(similarity_matrix) <- input_data$evaluation
    rownames(similarity_matrix) <- input_data$evaluation
    
    pairs <- combn(input_data$evaluation, 2)
    for (i in seq(ncol(pairs))) {
      pair <- pairs[, i]
      sim_val <- input[[paste0("similarity", i)]]
      similarity_matrix[pair[1], pair[2]] <- 8 - sim_val
      similarity_matrix[pair[2], pair[1]] <- 8 - sim_val
    }
    write.table(similarity_matrix, paste0("responses/", input$name, "-similarity.csv"), row.names = TRUE, col.names = TRUE, sep = ",", quote = TRUE, fileEncoding = "UTF-8")
  })
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste0(input$name, "-similarity.csv")
    },
    content = function(file) {
      file.copy(paste0("responses/", input$name, "-similarity.csv"), file)
    }
  )
  
  # Read the similarity matrix
	similarity_matrix <- eventReactive(input$submit2, {
  	 req(input$name)
  	 read.csv(paste0("responses/", input$name, "-similarity.csv"), row.names = 1)
  })

  # Modify labels of the similarity matrix
  similarity_matrix_modified <- reactive({
    # Obtain the original matrix
    sm <- similarity_matrix()

    # Get the original labels
    labels <- rownames(sm)

    # Define the maximum length for a label without line breaks
    max_length <- 14

    # Modify labels to insert line breaks if they are too long
    labels <- sapply(labels, function(label) {
      if (nchar(label) > max_length) {
        wrapped_label <- strwrap(label, width = max_length)
        label <- paste(wrapped_label, collapse = "\n")
      }
      return(label)
    })

    # Assign the modified labels back to the similarity matrix
    rownames(sm) <- labels
    colnames(sm) <- labels

    return(sm)
  })

  # Calculate basic statistics
  output$basicStats <- renderTable({
    req(similarity_matrix_modified())
    basic_stats <- psych::describe(similarity_matrix_modified())
    basic_stats <- cbind(rownames(basic_stats), basic_stats)
    colnames(basic_stats)[1] <- "Inputs"
    basic_stats
  })
  
  # Calculate correlation
  output$correlation <- renderTable({
    req(similarity_matrix_modified())
    if (length(input_data$inputs) > 1) {
      correlation <- cor(similarity_matrix_modified(), method = "pearson")
      correlation <- cbind(rownames(correlation), correlation)
      colnames(correlation)[1] <- "Inputs"
      correlation
    } else {
      NULL
    }
  })
  
  
  # Cluster analysis
  cluster_analysis <- reactive({
    req(similarity_matrix_modified())
    distance <- dist(similarity_matrix_modified(), method = "euclidean")
    hclust(distance, method = "ward.D")
  })
  
  # Render dendrogram
  output$dendrogram <- renderPlot({
    req(cluster_analysis())
    dend <- as.dendrogram(cluster_analysis())
    par(mar = c(5, 2, 2, 2))  # Adjust the margins: bottom, left, top, right
    plot(dend, las = 1, xlab="", sub="")
  })
  
  # Render dendrogram with specified number of clusters
  rect_hclust <- function(hclust, k) {
    if (k < 2 || k > length(hclust$labels)) {
      stop(i18n$t("k must be between 2 and the number of labels in the dendrogram"))
    }
    cluster <- cutree(hclust, k = k)
    rect.hclust(hclust, k = k, border = "#428BCA")
  }
  
  output$dendrogram_clusters <- renderPlot({
    req(cluster_analysis(), input$num_clusters)
    dend <- as.dendrogram(cluster_analysis())
    par(mar = c(5, 2, 2, 2))  # Adjust the margins: bottom, left, top, right
    plot(dend, las = 1, xlab="", sub="")
    
    rect_hclust(cluster_analysis(), input$num_clusters)
  })
  
  # Download dendrogram
  output$downloadDendrogram <- downloadHandler(
    filename = function() {
      paste0(input$name, "-dendrogram.png")
    },
    content = function(file) {
      req(cluster_analysis())
      dend <- as.dendrogram(cluster_analysis())
      
      png(file, width = 1200, height = 800)
      plot(dend)
      dev.off()
    },
    contentType = "image/png"
  )
  
  # Download Clusters  
  output$downloadClusters <- downloadHandler(
    filename = function() {
      paste0(input$name, "-clusters.png")
    },
    content = function(file) {
      req(cluster_analysis(), input$num_clusters)
      dend <- as.dendrogram(cluster_analysis())
      
      png(file, width = 1200, height = 800)
      plot(dend, las = 1, xlab="", sub="")
      rect_hclust(cluster_analysis(), input$num_clusters)
      dev.off()
    },
    contentType = "image/png"
  )
  
  save_plot_files <- function() {
    req(cluster_analysis(), input$num_clusters)
    
    dend <- as.dendrogram(cluster_analysis())
    dendrogram_file <- file.path("responses", paste0(input$name, "-dendrogram.png"))
    clusters_file <- file.path("responses", paste0(input$name, "-clusters.png"))
    
    png(dendrogram_file, width = 1200, height = 800)
    plot(dend)
    dev.off()
    
    png(clusters_file, width = 1200, height = 800)
    plot(dend, las = 1, xlab="", sub="")
    rect_hclust(cluster_analysis(), input$num_clusters)
    dev.off()
  }
  
  # Send to Facilitator
  observeEvent(input$sendToFacilitator, {
    
    # Save the dendrogram and clusters png files in the "responses" folder
    save_plot_files()
    
    zip_filename <- paste0(input$name, ".zip")
    zip_file_path <- file.path("responses", zip_filename)
    zip(zipfile = zip_file_path, files = list.files(path = "responses", pattern = input$name, full.names = TRUE))
    
    # Prompt for email address
    shinyalert::shinyalert(
      title = i18n$t("Send to Facilitator"),
      text = i18n$t("Enter the email address you want to send the files to:"),
      type = "input",
      inputValue = "your_receiver_mailaddress",
      callbackR = function(email_address) {
        if (!is.null(email_address)) {
          
          # Create email with attachment
          email <- envelope() %>%
            to (email_address) %>%
            from(paste0(input$name, " <your_sender_mailaddress>")) %>%
            subject(paste("Debrief Data -", input$name)) %>%
            text ("Please find the attached zip file with the debrief data.") %>%
            attachment(path = zip_file_path)
          
          smtp(email, verbose = TRUE)
          
          # Show a confirmation message
          shinyalert::shinyalert(
            title = i18n$t("Email sent"),
            text = i18n$t("The email has been sent successfully."),
            type = "success"
          )
        }
      }
    )
  })
  
  
}


shinyApp(ui = ui, server = server)

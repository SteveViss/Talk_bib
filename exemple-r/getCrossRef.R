
getCrossRef <- function(author, year = NULL, bibtex = TRUE, rows = 500){

    ###-------------------------------------------------------------------------------
    ###
    ### Cette fonction récupère, via l'API CrossRef, toutes les références biblio
    ### pour un auteur donné. Le résultat (bibtex par défaut) est affiché à l'écran
    ### ou écrit dans un fichier .bib.
    ###
    ### author : requête de la forme 'Nom, Prénom'
    ### year   : année de publication (optionnel)
    ### bibtex : TRUE ou FALSE (résultat de la requête stockés dans d'un fichier .bib)
    ### rows   : nombre d'articles max. à filtrer
    ###
    ###-------------------------------------------------------------------------------

    require(rcrossref)

    x <- cr_search(query = author, rows = rows)
    #x <- x[x[ , 'normalizedScore'] > 50, ]

    if (!is.null(year))
        x <- x[grep(paste(', ', year, ',', sep = ''), x[ , 'fullCitation']), ]

    name <- strsplit(author, ', ')[[1]]
    regexp <- gsub(',', '', author)
    regexp <- paste(regexp, paste(name[2], name[1]), sep = '|')
    regexp <- paste(regexp, paste(name[1], initiales(name[2])), sep = '|')
    regexp <- paste(regexp, paste(initiales(name[2]), name[1]), sep = '|')
    regexp <- paste(regexp, gsub('\\.', '', paste(name[1], initiales(name[2])), perl = TRUE), sep = '|')
    regexp <- paste(regexp, gsub('\\.', '', paste(initiales(name[2]), name[1]), perl = TRUE), sep = '|')

    x <- x[grep(regexp, x[ , 'fullCitation']), ]

    x <- gsub("https://doi.org/", "", x$doi)

    cat(file = paste('./ref-', tolower(name[1]),'.bib', sep = ''))
    for (i in 1 : length(x)){
        bib <- cr_cn(dois = x[i], format = 'bibtex')
        cat(paste('\n\n', bib, sep = ''), file = paste('./ref-', tolower(name[1]),'.bib', sep = ''), append = T)
        Sys.sleep(5)
    }
}

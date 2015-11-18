initiales <- function(x){

    ###-------------------------------------------------------------------------------
    ###
    ### data : chaîne de caractères à abréger
    ###
    ### Par ex : Nicolas -> N. et Hubert-Félix -> H.-F.
    ###
    ###-------------------------------------------------------------------------------

    x <- strsplit(x, '-')
    x <- lapply(x, function(x) sapply(x, function(x) paste(substr(x, 1, 1), '.', sep = '')))
    x <- unlist(lapply(x, function(x) ifelse(length(x) > 1, paste(x, collapse = '-', sep = ''), x)))

    return(x)
}

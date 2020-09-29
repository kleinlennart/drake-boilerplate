print_full_width <- function(data) {
  kable(data) %>% kable_styling("striped",
                                full_width = TRUE
  )
}


join_subdata = function(sentiment_data, 
                        reply_data,
                        uclass_data,
                        nlp_data,
                        geo_data,
                        user_data,
                        tweet_data){   # todo: still placeholder joins
  return(sentiment_data %>%
           inner_join(reply_data) %>%
           inner_join(uclass_data) %>%
           inner_join(nlp_data) %>%
           inner_join(geo_data) %>%
           inner_join(user_data) %>%
           inner_join(tweet_data)
  )
}
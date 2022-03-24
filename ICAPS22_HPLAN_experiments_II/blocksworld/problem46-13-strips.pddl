( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b883 - block
    b782 - block
    b932 - block
    b526 - block
    b260 - block
    b9 - block
    b238 - block
    b752 - block
    b122 - block
    b248 - block
    b560 - block
    b184 - block
    b840 - block
    b295 - block
    b444 - block
    b593 - block
    b726 - block
    b776 - block
    b528 - block
    b217 - block
    b450 - block
    b634 - block
    b314 - block
    b151 - block
    b229 - block
    b362 - block
    b289 - block
    b69 - block
    b211 - block
    b414 - block
    b284 - block
    b490 - block
    b125 - block
    b460 - block
    b75 - block
    b906 - block
    b525 - block
    b642 - block
    b354 - block
    b439 - block
    b571 - block
    b201 - block
    b621 - block
    b692 - block
    b975 - block
    b901 - block
    b363 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b883 )
    ( on b782 b883 )
    ( on b932 b782 )
    ( on b526 b932 )
    ( on b260 b526 )
    ( on b9 b260 )
    ( on b238 b9 )
    ( on b752 b238 )
    ( on b122 b752 )
    ( on b248 b122 )
    ( on b560 b248 )
    ( on b184 b560 )
    ( on b840 b184 )
    ( on b295 b840 )
    ( on b444 b295 )
    ( on b593 b444 )
    ( on b726 b593 )
    ( on b776 b726 )
    ( on b528 b776 )
    ( on b217 b528 )
    ( on b450 b217 )
    ( on b634 b450 )
    ( on b314 b634 )
    ( on b151 b314 )
    ( on b229 b151 )
    ( on b362 b229 )
    ( on b289 b362 )
    ( on b69 b289 )
    ( on b211 b69 )
    ( on b414 b211 )
    ( on b284 b414 )
    ( on b490 b284 )
    ( on b125 b490 )
    ( on b460 b125 )
    ( on b75 b460 )
    ( on b906 b75 )
    ( on b525 b906 )
    ( on b642 b525 )
    ( on b354 b642 )
    ( on b439 b354 )
    ( on b571 b439 )
    ( on b201 b571 )
    ( on b621 b201 )
    ( on b692 b621 )
    ( on b975 b692 )
    ( on b901 b975 )
    ( on b363 b901 )
    ( clear b363 )
  )
  ( :goal
    ( and
      ( clear b883 )
    )
  )
)

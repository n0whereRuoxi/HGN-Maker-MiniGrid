( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b896 - block
    b964 - block
    b179 - block
    b339 - block
    b706 - block
    b502 - block
    b901 - block
    b90 - block
    b358 - block
    b19 - block
    b442 - block
    b403 - block
    b685 - block
    b881 - block
    b611 - block
    b681 - block
    b662 - block
    b185 - block
    b109 - block
    b803 - block
    b660 - block
    b582 - block
    b226 - block
    b424 - block
    b470 - block
    b346 - block
    b327 - block
    b893 - block
    b215 - block
    b72 - block
    b290 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b896 )
    ( on b964 b896 )
    ( on b179 b964 )
    ( on b339 b179 )
    ( on b706 b339 )
    ( on b502 b706 )
    ( on b901 b502 )
    ( on b90 b901 )
    ( on b358 b90 )
    ( on b19 b358 )
    ( on b442 b19 )
    ( on b403 b442 )
    ( on b685 b403 )
    ( on b881 b685 )
    ( on b611 b881 )
    ( on b681 b611 )
    ( on b662 b681 )
    ( on b185 b662 )
    ( on b109 b185 )
    ( on b803 b109 )
    ( on b660 b803 )
    ( on b582 b660 )
    ( on b226 b582 )
    ( on b424 b226 )
    ( on b470 b424 )
    ( on b346 b470 )
    ( on b327 b346 )
    ( on b893 b327 )
    ( on b215 b893 )
    ( on b72 b215 )
    ( on b290 b72 )
    ( clear b290 )
  )
  ( :goal
    ( and
      ( clear b896 )
    )
  )
)

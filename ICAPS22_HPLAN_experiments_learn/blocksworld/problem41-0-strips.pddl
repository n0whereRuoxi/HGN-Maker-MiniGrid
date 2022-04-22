( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b376 - block
    b407 - block
    b159 - block
    b327 - block
    b196 - block
    b125 - block
    b569 - block
    b595 - block
    b959 - block
    b340 - block
    b295 - block
    b629 - block
    b368 - block
    b837 - block
    b576 - block
    b580 - block
    b891 - block
    b351 - block
    b713 - block
    b336 - block
    b174 - block
    b466 - block
    b869 - block
    b414 - block
    b654 - block
    b999 - block
    b226 - block
    b488 - block
    b269 - block
    b238 - block
    b68 - block
    b705 - block
    b262 - block
    b940 - block
    b948 - block
    b541 - block
    b807 - block
    b6 - block
    b34 - block
    b810 - block
    b311 - block
    b542 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b376 )
    ( on b407 b376 )
    ( on b159 b407 )
    ( on b327 b159 )
    ( on b196 b327 )
    ( on b125 b196 )
    ( on b569 b125 )
    ( on b595 b569 )
    ( on b959 b595 )
    ( on b340 b959 )
    ( on b295 b340 )
    ( on b629 b295 )
    ( on b368 b629 )
    ( on b837 b368 )
    ( on b576 b837 )
    ( on b580 b576 )
    ( on b891 b580 )
    ( on b351 b891 )
    ( on b713 b351 )
    ( on b336 b713 )
    ( on b174 b336 )
    ( on b466 b174 )
    ( on b869 b466 )
    ( on b414 b869 )
    ( on b654 b414 )
    ( on b999 b654 )
    ( on b226 b999 )
    ( on b488 b226 )
    ( on b269 b488 )
    ( on b238 b269 )
    ( on b68 b238 )
    ( on b705 b68 )
    ( on b262 b705 )
    ( on b940 b262 )
    ( on b948 b940 )
    ( on b541 b948 )
    ( on b807 b541 )
    ( on b6 b807 )
    ( on b34 b6 )
    ( on b810 b34 )
    ( on b311 b810 )
    ( on b542 b311 )
    ( clear b542 )
  )
  ( :goal
    ( and
      ( clear b376 )
    )
  )
)

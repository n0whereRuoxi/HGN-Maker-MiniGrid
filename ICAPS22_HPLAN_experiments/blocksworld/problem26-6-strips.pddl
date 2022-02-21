( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b212 - block
    b288 - block
    b405 - block
    b504 - block
    b763 - block
    b852 - block
    b512 - block
    b346 - block
    b569 - block
    b167 - block
    b930 - block
    b489 - block
    b831 - block
    b818 - block
    b314 - block
    b624 - block
    b284 - block
    b735 - block
    b651 - block
    b170 - block
    b60 - block
    b196 - block
    b275 - block
    b736 - block
    b738 - block
    b802 - block
    b395 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b212 )
    ( on b288 b212 )
    ( on b405 b288 )
    ( on b504 b405 )
    ( on b763 b504 )
    ( on b852 b763 )
    ( on b512 b852 )
    ( on b346 b512 )
    ( on b569 b346 )
    ( on b167 b569 )
    ( on b930 b167 )
    ( on b489 b930 )
    ( on b831 b489 )
    ( on b818 b831 )
    ( on b314 b818 )
    ( on b624 b314 )
    ( on b284 b624 )
    ( on b735 b284 )
    ( on b651 b735 )
    ( on b170 b651 )
    ( on b60 b170 )
    ( on b196 b60 )
    ( on b275 b196 )
    ( on b736 b275 )
    ( on b738 b736 )
    ( on b802 b738 )
    ( on b395 b802 )
    ( clear b395 )
  )
  ( :goal
    ( and
      ( clear b212 )
    )
  )
)

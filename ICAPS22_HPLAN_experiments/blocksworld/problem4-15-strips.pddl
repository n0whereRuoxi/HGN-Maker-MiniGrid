( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b411 - block
    b414 - block
    b143 - block
    b826 - block
    b433 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b411 )
    ( on b414 b411 )
    ( on b143 b414 )
    ( on b826 b143 )
    ( on b433 b826 )
    ( clear b433 )
  )
  ( :goal
    ( and
      ( clear b411 )
    )
  )
)

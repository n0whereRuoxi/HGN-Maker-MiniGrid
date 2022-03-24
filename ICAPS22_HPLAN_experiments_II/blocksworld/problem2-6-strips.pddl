( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b193 - block
    b60 - block
    b207 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b193 )
    ( on b60 b193 )
    ( on b207 b60 )
    ( clear b207 )
  )
  ( :goal
    ( and
      ( clear b193 )
    )
  )
)

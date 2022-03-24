( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b536 - block
    b984 - block
    b810 - block
    b685 - block
    b199 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b536 )
    ( on b984 b536 )
    ( on b810 b984 )
    ( on b685 b810 )
    ( on b199 b685 )
    ( clear b199 )
  )
  ( :goal
    ( and
      ( clear b536 )
    )
  )
)

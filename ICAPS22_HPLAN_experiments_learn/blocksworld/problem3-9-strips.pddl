( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b347 - block
    b658 - block
    b517 - block
    b365 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b347 )
    ( on b658 b347 )
    ( on b517 b658 )
    ( on b365 b517 )
    ( clear b365 )
  )
  ( :goal
    ( and
      ( clear b347 )
    )
  )
)

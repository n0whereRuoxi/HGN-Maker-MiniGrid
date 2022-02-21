( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b327 - block
    b368 - block
    b760 - block
    b204 - block
    b776 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b327 )
    ( on b368 b327 )
    ( on b760 b368 )
    ( on b204 b760 )
    ( on b776 b204 )
    ( clear b776 )
  )
  ( :goal
    ( and
      ( clear b327 )
    )
  )
)

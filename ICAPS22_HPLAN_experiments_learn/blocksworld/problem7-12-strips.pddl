( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b593 - block
    b368 - block
    b949 - block
    b542 - block
    b29 - block
    b55 - block
    b928 - block
    b452 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b593 )
    ( on b368 b593 )
    ( on b949 b368 )
    ( on b542 b949 )
    ( on b29 b542 )
    ( on b55 b29 )
    ( on b928 b55 )
    ( on b452 b928 )
    ( clear b452 )
  )
  ( :goal
    ( and
      ( clear b593 )
    )
  )
)

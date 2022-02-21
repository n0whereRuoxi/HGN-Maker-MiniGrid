( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b233 - block
    b452 - block
    b866 - block
    b384 - block
    b250 - block
    b407 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b233 )
    ( on b452 b233 )
    ( on b866 b452 )
    ( on b384 b866 )
    ( on b250 b384 )
    ( on b407 b250 )
    ( clear b407 )
  )
  ( :goal
    ( and
      ( clear b233 )
    )
  )
)

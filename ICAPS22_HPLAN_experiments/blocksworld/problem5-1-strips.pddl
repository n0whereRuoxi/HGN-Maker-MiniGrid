( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b500 - block
    b371 - block
    b741 - block
    b692 - block
    b478 - block
    b501 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b500 )
    ( on b371 b500 )
    ( on b741 b371 )
    ( on b692 b741 )
    ( on b478 b692 )
    ( on b501 b478 )
    ( clear b501 )
  )
  ( :goal
    ( and
      ( clear b500 )
    )
  )
)

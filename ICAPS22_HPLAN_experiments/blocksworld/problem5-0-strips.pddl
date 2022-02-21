( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b407 - block
    b850 - block
    b803 - block
    b190 - block
    b871 - block
    b597 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b407 )
    ( on b850 b407 )
    ( on b803 b850 )
    ( on b190 b803 )
    ( on b871 b190 )
    ( on b597 b871 )
    ( clear b597 )
  )
  ( :goal
    ( and
      ( clear b407 )
    )
  )
)

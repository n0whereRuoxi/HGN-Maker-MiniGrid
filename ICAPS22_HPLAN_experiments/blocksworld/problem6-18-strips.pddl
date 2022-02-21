( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b640 - block
    b515 - block
    b560 - block
    b484 - block
    b296 - block
    b179 - block
    b437 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b640 )
    ( on b515 b640 )
    ( on b560 b515 )
    ( on b484 b560 )
    ( on b296 b484 )
    ( on b179 b296 )
    ( on b437 b179 )
    ( clear b437 )
  )
  ( :goal
    ( and
      ( clear b640 )
    )
  )
)

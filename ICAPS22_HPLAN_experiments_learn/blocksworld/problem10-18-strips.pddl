( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b115 - block
    b6 - block
    b867 - block
    b536 - block
    b518 - block
    b972 - block
    b25 - block
    b178 - block
    b256 - block
    b86 - block
    b105 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b115 )
    ( on b6 b115 )
    ( on b867 b6 )
    ( on b536 b867 )
    ( on b518 b536 )
    ( on b972 b518 )
    ( on b25 b972 )
    ( on b178 b25 )
    ( on b256 b178 )
    ( on b86 b256 )
    ( on b105 b86 )
    ( clear b105 )
  )
  ( :goal
    ( and
      ( clear b115 )
    )
  )
)

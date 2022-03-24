( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b481 - block
    b187 - block
    b712 - block
    b152 - block
    b601 - block
    b479 - block
    b465 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b481 )
    ( on b187 b481 )
    ( on b712 b187 )
    ( on b152 b712 )
    ( on b601 b152 )
    ( on b479 b601 )
    ( on b465 b479 )
    ( clear b465 )
  )
  ( :goal
    ( and
      ( clear b481 )
    )
  )
)

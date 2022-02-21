( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b972 - block
    b272 - block
    b588 - block
    b369 - block
    b931 - block
    b631 - block
    b732 - block
    b41 - block
    b406 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b972 )
    ( on b272 b972 )
    ( on b588 b272 )
    ( on b369 b588 )
    ( on b931 b369 )
    ( on b631 b931 )
    ( on b732 b631 )
    ( on b41 b732 )
    ( on b406 b41 )
    ( clear b406 )
  )
  ( :goal
    ( and
      ( clear b972 )
    )
  )
)

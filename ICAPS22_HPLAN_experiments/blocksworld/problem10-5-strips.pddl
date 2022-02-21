( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b71 - block
    b307 - block
    b67 - block
    b514 - block
    b90 - block
    b371 - block
    b906 - block
    b233 - block
    b48 - block
    b816 - block
    b692 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b71 )
    ( on b307 b71 )
    ( on b67 b307 )
    ( on b514 b67 )
    ( on b90 b514 )
    ( on b371 b90 )
    ( on b906 b371 )
    ( on b233 b906 )
    ( on b48 b233 )
    ( on b816 b48 )
    ( on b692 b816 )
    ( clear b692 )
  )
  ( :goal
    ( and
      ( clear b71 )
    )
  )
)

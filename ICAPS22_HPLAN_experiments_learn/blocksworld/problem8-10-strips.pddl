( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b706 - block
    b473 - block
    b816 - block
    b412 - block
    b915 - block
    b560 - block
    b923 - block
    b476 - block
    b916 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b706 )
    ( on b473 b706 )
    ( on b816 b473 )
    ( on b412 b816 )
    ( on b915 b412 )
    ( on b560 b915 )
    ( on b923 b560 )
    ( on b476 b923 )
    ( on b916 b476 )
    ( clear b916 )
  )
  ( :goal
    ( and
      ( clear b706 )
    )
  )
)

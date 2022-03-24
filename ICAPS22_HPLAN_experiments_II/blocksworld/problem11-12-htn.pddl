( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b185 - block
    b292 - block
    b923 - block
    b967 - block
    b503 - block
    b210 - block
    b94 - block
    b571 - block
    b366 - block
    b902 - block
    b64 - block
    b99 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b185 )
    ( on b292 b185 )
    ( on b923 b292 )
    ( on b967 b923 )
    ( on b503 b967 )
    ( on b210 b503 )
    ( on b94 b210 )
    ( on b571 b94 )
    ( on b366 b571 )
    ( on b902 b366 )
    ( on b64 b902 )
    ( on b99 b64 )
    ( clear b99 )
  )
  ( :tasks
    ( Make-11Pile b292 b923 b967 b503 b210 b94 b571 b366 b902 b64 b99 )
  )
)

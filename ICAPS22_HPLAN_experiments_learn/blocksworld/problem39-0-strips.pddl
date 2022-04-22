( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b214 - block
    b677 - block
    b958 - block
    b828 - block
    b152 - block
    b552 - block
    b361 - block
    b310 - block
    b514 - block
    b106 - block
    b449 - block
    b320 - block
    b825 - block
    b404 - block
    b959 - block
    b583 - block
    b438 - block
    b916 - block
    b894 - block
    b971 - block
    b451 - block
    b587 - block
    b27 - block
    b436 - block
    b660 - block
    b154 - block
    b172 - block
    b429 - block
    b432 - block
    b269 - block
    b94 - block
    b37 - block
    b492 - block
    b980 - block
    b911 - block
    b946 - block
    b304 - block
    b276 - block
    b601 - block
    b888 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b214 )
    ( on b677 b214 )
    ( on b958 b677 )
    ( on b828 b958 )
    ( on b152 b828 )
    ( on b552 b152 )
    ( on b361 b552 )
    ( on b310 b361 )
    ( on b514 b310 )
    ( on b106 b514 )
    ( on b449 b106 )
    ( on b320 b449 )
    ( on b825 b320 )
    ( on b404 b825 )
    ( on b959 b404 )
    ( on b583 b959 )
    ( on b438 b583 )
    ( on b916 b438 )
    ( on b894 b916 )
    ( on b971 b894 )
    ( on b451 b971 )
    ( on b587 b451 )
    ( on b27 b587 )
    ( on b436 b27 )
    ( on b660 b436 )
    ( on b154 b660 )
    ( on b172 b154 )
    ( on b429 b172 )
    ( on b432 b429 )
    ( on b269 b432 )
    ( on b94 b269 )
    ( on b37 b94 )
    ( on b492 b37 )
    ( on b980 b492 )
    ( on b911 b980 )
    ( on b946 b911 )
    ( on b304 b946 )
    ( on b276 b304 )
    ( on b601 b276 )
    ( on b888 b601 )
    ( clear b888 )
  )
  ( :goal
    ( and
      ( clear b214 )
    )
  )
)

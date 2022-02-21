( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b138 - block
    b853 - block
    b297 - block
    b363 - block
    b288 - block
    b186 - block
    b670 - block
    b443 - block
    b996 - block
    b115 - block
    b826 - block
    b995 - block
    b444 - block
    b191 - block
    b747 - block
    b164 - block
    b415 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b138 )
    ( on b853 b138 )
    ( on b297 b853 )
    ( on b363 b297 )
    ( on b288 b363 )
    ( on b186 b288 )
    ( on b670 b186 )
    ( on b443 b670 )
    ( on b996 b443 )
    ( on b115 b996 )
    ( on b826 b115 )
    ( on b995 b826 )
    ( on b444 b995 )
    ( on b191 b444 )
    ( on b747 b191 )
    ( on b164 b747 )
    ( on b415 b164 )
    ( clear b415 )
  )
  ( :goal
    ( and
      ( clear b138 )
    )
  )
)

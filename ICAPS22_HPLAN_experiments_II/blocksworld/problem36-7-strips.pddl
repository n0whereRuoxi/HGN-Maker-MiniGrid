( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b152 - block
    b541 - block
    b237 - block
    b370 - block
    b557 - block
    b582 - block
    b555 - block
    b999 - block
    b506 - block
    b940 - block
    b89 - block
    b545 - block
    b562 - block
    b457 - block
    b559 - block
    b486 - block
    b476 - block
    b378 - block
    b241 - block
    b915 - block
    b900 - block
    b18 - block
    b680 - block
    b939 - block
    b936 - block
    b502 - block
    b734 - block
    b731 - block
    b605 - block
    b131 - block
    b887 - block
    b156 - block
    b916 - block
    b630 - block
    b672 - block
    b54 - block
    b667 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b152 )
    ( on b541 b152 )
    ( on b237 b541 )
    ( on b370 b237 )
    ( on b557 b370 )
    ( on b582 b557 )
    ( on b555 b582 )
    ( on b999 b555 )
    ( on b506 b999 )
    ( on b940 b506 )
    ( on b89 b940 )
    ( on b545 b89 )
    ( on b562 b545 )
    ( on b457 b562 )
    ( on b559 b457 )
    ( on b486 b559 )
    ( on b476 b486 )
    ( on b378 b476 )
    ( on b241 b378 )
    ( on b915 b241 )
    ( on b900 b915 )
    ( on b18 b900 )
    ( on b680 b18 )
    ( on b939 b680 )
    ( on b936 b939 )
    ( on b502 b936 )
    ( on b734 b502 )
    ( on b731 b734 )
    ( on b605 b731 )
    ( on b131 b605 )
    ( on b887 b131 )
    ( on b156 b887 )
    ( on b916 b156 )
    ( on b630 b916 )
    ( on b672 b630 )
    ( on b54 b672 )
    ( on b667 b54 )
    ( clear b667 )
  )
  ( :goal
    ( and
      ( clear b152 )
    )
  )
)

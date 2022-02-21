( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b297 - block
    b229 - block
    b766 - block
    b71 - block
    b940 - block
    b268 - block
    b963 - block
    b371 - block
    b330 - block
    b168 - block
    b271 - block
    b659 - block
    b238 - block
    b619 - block
    b44 - block
    b905 - block
    b581 - block
    b655 - block
    b35 - block
    b213 - block
    b703 - block
    b130 - block
    b886 - block
    b646 - block
    b462 - block
    b81 - block
    b426 - block
    b796 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b297 )
    ( on b229 b297 )
    ( on b766 b229 )
    ( on b71 b766 )
    ( on b940 b71 )
    ( on b268 b940 )
    ( on b963 b268 )
    ( on b371 b963 )
    ( on b330 b371 )
    ( on b168 b330 )
    ( on b271 b168 )
    ( on b659 b271 )
    ( on b238 b659 )
    ( on b619 b238 )
    ( on b44 b619 )
    ( on b905 b44 )
    ( on b581 b905 )
    ( on b655 b581 )
    ( on b35 b655 )
    ( on b213 b35 )
    ( on b703 b213 )
    ( on b130 b703 )
    ( on b886 b130 )
    ( on b646 b886 )
    ( on b462 b646 )
    ( on b81 b462 )
    ( on b426 b81 )
    ( on b796 b426 )
    ( clear b796 )
  )
  ( :goal
    ( and
      ( clear b297 )
    )
  )
)

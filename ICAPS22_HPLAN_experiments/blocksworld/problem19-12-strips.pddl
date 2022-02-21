( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b144 - block
    b170 - block
    b863 - block
    b984 - block
    b662 - block
    b256 - block
    b461 - block
    b634 - block
    b601 - block
    b243 - block
    b187 - block
    b922 - block
    b756 - block
    b680 - block
    b131 - block
    b31 - block
    b253 - block
    b495 - block
    b50 - block
    b89 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b144 )
    ( on b170 b144 )
    ( on b863 b170 )
    ( on b984 b863 )
    ( on b662 b984 )
    ( on b256 b662 )
    ( on b461 b256 )
    ( on b634 b461 )
    ( on b601 b634 )
    ( on b243 b601 )
    ( on b187 b243 )
    ( on b922 b187 )
    ( on b756 b922 )
    ( on b680 b756 )
    ( on b131 b680 )
    ( on b31 b131 )
    ( on b253 b31 )
    ( on b495 b253 )
    ( on b50 b495 )
    ( on b89 b50 )
    ( clear b89 )
  )
  ( :goal
    ( and
      ( clear b144 )
    )
  )
)

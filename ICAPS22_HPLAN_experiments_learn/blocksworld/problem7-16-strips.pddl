( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b258 - block
    b216 - block
    b323 - block
    b848 - block
    b57 - block
    b829 - block
    b927 - block
    b981 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b258 )
    ( on b216 b258 )
    ( on b323 b216 )
    ( on b848 b323 )
    ( on b57 b848 )
    ( on b829 b57 )
    ( on b927 b829 )
    ( on b981 b927 )
    ( clear b981 )
  )
  ( :goal
    ( and
      ( clear b258 )
    )
  )
)

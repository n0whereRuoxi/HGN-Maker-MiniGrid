( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b871 - block
    b835 - block
    b603 - block
    b489 - block
    b908 - block
    b373 - block
    b815 - block
    b442 - block
    b529 - block
    b183 - block
    b167 - block
    b155 - block
    b625 - block
    b535 - block
    b331 - block
    b250 - block
    b175 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b871 )
    ( on b835 b871 )
    ( on b603 b835 )
    ( on b489 b603 )
    ( on b908 b489 )
    ( on b373 b908 )
    ( on b815 b373 )
    ( on b442 b815 )
    ( on b529 b442 )
    ( on b183 b529 )
    ( on b167 b183 )
    ( on b155 b167 )
    ( on b625 b155 )
    ( on b535 b625 )
    ( on b331 b535 )
    ( on b250 b331 )
    ( on b175 b250 )
    ( clear b175 )
  )
  ( :goal
    ( and
      ( clear b871 )
    )
  )
)

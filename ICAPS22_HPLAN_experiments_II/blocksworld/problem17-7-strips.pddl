( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b853 - block
    b565 - block
    b359 - block
    b876 - block
    b319 - block
    b925 - block
    b821 - block
    b849 - block
    b958 - block
    b919 - block
    b35 - block
    b174 - block
    b516 - block
    b928 - block
    b234 - block
    b984 - block
    b615 - block
    b233 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b853 )
    ( on b565 b853 )
    ( on b359 b565 )
    ( on b876 b359 )
    ( on b319 b876 )
    ( on b925 b319 )
    ( on b821 b925 )
    ( on b849 b821 )
    ( on b958 b849 )
    ( on b919 b958 )
    ( on b35 b919 )
    ( on b174 b35 )
    ( on b516 b174 )
    ( on b928 b516 )
    ( on b234 b928 )
    ( on b984 b234 )
    ( on b615 b984 )
    ( on b233 b615 )
    ( clear b233 )
  )
  ( :goal
    ( and
      ( clear b853 )
    )
  )
)

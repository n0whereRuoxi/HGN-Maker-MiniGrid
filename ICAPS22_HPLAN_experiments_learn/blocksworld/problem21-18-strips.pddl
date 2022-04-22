( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b55 - block
    b277 - block
    b285 - block
    b980 - block
    b235 - block
    b113 - block
    b71 - block
    b265 - block
    b973 - block
    b427 - block
    b565 - block
    b101 - block
    b248 - block
    b170 - block
    b728 - block
    b357 - block
    b767 - block
    b875 - block
    b286 - block
    b232 - block
    b995 - block
    b855 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b55 )
    ( on b277 b55 )
    ( on b285 b277 )
    ( on b980 b285 )
    ( on b235 b980 )
    ( on b113 b235 )
    ( on b71 b113 )
    ( on b265 b71 )
    ( on b973 b265 )
    ( on b427 b973 )
    ( on b565 b427 )
    ( on b101 b565 )
    ( on b248 b101 )
    ( on b170 b248 )
    ( on b728 b170 )
    ( on b357 b728 )
    ( on b767 b357 )
    ( on b875 b767 )
    ( on b286 b875 )
    ( on b232 b286 )
    ( on b995 b232 )
    ( on b855 b995 )
    ( clear b855 )
  )
  ( :goal
    ( and
      ( clear b55 )
    )
  )
)

( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b73 - block
    b319 - block
    b289 - block
    b411 - block
    b22 - block
    b987 - block
    b813 - block
    b364 - block
    b442 - block
    b976 - block
    b770 - block
    b377 - block
    b980 - block
    b93 - block
    b60 - block
    b573 - block
    b997 - block
    b472 - block
    b584 - block
    b919 - block
    b641 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b73 )
    ( on b319 b73 )
    ( on b289 b319 )
    ( on b411 b289 )
    ( on b22 b411 )
    ( on b987 b22 )
    ( on b813 b987 )
    ( on b364 b813 )
    ( on b442 b364 )
    ( on b976 b442 )
    ( on b770 b976 )
    ( on b377 b770 )
    ( on b980 b377 )
    ( on b93 b980 )
    ( on b60 b93 )
    ( on b573 b60 )
    ( on b997 b573 )
    ( on b472 b997 )
    ( on b584 b472 )
    ( on b919 b584 )
    ( on b641 b919 )
    ( clear b641 )
  )
  ( :goal
    ( and
      ( clear b73 )
    )
  )
)

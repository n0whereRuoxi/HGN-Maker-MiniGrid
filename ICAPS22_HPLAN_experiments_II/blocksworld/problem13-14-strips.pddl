( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b277 - block
    b986 - block
    b441 - block
    b808 - block
    b102 - block
    b155 - block
    b619 - block
    b743 - block
    b458 - block
    b185 - block
    b831 - block
    b251 - block
    b357 - block
    b649 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b277 )
    ( on b986 b277 )
    ( on b441 b986 )
    ( on b808 b441 )
    ( on b102 b808 )
    ( on b155 b102 )
    ( on b619 b155 )
    ( on b743 b619 )
    ( on b458 b743 )
    ( on b185 b458 )
    ( on b831 b185 )
    ( on b251 b831 )
    ( on b357 b251 )
    ( on b649 b357 )
    ( clear b649 )
  )
  ( :goal
    ( and
      ( clear b277 )
    )
  )
)

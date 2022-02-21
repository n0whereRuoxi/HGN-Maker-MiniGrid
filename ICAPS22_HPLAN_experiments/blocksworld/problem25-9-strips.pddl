( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b542 - block
    b463 - block
    b909 - block
    b794 - block
    b93 - block
    b626 - block
    b986 - block
    b573 - block
    b473 - block
    b472 - block
    b871 - block
    b595 - block
    b801 - block
    b344 - block
    b852 - block
    b430 - block
    b754 - block
    b416 - block
    b294 - block
    b382 - block
    b313 - block
    b733 - block
    b257 - block
    b960 - block
    b467 - block
    b800 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b542 )
    ( on b463 b542 )
    ( on b909 b463 )
    ( on b794 b909 )
    ( on b93 b794 )
    ( on b626 b93 )
    ( on b986 b626 )
    ( on b573 b986 )
    ( on b473 b573 )
    ( on b472 b473 )
    ( on b871 b472 )
    ( on b595 b871 )
    ( on b801 b595 )
    ( on b344 b801 )
    ( on b852 b344 )
    ( on b430 b852 )
    ( on b754 b430 )
    ( on b416 b754 )
    ( on b294 b416 )
    ( on b382 b294 )
    ( on b313 b382 )
    ( on b733 b313 )
    ( on b257 b733 )
    ( on b960 b257 )
    ( on b467 b960 )
    ( on b800 b467 )
    ( clear b800 )
  )
  ( :goal
    ( and
      ( clear b542 )
    )
  )
)

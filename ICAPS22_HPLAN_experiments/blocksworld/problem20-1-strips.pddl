( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b145 - block
    b300 - block
    b478 - block
    b560 - block
    b381 - block
    b527 - block
    b289 - block
    b189 - block
    b777 - block
    b928 - block
    b570 - block
    b634 - block
    b600 - block
    b391 - block
    b452 - block
    b93 - block
    b699 - block
    b989 - block
    b112 - block
    b869 - block
    b27 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b145 )
    ( on b300 b145 )
    ( on b478 b300 )
    ( on b560 b478 )
    ( on b381 b560 )
    ( on b527 b381 )
    ( on b289 b527 )
    ( on b189 b289 )
    ( on b777 b189 )
    ( on b928 b777 )
    ( on b570 b928 )
    ( on b634 b570 )
    ( on b600 b634 )
    ( on b391 b600 )
    ( on b452 b391 )
    ( on b93 b452 )
    ( on b699 b93 )
    ( on b989 b699 )
    ( on b112 b989 )
    ( on b869 b112 )
    ( on b27 b869 )
    ( clear b27 )
  )
  ( :goal
    ( and
      ( clear b145 )
    )
  )
)

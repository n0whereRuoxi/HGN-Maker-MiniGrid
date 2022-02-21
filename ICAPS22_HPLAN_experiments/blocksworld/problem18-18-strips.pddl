( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b70 - block
    b571 - block
    b960 - block
    b508 - block
    b865 - block
    b861 - block
    b24 - block
    b887 - block
    b357 - block
    b363 - block
    b344 - block
    b174 - block
    b552 - block
    b106 - block
    b762 - block
    b368 - block
    b162 - block
    b759 - block
    b613 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b70 )
    ( on b571 b70 )
    ( on b960 b571 )
    ( on b508 b960 )
    ( on b865 b508 )
    ( on b861 b865 )
    ( on b24 b861 )
    ( on b887 b24 )
    ( on b357 b887 )
    ( on b363 b357 )
    ( on b344 b363 )
    ( on b174 b344 )
    ( on b552 b174 )
    ( on b106 b552 )
    ( on b762 b106 )
    ( on b368 b762 )
    ( on b162 b368 )
    ( on b759 b162 )
    ( on b613 b759 )
    ( clear b613 )
  )
  ( :goal
    ( and
      ( clear b70 )
    )
  )
)

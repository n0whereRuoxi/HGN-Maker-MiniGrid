( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b872 - block
    b611 - block
    b337 - block
    b600 - block
    b665 - block
    b830 - block
    b540 - block
    b598 - block
    b357 - block
    b914 - block
    b45 - block
    b606 - block
    b359 - block
    b340 - block
    b499 - block
    b66 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b872 )
    ( on b611 b872 )
    ( on b337 b611 )
    ( on b600 b337 )
    ( on b665 b600 )
    ( on b830 b665 )
    ( on b540 b830 )
    ( on b598 b540 )
    ( on b357 b598 )
    ( on b914 b357 )
    ( on b45 b914 )
    ( on b606 b45 )
    ( on b359 b606 )
    ( on b340 b359 )
    ( on b499 b340 )
    ( on b66 b499 )
    ( clear b66 )
  )
  ( :tasks
    ( Make-15Pile b611 b337 b600 b665 b830 b540 b598 b357 b914 b45 b606 b359 b340 b499 b66 )
  )
)

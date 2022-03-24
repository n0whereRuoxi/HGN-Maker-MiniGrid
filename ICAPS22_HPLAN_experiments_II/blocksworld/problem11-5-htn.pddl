( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b619 - block
    b345 - block
    b435 - block
    b185 - block
    b533 - block
    b134 - block
    b82 - block
    b930 - block
    b503 - block
    b398 - block
    b32 - block
    b499 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b619 )
    ( on b345 b619 )
    ( on b435 b345 )
    ( on b185 b435 )
    ( on b533 b185 )
    ( on b134 b533 )
    ( on b82 b134 )
    ( on b930 b82 )
    ( on b503 b930 )
    ( on b398 b503 )
    ( on b32 b398 )
    ( on b499 b32 )
    ( clear b499 )
  )
  ( :tasks
    ( Make-11Pile b345 b435 b185 b533 b134 b82 b930 b503 b398 b32 b499 )
  )
)

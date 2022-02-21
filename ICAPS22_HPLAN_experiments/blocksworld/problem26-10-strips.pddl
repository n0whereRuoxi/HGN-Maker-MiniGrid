( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b725 - block
    b66 - block
    b125 - block
    b404 - block
    b561 - block
    b8 - block
    b610 - block
    b402 - block
    b383 - block
    b511 - block
    b563 - block
    b946 - block
    b894 - block
    b268 - block
    b599 - block
    b123 - block
    b937 - block
    b243 - block
    b115 - block
    b163 - block
    b972 - block
    b359 - block
    b542 - block
    b661 - block
    b111 - block
    b720 - block
    b79 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b725 )
    ( on b66 b725 )
    ( on b125 b66 )
    ( on b404 b125 )
    ( on b561 b404 )
    ( on b8 b561 )
    ( on b610 b8 )
    ( on b402 b610 )
    ( on b383 b402 )
    ( on b511 b383 )
    ( on b563 b511 )
    ( on b946 b563 )
    ( on b894 b946 )
    ( on b268 b894 )
    ( on b599 b268 )
    ( on b123 b599 )
    ( on b937 b123 )
    ( on b243 b937 )
    ( on b115 b243 )
    ( on b163 b115 )
    ( on b972 b163 )
    ( on b359 b972 )
    ( on b542 b359 )
    ( on b661 b542 )
    ( on b111 b661 )
    ( on b720 b111 )
    ( on b79 b720 )
    ( clear b79 )
  )
  ( :goal
    ( and
      ( clear b725 )
    )
  )
)

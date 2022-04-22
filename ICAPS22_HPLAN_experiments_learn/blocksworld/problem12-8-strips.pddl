( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b603 - block
    b415 - block
    b628 - block
    b600 - block
    b703 - block
    b934 - block
    b111 - block
    b180 - block
    b418 - block
    b135 - block
    b575 - block
    b967 - block
    b460 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b603 )
    ( on b415 b603 )
    ( on b628 b415 )
    ( on b600 b628 )
    ( on b703 b600 )
    ( on b934 b703 )
    ( on b111 b934 )
    ( on b180 b111 )
    ( on b418 b180 )
    ( on b135 b418 )
    ( on b575 b135 )
    ( on b967 b575 )
    ( on b460 b967 )
    ( clear b460 )
  )
  ( :goal
    ( and
      ( clear b603 )
    )
  )
)

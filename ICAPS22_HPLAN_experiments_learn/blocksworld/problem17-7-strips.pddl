( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b54 - block
    b633 - block
    b714 - block
    b57 - block
    b168 - block
    b815 - block
    b151 - block
    b263 - block
    b126 - block
    b79 - block
    b452 - block
    b692 - block
    b668 - block
    b460 - block
    b646 - block
    b828 - block
    b665 - block
    b564 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b54 )
    ( on b633 b54 )
    ( on b714 b633 )
    ( on b57 b714 )
    ( on b168 b57 )
    ( on b815 b168 )
    ( on b151 b815 )
    ( on b263 b151 )
    ( on b126 b263 )
    ( on b79 b126 )
    ( on b452 b79 )
    ( on b692 b452 )
    ( on b668 b692 )
    ( on b460 b668 )
    ( on b646 b460 )
    ( on b828 b646 )
    ( on b665 b828 )
    ( on b564 b665 )
    ( clear b564 )
  )
  ( :goal
    ( and
      ( clear b54 )
    )
  )
)

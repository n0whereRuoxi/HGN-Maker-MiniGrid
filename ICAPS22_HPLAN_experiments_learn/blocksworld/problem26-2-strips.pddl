( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b853 - block
    b120 - block
    b829 - block
    b227 - block
    b757 - block
    b937 - block
    b652 - block
    b156 - block
    b309 - block
    b5 - block
    b220 - block
    b420 - block
    b565 - block
    b351 - block
    b394 - block
    b979 - block
    b22 - block
    b109 - block
    b217 - block
    b303 - block
    b158 - block
    b797 - block
    b433 - block
    b924 - block
    b957 - block
    b635 - block
    b940 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b853 )
    ( on b120 b853 )
    ( on b829 b120 )
    ( on b227 b829 )
    ( on b757 b227 )
    ( on b937 b757 )
    ( on b652 b937 )
    ( on b156 b652 )
    ( on b309 b156 )
    ( on b5 b309 )
    ( on b220 b5 )
    ( on b420 b220 )
    ( on b565 b420 )
    ( on b351 b565 )
    ( on b394 b351 )
    ( on b979 b394 )
    ( on b22 b979 )
    ( on b109 b22 )
    ( on b217 b109 )
    ( on b303 b217 )
    ( on b158 b303 )
    ( on b797 b158 )
    ( on b433 b797 )
    ( on b924 b433 )
    ( on b957 b924 )
    ( on b635 b957 )
    ( on b940 b635 )
    ( clear b940 )
  )
  ( :goal
    ( and
      ( clear b853 )
    )
  )
)

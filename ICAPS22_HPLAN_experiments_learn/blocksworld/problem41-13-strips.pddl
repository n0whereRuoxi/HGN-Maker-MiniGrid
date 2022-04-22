( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b713 - block
    b211 - block
    b616 - block
    b166 - block
    b360 - block
    b825 - block
    b948 - block
    b210 - block
    b339 - block
    b610 - block
    b743 - block
    b516 - block
    b488 - block
    b341 - block
    b503 - block
    b858 - block
    b292 - block
    b42 - block
    b43 - block
    b284 - block
    b32 - block
    b90 - block
    b926 - block
    b552 - block
    b120 - block
    b204 - block
    b79 - block
    b641 - block
    b56 - block
    b745 - block
    b707 - block
    b364 - block
    b491 - block
    b758 - block
    b521 - block
    b309 - block
    b591 - block
    b667 - block
    b333 - block
    b191 - block
    b439 - block
    b792 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b713 )
    ( on b211 b713 )
    ( on b616 b211 )
    ( on b166 b616 )
    ( on b360 b166 )
    ( on b825 b360 )
    ( on b948 b825 )
    ( on b210 b948 )
    ( on b339 b210 )
    ( on b610 b339 )
    ( on b743 b610 )
    ( on b516 b743 )
    ( on b488 b516 )
    ( on b341 b488 )
    ( on b503 b341 )
    ( on b858 b503 )
    ( on b292 b858 )
    ( on b42 b292 )
    ( on b43 b42 )
    ( on b284 b43 )
    ( on b32 b284 )
    ( on b90 b32 )
    ( on b926 b90 )
    ( on b552 b926 )
    ( on b120 b552 )
    ( on b204 b120 )
    ( on b79 b204 )
    ( on b641 b79 )
    ( on b56 b641 )
    ( on b745 b56 )
    ( on b707 b745 )
    ( on b364 b707 )
    ( on b491 b364 )
    ( on b758 b491 )
    ( on b521 b758 )
    ( on b309 b521 )
    ( on b591 b309 )
    ( on b667 b591 )
    ( on b333 b667 )
    ( on b191 b333 )
    ( on b439 b191 )
    ( on b792 b439 )
    ( clear b792 )
  )
  ( :goal
    ( and
      ( clear b713 )
    )
  )
)

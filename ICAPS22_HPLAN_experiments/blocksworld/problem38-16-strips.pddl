( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b240 - block
    b934 - block
    b654 - block
    b354 - block
    b49 - block
    b379 - block
    b749 - block
    b134 - block
    b531 - block
    b508 - block
    b626 - block
    b909 - block
    b847 - block
    b769 - block
    b12 - block
    b740 - block
    b243 - block
    b940 - block
    b596 - block
    b806 - block
    b308 - block
    b409 - block
    b987 - block
    b515 - block
    b178 - block
    b418 - block
    b129 - block
    b339 - block
    b429 - block
    b564 - block
    b371 - block
    b912 - block
    b15 - block
    b391 - block
    b768 - block
    b757 - block
    b33 - block
    b843 - block
    b962 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b240 )
    ( on b934 b240 )
    ( on b654 b934 )
    ( on b354 b654 )
    ( on b49 b354 )
    ( on b379 b49 )
    ( on b749 b379 )
    ( on b134 b749 )
    ( on b531 b134 )
    ( on b508 b531 )
    ( on b626 b508 )
    ( on b909 b626 )
    ( on b847 b909 )
    ( on b769 b847 )
    ( on b12 b769 )
    ( on b740 b12 )
    ( on b243 b740 )
    ( on b940 b243 )
    ( on b596 b940 )
    ( on b806 b596 )
    ( on b308 b806 )
    ( on b409 b308 )
    ( on b987 b409 )
    ( on b515 b987 )
    ( on b178 b515 )
    ( on b418 b178 )
    ( on b129 b418 )
    ( on b339 b129 )
    ( on b429 b339 )
    ( on b564 b429 )
    ( on b371 b564 )
    ( on b912 b371 )
    ( on b15 b912 )
    ( on b391 b15 )
    ( on b768 b391 )
    ( on b757 b768 )
    ( on b33 b757 )
    ( on b843 b33 )
    ( on b962 b843 )
    ( clear b962 )
  )
  ( :goal
    ( and
      ( clear b240 )
    )
  )
)

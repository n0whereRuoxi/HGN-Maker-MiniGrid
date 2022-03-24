( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b215 - block
    b452 - block
    b313 - block
    b126 - block
    b340 - block
    b272 - block
    b839 - block
    b694 - block
    b302 - block
    b36 - block
    b846 - block
    b940 - block
    b121 - block
    b554 - block
    b930 - block
    b631 - block
    b975 - block
    b684 - block
    b123 - block
    b258 - block
    b363 - block
    b60 - block
    b89 - block
    b723 - block
    b790 - block
    b470 - block
    b767 - block
    b443 - block
    b879 - block
    b796 - block
    b524 - block
    b901 - block
    b691 - block
    b814 - block
    b246 - block
    b375 - block
    b334 - block
    b980 - block
    b460 - block
    b658 - block
    b792 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b215 )
    ( on b452 b215 )
    ( on b313 b452 )
    ( on b126 b313 )
    ( on b340 b126 )
    ( on b272 b340 )
    ( on b839 b272 )
    ( on b694 b839 )
    ( on b302 b694 )
    ( on b36 b302 )
    ( on b846 b36 )
    ( on b940 b846 )
    ( on b121 b940 )
    ( on b554 b121 )
    ( on b930 b554 )
    ( on b631 b930 )
    ( on b975 b631 )
    ( on b684 b975 )
    ( on b123 b684 )
    ( on b258 b123 )
    ( on b363 b258 )
    ( on b60 b363 )
    ( on b89 b60 )
    ( on b723 b89 )
    ( on b790 b723 )
    ( on b470 b790 )
    ( on b767 b470 )
    ( on b443 b767 )
    ( on b879 b443 )
    ( on b796 b879 )
    ( on b524 b796 )
    ( on b901 b524 )
    ( on b691 b901 )
    ( on b814 b691 )
    ( on b246 b814 )
    ( on b375 b246 )
    ( on b334 b375 )
    ( on b980 b334 )
    ( on b460 b980 )
    ( on b658 b460 )
    ( on b792 b658 )
    ( clear b792 )
  )
  ( :goal
    ( and
      ( clear b215 )
    )
  )
)

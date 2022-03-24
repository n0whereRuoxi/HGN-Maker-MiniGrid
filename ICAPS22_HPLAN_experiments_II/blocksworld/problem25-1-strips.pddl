( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b698 - block
    b140 - block
    b465 - block
    b726 - block
    b682 - block
    b616 - block
    b948 - block
    b274 - block
    b409 - block
    b640 - block
    b123 - block
    b571 - block
    b904 - block
    b602 - block
    b7 - block
    b54 - block
    b671 - block
    b836 - block
    b959 - block
    b473 - block
    b431 - block
    b554 - block
    b827 - block
    b363 - block
    b424 - block
    b819 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b698 )
    ( on b140 b698 )
    ( on b465 b140 )
    ( on b726 b465 )
    ( on b682 b726 )
    ( on b616 b682 )
    ( on b948 b616 )
    ( on b274 b948 )
    ( on b409 b274 )
    ( on b640 b409 )
    ( on b123 b640 )
    ( on b571 b123 )
    ( on b904 b571 )
    ( on b602 b904 )
    ( on b7 b602 )
    ( on b54 b7 )
    ( on b671 b54 )
    ( on b836 b671 )
    ( on b959 b836 )
    ( on b473 b959 )
    ( on b431 b473 )
    ( on b554 b431 )
    ( on b827 b554 )
    ( on b363 b827 )
    ( on b424 b363 )
    ( on b819 b424 )
    ( clear b819 )
  )
  ( :goal
    ( and
      ( clear b698 )
    )
  )
)

( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b875 - block
    b904 - block
    b730 - block
    b229 - block
    b422 - block
    b76 - block
    b982 - block
    b513 - block
    b880 - block
    b580 - block
    b407 - block
    b107 - block
    b278 - block
    b602 - block
    b940 - block
    b528 - block
    b100 - block
    b585 - block
    b283 - block
    b335 - block
    b644 - block
    b798 - block
    b116 - block
    b503 - block
    b614 - block
    b248 - block
    b120 - block
    b127 - block
    b892 - block
    b327 - block
    b385 - block
    b912 - block
    b494 - block
    b295 - block
    b383 - block
    b722 - block
    b794 - block
    b145 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b875 )
    ( on b904 b875 )
    ( on b730 b904 )
    ( on b229 b730 )
    ( on b422 b229 )
    ( on b76 b422 )
    ( on b982 b76 )
    ( on b513 b982 )
    ( on b880 b513 )
    ( on b580 b880 )
    ( on b407 b580 )
    ( on b107 b407 )
    ( on b278 b107 )
    ( on b602 b278 )
    ( on b940 b602 )
    ( on b528 b940 )
    ( on b100 b528 )
    ( on b585 b100 )
    ( on b283 b585 )
    ( on b335 b283 )
    ( on b644 b335 )
    ( on b798 b644 )
    ( on b116 b798 )
    ( on b503 b116 )
    ( on b614 b503 )
    ( on b248 b614 )
    ( on b120 b248 )
    ( on b127 b120 )
    ( on b892 b127 )
    ( on b327 b892 )
    ( on b385 b327 )
    ( on b912 b385 )
    ( on b494 b912 )
    ( on b295 b494 )
    ( on b383 b295 )
    ( on b722 b383 )
    ( on b794 b722 )
    ( on b145 b794 )
    ( clear b145 )
  )
  ( :goal
    ( and
      ( clear b875 )
    )
  )
)

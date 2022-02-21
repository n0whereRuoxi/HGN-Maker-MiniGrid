( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b281 - block
    b929 - block
    b323 - block
    b339 - block
    b831 - block
    b366 - block
    b618 - block
    b119 - block
    b836 - block
    b109 - block
    b403 - block
    b695 - block
    b762 - block
    b320 - block
    b728 - block
    b615 - block
    b763 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b281 )
    ( on b929 b281 )
    ( on b323 b929 )
    ( on b339 b323 )
    ( on b831 b339 )
    ( on b366 b831 )
    ( on b618 b366 )
    ( on b119 b618 )
    ( on b836 b119 )
    ( on b109 b836 )
    ( on b403 b109 )
    ( on b695 b403 )
    ( on b762 b695 )
    ( on b320 b762 )
    ( on b728 b320 )
    ( on b615 b728 )
    ( on b763 b615 )
    ( clear b763 )
  )
  ( :goal
    ( and
      ( clear b281 )
    )
  )
)

( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b915 - block
    b492 - block
    b378 - block
    b753 - block
    b170 - block
    b676 - block
    b46 - block
    b424 - block
    b289 - block
    b528 - block
    b58 - block
    b585 - block
    b217 - block
    b599 - block
    b838 - block
    b118 - block
    b509 - block
    b15 - block
    b671 - block
    b226 - block
    b239 - block
    b273 - block
    b796 - block
    b940 - block
    b362 - block
    b524 - block
    b943 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b915 )
    ( on b492 b915 )
    ( on b378 b492 )
    ( on b753 b378 )
    ( on b170 b753 )
    ( on b676 b170 )
    ( on b46 b676 )
    ( on b424 b46 )
    ( on b289 b424 )
    ( on b528 b289 )
    ( on b58 b528 )
    ( on b585 b58 )
    ( on b217 b585 )
    ( on b599 b217 )
    ( on b838 b599 )
    ( on b118 b838 )
    ( on b509 b118 )
    ( on b15 b509 )
    ( on b671 b15 )
    ( on b226 b671 )
    ( on b239 b226 )
    ( on b273 b239 )
    ( on b796 b273 )
    ( on b940 b796 )
    ( on b362 b940 )
    ( on b524 b362 )
    ( on b943 b524 )
    ( clear b943 )
  )
  ( :goal
    ( and
      ( clear b915 )
    )
  )
)

( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b78 - block
    b279 - block
    b742 - block
    b94 - block
    b74 - block
    b907 - block
    b618 - block
    b560 - block
    b617 - block
    b751 - block
    b586 - block
    b512 - block
    b291 - block
    b559 - block
    b783 - block
    b954 - block
    b626 - block
    b193 - block
    b686 - block
    b327 - block
    b653 - block
    b324 - block
    b984 - block
    b156 - block
    b343 - block
    b496 - block
    b492 - block
    b32 - block
    b177 - block
    b902 - block
    b909 - block
    b424 - block
    b740 - block
    b650 - block
    b825 - block
    b634 - block
    b602 - block
    b382 - block
    b353 - block
    b991 - block
    b858 - block
    b715 - block
    b315 - block
    b135 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b78 )
    ( on b279 b78 )
    ( on b742 b279 )
    ( on b94 b742 )
    ( on b74 b94 )
    ( on b907 b74 )
    ( on b618 b907 )
    ( on b560 b618 )
    ( on b617 b560 )
    ( on b751 b617 )
    ( on b586 b751 )
    ( on b512 b586 )
    ( on b291 b512 )
    ( on b559 b291 )
    ( on b783 b559 )
    ( on b954 b783 )
    ( on b626 b954 )
    ( on b193 b626 )
    ( on b686 b193 )
    ( on b327 b686 )
    ( on b653 b327 )
    ( on b324 b653 )
    ( on b984 b324 )
    ( on b156 b984 )
    ( on b343 b156 )
    ( on b496 b343 )
    ( on b492 b496 )
    ( on b32 b492 )
    ( on b177 b32 )
    ( on b902 b177 )
    ( on b909 b902 )
    ( on b424 b909 )
    ( on b740 b424 )
    ( on b650 b740 )
    ( on b825 b650 )
    ( on b634 b825 )
    ( on b602 b634 )
    ( on b382 b602 )
    ( on b353 b382 )
    ( on b991 b353 )
    ( on b858 b991 )
    ( on b715 b858 )
    ( on b315 b715 )
    ( on b135 b315 )
    ( clear b135 )
  )
  ( :goal
    ( and
      ( clear b78 )
    )
  )
)

( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b66 - block
    b641 - block
    b909 - block
    b509 - block
    b941 - block
    b487 - block
    b162 - block
    b767 - block
    b605 - block
    b823 - block
    b978 - block
    b566 - block
    b376 - block
    b32 - block
    b80 - block
    b262 - block
    b274 - block
    b925 - block
    b90 - block
    b810 - block
    b76 - block
    b515 - block
    b817 - block
    b210 - block
    b586 - block
    b202 - block
    b476 - block
    b882 - block
    b217 - block
    b830 - block
    b135 - block
    b428 - block
    b772 - block
    b467 - block
    b304 - block
    b71 - block
    b229 - block
    b92 - block
    b205 - block
    b390 - block
    b645 - block
    b36 - block
    b273 - block
    b441 - block
    b692 - block
    b17 - block
    b802 - block
    b352 - block
    b708 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b66 )
    ( on b641 b66 )
    ( on b909 b641 )
    ( on b509 b909 )
    ( on b941 b509 )
    ( on b487 b941 )
    ( on b162 b487 )
    ( on b767 b162 )
    ( on b605 b767 )
    ( on b823 b605 )
    ( on b978 b823 )
    ( on b566 b978 )
    ( on b376 b566 )
    ( on b32 b376 )
    ( on b80 b32 )
    ( on b262 b80 )
    ( on b274 b262 )
    ( on b925 b274 )
    ( on b90 b925 )
    ( on b810 b90 )
    ( on b76 b810 )
    ( on b515 b76 )
    ( on b817 b515 )
    ( on b210 b817 )
    ( on b586 b210 )
    ( on b202 b586 )
    ( on b476 b202 )
    ( on b882 b476 )
    ( on b217 b882 )
    ( on b830 b217 )
    ( on b135 b830 )
    ( on b428 b135 )
    ( on b772 b428 )
    ( on b467 b772 )
    ( on b304 b467 )
    ( on b71 b304 )
    ( on b229 b71 )
    ( on b92 b229 )
    ( on b205 b92 )
    ( on b390 b205 )
    ( on b645 b390 )
    ( on b36 b645 )
    ( on b273 b36 )
    ( on b441 b273 )
    ( on b692 b441 )
    ( on b17 b692 )
    ( on b802 b17 )
    ( on b352 b802 )
    ( on b708 b352 )
    ( clear b708 )
  )
  ( :goal
    ( and
      ( clear b66 )
    )
  )
)

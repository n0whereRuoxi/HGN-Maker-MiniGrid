( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b886 - block
    b694 - block
    b720 - block
    b423 - block
    b822 - block
    b94 - block
    b460 - block
    b332 - block
    b30 - block
    b377 - block
    b925 - block
    b116 - block
    b336 - block
    b76 - block
    b133 - block
    b65 - block
    b199 - block
    b378 - block
    b696 - block
    b242 - block
    b53 - block
    b14 - block
    b363 - block
    b624 - block
    b913 - block
    b532 - block
    b878 - block
    b57 - block
    b247 - block
    b290 - block
    b630 - block
    b73 - block
    b401 - block
    b919 - block
    b322 - block
    b58 - block
    b10 - block
    b591 - block
    b279 - block
    b774 - block
    b354 - block
    b21 - block
    b551 - block
    b253 - block
    b461 - block
    b715 - block
    b991 - block
    b379 - block
    b553 - block
    b548 - block
    b780 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b886 )
    ( on b694 b886 )
    ( on b720 b694 )
    ( on b423 b720 )
    ( on b822 b423 )
    ( on b94 b822 )
    ( on b460 b94 )
    ( on b332 b460 )
    ( on b30 b332 )
    ( on b377 b30 )
    ( on b925 b377 )
    ( on b116 b925 )
    ( on b336 b116 )
    ( on b76 b336 )
    ( on b133 b76 )
    ( on b65 b133 )
    ( on b199 b65 )
    ( on b378 b199 )
    ( on b696 b378 )
    ( on b242 b696 )
    ( on b53 b242 )
    ( on b14 b53 )
    ( on b363 b14 )
    ( on b624 b363 )
    ( on b913 b624 )
    ( on b532 b913 )
    ( on b878 b532 )
    ( on b57 b878 )
    ( on b247 b57 )
    ( on b290 b247 )
    ( on b630 b290 )
    ( on b73 b630 )
    ( on b401 b73 )
    ( on b919 b401 )
    ( on b322 b919 )
    ( on b58 b322 )
    ( on b10 b58 )
    ( on b591 b10 )
    ( on b279 b591 )
    ( on b774 b279 )
    ( on b354 b774 )
    ( on b21 b354 )
    ( on b551 b21 )
    ( on b253 b551 )
    ( on b461 b253 )
    ( on b715 b461 )
    ( on b991 b715 )
    ( on b379 b991 )
    ( on b553 b379 )
    ( on b548 b553 )
    ( on b780 b548 )
    ( clear b780 )
  )
  ( :goal
    ( and
      ( clear b886 )
    )
  )
)

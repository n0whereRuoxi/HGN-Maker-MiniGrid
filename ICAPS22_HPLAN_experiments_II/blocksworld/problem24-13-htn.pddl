( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b997 - block
    b762 - block
    b607 - block
    b989 - block
    b887 - block
    b25 - block
    b303 - block
    b90 - block
    b995 - block
    b544 - block
    b364 - block
    b718 - block
    b66 - block
    b149 - block
    b714 - block
    b84 - block
    b123 - block
    b937 - block
    b748 - block
    b605 - block
    b573 - block
    b634 - block
    b902 - block
    b564 - block
    b818 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b997 )
    ( on b762 b997 )
    ( on b607 b762 )
    ( on b989 b607 )
    ( on b887 b989 )
    ( on b25 b887 )
    ( on b303 b25 )
    ( on b90 b303 )
    ( on b995 b90 )
    ( on b544 b995 )
    ( on b364 b544 )
    ( on b718 b364 )
    ( on b66 b718 )
    ( on b149 b66 )
    ( on b714 b149 )
    ( on b84 b714 )
    ( on b123 b84 )
    ( on b937 b123 )
    ( on b748 b937 )
    ( on b605 b748 )
    ( on b573 b605 )
    ( on b634 b573 )
    ( on b902 b634 )
    ( on b564 b902 )
    ( on b818 b564 )
    ( clear b818 )
  )
  ( :tasks
    ( Make-24Pile b762 b607 b989 b887 b25 b303 b90 b995 b544 b364 b718 b66 b149 b714 b84 b123 b937 b748 b605 b573 b634 b902 b564 b818 )
  )
)

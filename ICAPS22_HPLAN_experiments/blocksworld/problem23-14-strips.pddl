( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b845 - block
    b925 - block
    b399 - block
    b555 - block
    b614 - block
    b124 - block
    b604 - block
    b900 - block
    b579 - block
    b360 - block
    b882 - block
    b225 - block
    b335 - block
    b375 - block
    b671 - block
    b922 - block
    b268 - block
    b157 - block
    b874 - block
    b217 - block
    b723 - block
    b471 - block
    b859 - block
    b851 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b845 )
    ( on b925 b845 )
    ( on b399 b925 )
    ( on b555 b399 )
    ( on b614 b555 )
    ( on b124 b614 )
    ( on b604 b124 )
    ( on b900 b604 )
    ( on b579 b900 )
    ( on b360 b579 )
    ( on b882 b360 )
    ( on b225 b882 )
    ( on b335 b225 )
    ( on b375 b335 )
    ( on b671 b375 )
    ( on b922 b671 )
    ( on b268 b922 )
    ( on b157 b268 )
    ( on b874 b157 )
    ( on b217 b874 )
    ( on b723 b217 )
    ( on b471 b723 )
    ( on b859 b471 )
    ( on b851 b859 )
    ( clear b851 )
  )
  ( :goal
    ( and
      ( clear b845 )
    )
  )
)

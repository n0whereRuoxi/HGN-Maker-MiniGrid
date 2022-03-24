( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b23 - block
    b774 - block
    b729 - block
    b211 - block
    b140 - block
    b31 - block
    b723 - block
    b494 - block
    b624 - block
    b421 - block
    b74 - block
    b845 - block
    b560 - block
    b515 - block
    b165 - block
    b216 - block
    b635 - block
    b73 - block
    b141 - block
    b946 - block
    b327 - block
    b243 - block
    b777 - block
    b926 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b23 )
    ( on b774 b23 )
    ( on b729 b774 )
    ( on b211 b729 )
    ( on b140 b211 )
    ( on b31 b140 )
    ( on b723 b31 )
    ( on b494 b723 )
    ( on b624 b494 )
    ( on b421 b624 )
    ( on b74 b421 )
    ( on b845 b74 )
    ( on b560 b845 )
    ( on b515 b560 )
    ( on b165 b515 )
    ( on b216 b165 )
    ( on b635 b216 )
    ( on b73 b635 )
    ( on b141 b73 )
    ( on b946 b141 )
    ( on b327 b946 )
    ( on b243 b327 )
    ( on b777 b243 )
    ( on b926 b777 )
    ( clear b926 )
  )
  ( :tasks
    ( Make-23Pile b774 b729 b211 b140 b31 b723 b494 b624 b421 b74 b845 b560 b515 b165 b216 b635 b73 b141 b946 b327 b243 b777 b926 )
  )
)

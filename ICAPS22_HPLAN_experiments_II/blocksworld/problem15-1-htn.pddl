( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b767 - block
    b331 - block
    b598 - block
    b552 - block
    b667 - block
    b963 - block
    b150 - block
    b464 - block
    b864 - block
    b216 - block
    b704 - block
    b223 - block
    b640 - block
    b96 - block
    b579 - block
    b60 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b767 )
    ( on b331 b767 )
    ( on b598 b331 )
    ( on b552 b598 )
    ( on b667 b552 )
    ( on b963 b667 )
    ( on b150 b963 )
    ( on b464 b150 )
    ( on b864 b464 )
    ( on b216 b864 )
    ( on b704 b216 )
    ( on b223 b704 )
    ( on b640 b223 )
    ( on b96 b640 )
    ( on b579 b96 )
    ( on b60 b579 )
    ( clear b60 )
  )
  ( :tasks
    ( Make-15Pile b331 b598 b552 b667 b963 b150 b464 b864 b216 b704 b223 b640 b96 b579 b60 )
  )
)

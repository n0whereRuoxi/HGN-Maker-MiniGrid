( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b755 - block
    b237 - block
    b620 - block
    b647 - block
    b563 - block
    b894 - block
    b594 - block
    b808 - block
    b343 - block
    b239 - block
    b478 - block
    b738 - block
    b340 - block
    b603 - block
    b576 - block
    b64 - block
    b924 - block
    b2 - block
    b191 - block
    b474 - block
    b677 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b755 )
    ( on b237 b755 )
    ( on b620 b237 )
    ( on b647 b620 )
    ( on b563 b647 )
    ( on b894 b563 )
    ( on b594 b894 )
    ( on b808 b594 )
    ( on b343 b808 )
    ( on b239 b343 )
    ( on b478 b239 )
    ( on b738 b478 )
    ( on b340 b738 )
    ( on b603 b340 )
    ( on b576 b603 )
    ( on b64 b576 )
    ( on b924 b64 )
    ( on b2 b924 )
    ( on b191 b2 )
    ( on b474 b191 )
    ( on b677 b474 )
    ( clear b677 )
  )
  ( :tasks
    ( Make-20Pile b237 b620 b647 b563 b894 b594 b808 b343 b239 b478 b738 b340 b603 b576 b64 b924 b2 b191 b474 b677 )
  )
)

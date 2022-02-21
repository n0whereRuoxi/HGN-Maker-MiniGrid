( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b842 - block
    b166 - block
    b513 - block
    b213 - block
    b750 - block
    b956 - block
    b851 - block
    b336 - block
    b413 - block
    b999 - block
    b429 - block
    b149 - block
    b774 - block
    b370 - block
    b278 - block
    b781 - block
    b884 - block
    b229 - block
    b728 - block
    b433 - block
    b423 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b842 )
    ( on b166 b842 )
    ( on b513 b166 )
    ( on b213 b513 )
    ( on b750 b213 )
    ( on b956 b750 )
    ( on b851 b956 )
    ( on b336 b851 )
    ( on b413 b336 )
    ( on b999 b413 )
    ( on b429 b999 )
    ( on b149 b429 )
    ( on b774 b149 )
    ( on b370 b774 )
    ( on b278 b370 )
    ( on b781 b278 )
    ( on b884 b781 )
    ( on b229 b884 )
    ( on b728 b229 )
    ( on b433 b728 )
    ( on b423 b433 )
    ( clear b423 )
  )
  ( :goal
    ( and
      ( clear b842 )
    )
  )
)

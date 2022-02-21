( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b206 - block
    b668 - block
    b635 - block
    b402 - block
    b518 - block
    b352 - block
    b868 - block
    b74 - block
    b440 - block
    b648 - block
    b285 - block
    b851 - block
    b591 - block
    b750 - block
    b909 - block
    b175 - block
    b106 - block
    b610 - block
    b572 - block
    b487 - block
    b207 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b206 )
    ( on b668 b206 )
    ( on b635 b668 )
    ( on b402 b635 )
    ( on b518 b402 )
    ( on b352 b518 )
    ( on b868 b352 )
    ( on b74 b868 )
    ( on b440 b74 )
    ( on b648 b440 )
    ( on b285 b648 )
    ( on b851 b285 )
    ( on b591 b851 )
    ( on b750 b591 )
    ( on b909 b750 )
    ( on b175 b909 )
    ( on b106 b175 )
    ( on b610 b106 )
    ( on b572 b610 )
    ( on b487 b572 )
    ( on b207 b487 )
    ( clear b207 )
  )
  ( :goal
    ( and
      ( clear b206 )
    )
  )
)

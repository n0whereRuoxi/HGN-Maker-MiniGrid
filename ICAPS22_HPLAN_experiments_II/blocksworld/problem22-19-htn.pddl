( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b861 - block
    b936 - block
    b991 - block
    b732 - block
    b19 - block
    b524 - block
    b70 - block
    b263 - block
    b704 - block
    b866 - block
    b331 - block
    b545 - block
    b418 - block
    b233 - block
    b390 - block
    b412 - block
    b61 - block
    b607 - block
    b150 - block
    b352 - block
    b349 - block
    b799 - block
    b501 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b861 )
    ( on b936 b861 )
    ( on b991 b936 )
    ( on b732 b991 )
    ( on b19 b732 )
    ( on b524 b19 )
    ( on b70 b524 )
    ( on b263 b70 )
    ( on b704 b263 )
    ( on b866 b704 )
    ( on b331 b866 )
    ( on b545 b331 )
    ( on b418 b545 )
    ( on b233 b418 )
    ( on b390 b233 )
    ( on b412 b390 )
    ( on b61 b412 )
    ( on b607 b61 )
    ( on b150 b607 )
    ( on b352 b150 )
    ( on b349 b352 )
    ( on b799 b349 )
    ( on b501 b799 )
    ( clear b501 )
  )
  ( :tasks
    ( Make-22Pile b936 b991 b732 b19 b524 b70 b263 b704 b866 b331 b545 b418 b233 b390 b412 b61 b607 b150 b352 b349 b799 b501 )
  )
)

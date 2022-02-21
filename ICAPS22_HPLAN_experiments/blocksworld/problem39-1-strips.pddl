( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b344 - block
    b95 - block
    b789 - block
    b59 - block
    b267 - block
    b238 - block
    b374 - block
    b127 - block
    b316 - block
    b646 - block
    b411 - block
    b483 - block
    b640 - block
    b282 - block
    b352 - block
    b442 - block
    b912 - block
    b923 - block
    b420 - block
    b900 - block
    b543 - block
    b9 - block
    b60 - block
    b346 - block
    b757 - block
    b61 - block
    b822 - block
    b355 - block
    b884 - block
    b454 - block
    b580 - block
    b642 - block
    b96 - block
    b810 - block
    b917 - block
    b280 - block
    b317 - block
    b71 - block
    b834 - block
    b668 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b344 )
    ( on b95 b344 )
    ( on b789 b95 )
    ( on b59 b789 )
    ( on b267 b59 )
    ( on b238 b267 )
    ( on b374 b238 )
    ( on b127 b374 )
    ( on b316 b127 )
    ( on b646 b316 )
    ( on b411 b646 )
    ( on b483 b411 )
    ( on b640 b483 )
    ( on b282 b640 )
    ( on b352 b282 )
    ( on b442 b352 )
    ( on b912 b442 )
    ( on b923 b912 )
    ( on b420 b923 )
    ( on b900 b420 )
    ( on b543 b900 )
    ( on b9 b543 )
    ( on b60 b9 )
    ( on b346 b60 )
    ( on b757 b346 )
    ( on b61 b757 )
    ( on b822 b61 )
    ( on b355 b822 )
    ( on b884 b355 )
    ( on b454 b884 )
    ( on b580 b454 )
    ( on b642 b580 )
    ( on b96 b642 )
    ( on b810 b96 )
    ( on b917 b810 )
    ( on b280 b917 )
    ( on b317 b280 )
    ( on b71 b317 )
    ( on b834 b71 )
    ( on b668 b834 )
    ( clear b668 )
  )
  ( :goal
    ( and
      ( clear b344 )
    )
  )
)

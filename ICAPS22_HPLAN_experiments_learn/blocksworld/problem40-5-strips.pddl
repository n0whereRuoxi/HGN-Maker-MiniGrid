( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b542 - block
    b945 - block
    b986 - block
    b596 - block
    b609 - block
    b650 - block
    b570 - block
    b247 - block
    b620 - block
    b369 - block
    b493 - block
    b879 - block
    b318 - block
    b962 - block
    b478 - block
    b261 - block
    b265 - block
    b82 - block
    b425 - block
    b765 - block
    b846 - block
    b451 - block
    b38 - block
    b790 - block
    b513 - block
    b399 - block
    b142 - block
    b172 - block
    b40 - block
    b840 - block
    b228 - block
    b78 - block
    b471 - block
    b774 - block
    b741 - block
    b750 - block
    b562 - block
    b696 - block
    b329 - block
    b524 - block
    b255 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b542 )
    ( on b945 b542 )
    ( on b986 b945 )
    ( on b596 b986 )
    ( on b609 b596 )
    ( on b650 b609 )
    ( on b570 b650 )
    ( on b247 b570 )
    ( on b620 b247 )
    ( on b369 b620 )
    ( on b493 b369 )
    ( on b879 b493 )
    ( on b318 b879 )
    ( on b962 b318 )
    ( on b478 b962 )
    ( on b261 b478 )
    ( on b265 b261 )
    ( on b82 b265 )
    ( on b425 b82 )
    ( on b765 b425 )
    ( on b846 b765 )
    ( on b451 b846 )
    ( on b38 b451 )
    ( on b790 b38 )
    ( on b513 b790 )
    ( on b399 b513 )
    ( on b142 b399 )
    ( on b172 b142 )
    ( on b40 b172 )
    ( on b840 b40 )
    ( on b228 b840 )
    ( on b78 b228 )
    ( on b471 b78 )
    ( on b774 b471 )
    ( on b741 b774 )
    ( on b750 b741 )
    ( on b562 b750 )
    ( on b696 b562 )
    ( on b329 b696 )
    ( on b524 b329 )
    ( on b255 b524 )
    ( clear b255 )
  )
  ( :goal
    ( and
      ( clear b542 )
    )
  )
)
